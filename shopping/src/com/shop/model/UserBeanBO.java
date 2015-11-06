package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sun.xml.internal.ws.Closeable;

public class UserBeanBO 
{
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	public boolean checkUser(String u,String p)
	{
		boolean b=false;
		try {
			con=new ConDB().getCon();
			ps=con.prepareStatement("select top 1 userPASSWD from users where userNA=?");
			ps.setString(1, u);
			rs=ps.executeQuery();
			if(rs.next())
			{
				String temp_p=rs.getString(1);
				if(p.equals(temp_p.trim()))
				{
					//legal
					b=true;
					System.out.println(temp_p+" "+p+"b=true");
				}
				else {
					//illegal
				}
				System.out.println(temp_p+" "+p+"b=false");
			}
			else {
				//illegal
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally
		{
			close();
		}		
		return b;
	}
	public void close()
	{
		try {
			if(rs!=null)
			{
				rs.close();
			}
			if(ps!=null)
			{
				ps.close();
			}
			if(con!=null)
			{
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public UserBean getUsers(String uName)
	{
		UserBean ub=new UserBean();
		try {
			con=new ConDB().getCon();
			ps=con.prepareStatement("select top 1 * from users where userNA=?");
			ps.setString(1, uName);
			rs=ps.executeQuery();
			if(rs.next())
			{
				ub.setUserID(rs.getString(1));
				ub.setUserNA(rs.getString(2));
				ub.setUserPASSWD(rs.getString(3));
				ub.setUserEMAIL(rs.getString(4));
				ub.setUserPHONE(rs.getString(5));
				ub.setGrade(rs.getString(6));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			close();
		}
		return ub;
	}
}
