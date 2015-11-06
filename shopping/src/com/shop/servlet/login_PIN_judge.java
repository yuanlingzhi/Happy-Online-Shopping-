package com.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.UserBean;
import com.shop.model.UserBeanBO;
import com.shop.model.goodsBean;
import com.shop.model.goodsBeanBO;
import com.shop.model.myCartBO;

public class login_PIN_judge extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		//get user_name and pin to verify if user is legal	
		String userName=req.getParameter("textfield");
		String userPasswd=req.getParameter("textfield2");
		
		UserBeanBO ubb=new UserBeanBO();
		if(ubb.checkUser(userName, userPasswd))
		{
			//go to cart_detail.jsp
			//we should put user's info into session
			UserBean ub=ubb.getUsers(userName);
			req.getSession().setAttribute("userINFO", ub);
//			System.out.println("SUCCEED");
			//get custom's goods'info 
			myCartBO mcb=(myCartBO)req.getSession().getAttribute("myCart");
			ArrayList<goodsBean> al =mcb.showMyCart();
			req.setAttribute("goodsINFO", al);
			
			
			req.getRequestDispatcher("cart_detail.jsp").forward(req, res);			
			
		}
		else {
			req.getRequestDispatcher("login.jsp").forward(req, res);
//			System.out.println("FAIL");
//			System.out.println(userName+" "+userPasswd);
		//	illegal
		}
	}

}
