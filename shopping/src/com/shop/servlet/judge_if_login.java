package com.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.UserBean;

public class judge_if_login extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		//judge if user has login
		//we can see if there is any info about user in session
		UserBean ub=(UserBean)req.getSession().getAttribute("userINFO");
		if(ub==null)
		{
			// go to login.jsp
			req.getRequestDispatcher("login.jsp").forward(req, res);
		}	
		else
		{
			//go to cart_detail.jsp
			req.getRequestDispatcher("cart_detail.jsp").forward(req, res);
		}
	}

}
