package com.shop.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ConDB
{
	private Connection con=null;
	public Connection getCon()
	{
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=text1","lee","");
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return con;
	}
//	public Connection getCon()
//	{		
//		String url="jdbc:sqlserver://localhost:1433;DatabaseName=text1";
//		String user="lee";
//		String pa="";
//		try {             
//			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	
	///      fuck   url �� user �� pa ֮��������ţ�����������������ɵ��ô
	
	
//			con=DriverManager.getConnection("url","user","pa");			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return con;
//	}
}
