package com.shop.model;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//this is used for add info into db which include orders and ordersDetail
public class orderBeanBO
{
	private ResultSet rs;
	private Connection con;
	private PreparedStatement ps;
	public order_detail_Bean addOrder(myCartBO mcb,String userID)
	{
		boolean b=true;
		order_detail_Bean odb=new order_detail_Bean();
		try {
			con=new ConDB().getCon();
			ps=con.prepareStatement("insert into orders (userID,isPAYED,totalPRICE) values(?,?,?)");
			ps.setString(1, userID);
			ps.setString(2,0+"");                //change to String type
			ps.setString(3, mcb.returnSum()+"");
			int flag=ps.executeUpdate();
			if(flag==1)
			{
				
				//succeed
				b=true;
				//we should get ordersID value , it's request in the section below
				//we can get the last ordersID in orders,that is what i need
				ps=con.prepareStatement("select max(ordersID) from orders");
				rs=ps.executeQuery();
				int orderID=0;
				if(rs.next())
				{
					orderID=rs.getInt(1);
				}
				else
				{
					b=false;
				}
				
				// next we should add information into orderDetail sheet
				
				ArrayList al=mcb.showMyCart();
				Statement sm=con.createStatement();
				
				for (int i = 0; i < al.size(); i++) 
				{
					goodsBean gb=(goodsBean)al.get(i);
					sm.addBatch("insert into orderDetail values('"+orderID+"','"+gb.getGoodsID()+"','"+mcb.numberOfGoods(gb.getGoodsID())+"')");//quantity add
					  //execute almost all the sql order in one time
					sm.executeBatch();
				} 
				String sql="select a.ordersID, b.userNA, b.userEMAIL, b.userPHONE, b.grade from orders a inner join users b on a.userID=b.userID where ordersID="+orderID;
				ps=con.prepareStatement(sql);
				rs=ps.executeQuery();
				if(rs.next())
				{
					odb.setOrderID(rs.getInt(1));
					odb.setConsignee(rs.getString(2));
					odb.setEmailAddress(rs.getString(3));
					odb.setPhone(rs.getString(4));
					odb.setGrade(rs.getString(5));
					odb.setTotalPrice(mcb.returnSum()+"");
				}
				else {
					b=false;
				}
			}
			else
			{
				//failed
				b=false;
			}			
		} catch (Exception e) {
			b=false;
			e.printStackTrace();
		}
		finally
		{
			close();
		}
		if(b)
		{
			return odb;
		}
		else {
			return null;
		}
	}
	public void close()
	{
		try {
			if(rs!=null)
			{
				rs.close();
				rs=null;
			}
			if(ps!=null)
			{
				ps.close();
				ps=null;
			}
			if(con!=null)
			{
				con.close();
				con=null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
