package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class myCartBO 
{
	private ResultSet rs;
	private Connection con;
	private PreparedStatement ps;
	HashMap hm=new HashMap<String,String>();
	private  int sum=0;
	private boolean flag=true;
	public void addGoods(String id,String num)
	{
		hm.put(id, num);		
	}
	public void deleteGoods(String id)
	{
		hm.remove(id);
	}
	public void clearCart()
	{
		hm.clear();
		flag=false;
	}
	public void updateGoodsNum(String id,String NewNum)
	{
		hm.put(id, NewNum);
	}
	public String numberOfGoods(String id)
	{
		return (String)hm.get(id);
	}
	public ArrayList<goodsBean> showMyCart()
	{
//		System.out.println(hm==null);
		ArrayList<goodsBean> al=new ArrayList<goodsBean>();
		String sub="(";		
		try {	
			if(flag)
			{
			Iterator it=hm.keySet().iterator();
//				System.out.println("normal");
				while(it.hasNext())
				{
					String goodsID=(String)it.next();
					if(it.hasNext())
					{
						sub+=goodsID+",";
					}
					else {
						sub+=goodsID+")";
					}
				}
				String sql="select * from goods where goodsID in"+sub;
				con=new ConDB().getCon();
				ps=con.prepareStatement(sql);
				rs=ps.executeQuery();
				sum=0;
				while(rs.next())
				{
					goodsBean gb=new goodsBean();
					gb.setGoodsID(rs.getString(1));
					gb.setGoodsNAME(rs.getString(2));
					gb.setGoodsINTRO(rs.getString(3));
					gb.setGoodsPRICE(rs.getString(4));
					
					
					gb.setGoodsNUM(rs.getString(5));
					gb.setGoodsPHOTO(rs.getString(6));
					gb.setType(rs.getString(7));
					int temp=Integer.parseInt(rs.getString(4));
			//		int number=Integer.parseInt(gb.getGoodsNUM());
			//		sum=sum+temp*number;  because differen from db
					String number_temp=(String)hm.get(gb.getGoodsID());
					int number=Integer.parseInt(number_temp);
					sum=sum+temp*number;
			//		System.out.println(sum,temp,number);
					al.add(gb);
				}	
			}
			else {
//				System.out.println("fuck");
				al=null;
				sum=0;
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			close();
		}
		return al;
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
	public int returnSum()
	{
		return sum;
	}
}
