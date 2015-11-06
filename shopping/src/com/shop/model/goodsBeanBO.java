package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//deal some business logics with goodsbean
public class goodsBeanBO 
{
	private ResultSet rs;
	private Connection con;
	private PreparedStatement ps;
	public goodsBean getGoodBean(String id)
	{
		goodsBean gb=new goodsBean();
		try {
			ConDB ct=new ConDB();
			con=ct.getCon();
			ps=con.prepareStatement("select * from goods where goodsID=?");
			ps.setString(1, id);
			rs=ps.executeQuery();
			if(rs.next())
			{
				gb.setGoodsID(rs.getString(1));
				gb.setGoodsNAME(rs.getString(2));
				gb.setGoodsINTRO(rs.getString(3));
				gb.setGoodsPRICE(rs.getString(4));
				gb.setGoodsNUM(rs.getString(5));
				gb.setGoodsPHOTO(rs.getString(6));
				gb.setType(rs.getString(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally
		{
			close();
		}
		return gb;
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
	//paging
	public ArrayList<goodsBean> paging(int pageSize,int pageNow)
	{
		ArrayList<goodsBean> al=new ArrayList<goodsBean>();
		try {
			con=new ConDB().getCon();
			ps=con.prepareStatement("select top "+pageSize+" * from goods where goodsID not in(select top "+((pageNow-1)*pageSize)+" goodsID from goods)");
			rs=ps.executeQuery();
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
				al.add(gb);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally
		{
			this.close();
		}
		return al;
	}
	public int getPageCount(int pageSize)
	{
		int sum=-1;
		int pageCount=-1;
		try {
			con=new ConDB().getCon();
			ps=con.prepareStatement("select count(*) from goods ");
			rs=ps.executeQuery();
			if(rs.next())
			{
				sum=Integer.parseInt(rs.getString(1));
			}
			if(sum%pageSize==0)
			{
				pageCount=sum/pageSize;
			}else {
				pageCount=(sum/pageSize)+1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			close();
		}
		return pageCount;
	}
}
