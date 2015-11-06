package com.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.model.goodsBean;
import com.shop.model.myCartBO;

public class myCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		PrintWriter pw=res.getWriter();
		String type=req.getParameter("type");
		myCartBO mcb=(myCartBO)req.getSession().getAttribute("myCart");
		if(mcb==null)
		{
			//first time to shop ,we need create a cart and put the goods in it
			mcb=new myCartBO(); 
			req.getSession().setAttribute("myCart", mcb);
		} 
		
		if(type.equals("add"))
		{
	//		pw.print(req.getParameter("id")) ;
			String goodsID=req.getParameter("id");
			
		//	myCartBO mcb=new myCartBO();
			//default: buy one book everytime			
			mcb.addGoods(goodsID, "1");
		}else if(type.equals("delete"))
		{
			String goodsID=req.getParameter("id");
			mcb.deleteGoods(goodsID);		
		}
		else if(type.equals("show"))
		{
			
		}
		else if(type.equals("delete_all"))
		{
			mcb.clearCart();
		}
		else if (type.equals("update"))
		{
			String goodsID[]=req.getParameterValues("id");
			String newNum[]=req.getParameterValues("newNum");
			for (int i = 0; i < newNum.length; i++) {
		//		System.out.println("goodsID:"+goodsID[i]+" newNum:"+newNum[i]);
				mcb.updateGoodsNum(goodsID[i], newNum[i]);
			}
		}
		ArrayList<goodsBean> al=mcb.showMyCart();
		req.setAttribute("mycart", al);
		req.getRequestDispatcher("cart.jsp").forward(req, res);	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
