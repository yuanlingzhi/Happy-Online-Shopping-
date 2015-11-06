<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%><%@page import="com.shop.model.goodsBean"%>
<%@page import="com.shop.model.myCartBO"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<goodsBean> al=(ArrayList)request.getAttribute("mycart");
myCartBO mcb=(myCartBO)(request.getSession().getAttribute("myCart"));

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="myCSS.css">

  </head>
  
  <body topmargin="0" background="image/background1.jpg">
    <center>
<table width="80%" border="1" class="abc">
  <tr>
    <td align="center">
    <jsp:include page="head.jsp"/>
    </td>
  </tr>
  <tr>
    <td align="center">
    
    <form action="myCartServlet?type=update" method=post>
    <table width="100%" border="1">
      <tr>
        <td colspan="6" align="center"><span class="abc"><img src="image/first.jpg" width="859" height="80"></span></td>
        </tr>
      <tr>
        <td width="11%" align="center"><span class="abc">id</span></td>
        <td width="32%" align="center"><span class="abc">name</span></td>
        <td width="35%" align="center"><span class="abc">price</span></td>
        <td colspan="3" align="center"><span class="abc">number</span></td>
      </tr>
      <%
      	if(al!=null)
      	{
      	for(int i=0;i<al.size();i++)
      	{
      		goodsBean gb=new goodsBean();
      		gb=al.get(i);
      		%>
		      	 <tr>
		       	 <td height="22" align="center"><span class="abc"><%=gb.getGoodsID() %></span></td>
		       	 <td align="center"><span class="abc"><%=gb.getGoodsNAME() %></span></td> 
		       	 <td align="center"><span class="abc"><%=gb.getGoodsPRICE() %></span></td>
		       	 <td width="6%" align="center">          <span class="abc">
		       	 
		       	  <input name="newNum" type="text" id="textfield" size="6" value=<%=mcb.numberOfGoods(gb.getGoodsID()) %>>
		       	  
		       	   <input name="id" type="hidden" value=<%=gb.getGoodsID() %>>
		      	  </span></td>
		       	 <td width="8%" align="center"><span class="abc">
		       	 <a href="myCartServlet?type=delete&id=<%=gb.getGoodsID()%>"> delete</a></span></td>
		       	 <td width="8%" align="center"><span class="abc">
		       	 <a href="showGoodsServlet?type=showDetail&id=<%=gb.getGoodsID() %>">check</a></span></td>
		     	 </tr>
      		<%
      	}
      	}
       %> 
       </form>     
      <tr>
        <td>&nbsp;</td>
        <td align="center"><form name="form1" method="post" action="myCartServlet">
          <span class="abc">
          <input type="submit" name="type"  value="delete_all">
          </span>
        </form></td>
        <td align="center">
          <span class="abc">
          <input type="submit" name="alter"  value="alter">
          </span>
        </td>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="6">&nbsp;</td>
        </tr>
        
        
        
      <tr>
        <td colspan="6"><table width="100%" border="1">
          <tr>
            <td width="50%"><span class="abc">information:your total goods's price is <%=mcb.returnSum() %>&nbsp;&nbsp;
            <a href="index.jsp">click to return</a></span></td>
            <td width="50%" align="right"><span class="abc">
            <a href="judge_if_login">next</a></span></td>
          </tr>
        </table></td>
        </tr>      
    </table></td>
    
  </tr>
	 
  <tr>
    <td align="center">
    <jsp:include page="tail.jsp"/></td>
  </tr>
</table>
<p class="abc">&nbsp;</p>

    
    </center>
  </body>
</html>
