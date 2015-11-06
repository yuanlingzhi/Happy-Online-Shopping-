package com.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.UserBean;
import com.shop.model.myCartBO;
import com.shop.model.orderBeanBO;
import com.shop.model.order_detail_Bean;
//write the orders into db
public class order_deal_db_servlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}


	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		orderBeanBO obb=new orderBeanBO();
		myCartBO mcb=(myCartBO)req.getSession().getAttribute("myCart");
		UserBean ub=(UserBean)req.getSession().getAttribute("userINFO");
		String userID=ub.getUserID();
		System.out.println(userID);
		order_detail_Bean odb=obb.addOrder(mcb, userID);
		if(odb!=null)
		{
			System.out.println("succeed");
			req.setAttribute("orderDetail",odb );
			req.getRequestDispatcher("order_detail.jsp").forward(req, res);
		}
		else {
			req.getRequestDispatcher("cart_detail.jsp").forward(req, res);
		}
		
	}

}
