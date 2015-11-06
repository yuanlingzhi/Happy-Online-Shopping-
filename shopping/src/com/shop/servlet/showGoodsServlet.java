package com.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.goodsBean;
import com.shop.model.goodsBeanBO;

public class showGoodsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		PrintWriter pw=res.getWriter();
		//get type from right.jsp to judge if user want do which kind of business
		String type=req.getParameter("type");		
		if(type.equals("showDetail"))
		{
		//we can get goods's id from the front page
		String id=req.getParameter("id");
		//we use this id, we can get all information from db, then we need use goodsBeanBO to search
		goodsBeanBO gbbo=new goodsBeanBO();
		goodsBean gb=new goodsBean();
		gb=gbbo.getGoodBean(id);
		//put into request
		req.setAttribute("goodsINFO", gb);
		//direct to another page
		req.getRequestDispatcher("showDetail.jsp").forward(req, res);
		}
		else if(type.equals("paging"))
		{
			//get pageNow
			String pageNow=req.getParameter("pageNow");
			req.setAttribute("pageNow", pageNow);
			
			req.getRequestDispatcher("index.jsp").forward(req, res);
		}
	}
}
