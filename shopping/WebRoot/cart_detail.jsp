<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%><%@page import="com.shop.model.UserBean"%><%@page import="com.shop.model.goodsBean"%>
<%@page import="com.shop.model.myCartBO"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//get user's info and good's info
UserBean ub=(UserBean)request.getSession().getAttribute("userINFO");
ArrayList al=(ArrayList)request.getAttribute("goodsINFO");
myCartBO mcb=(myCartBO)(request.getSession().getAttribute("myCart"));
goodsBean gb=null;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cart_detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="myCSS.css">


  </head>
  
  <body topmargin="0" background="image/background1.jpg">
    <table width="100%" border="1" align="center">
  <tr>
    <td align="center">
    <jsp:include page="head.jsp"/>
    </td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="1">
      <tr>
        <td align="center"><span class="abc"><img src="image/third.jpg" width="859" height="80" /></span></td>
      </tr>
      <tr>
        <td align="center"><table width="70%" border="1">
          <tr>
            <td colspan="2" align="center"><span class="abc">user's information</span></td>
            </tr>
          <tr>
            <td align="right"><span class="abc">user :</span> </td>
            <td width="50%" align="left">              <span class="abc">
              <input type="text" name="textfield" id="textfield" value="<%=ub.getUserID()%>" />
            </span></td>
          </tr>
          <tr>
            <td align="right"><span class="abc">*true name:</span></td>
            <td width="50%" align="left"><span class="abc">
              <input type="text" name="textfield2" id="textfield2" value="<%=ub.getUserNA() %> "/>
            </span></td>
          </tr>
          <tr>
            <td align="right"><span class="abc">*cellphone:</span></td>
            <td width="50%" align="left"><span class="abc">
              <input type="text" name="textfield4" id="textfield4" value="<%=ub.getUserPHONE()%>" />
            </span></td>
          </tr>
          <tr>
            <td align="right"><span class="abc">*emai:</span></td>
            <td width="50%" align="left"><span class="abc">
              <input type="text" name="textfield5" id="textfield5" value="<%=ub.getUserEMAIL() %>"/>
            </span></td>
          </tr>
          <tr>
            <td align="right"><span class="abc">
              <input type="submit" name="button" id="button" value="submit form" />
            </span></td>
            <td width="50%" align="left"><span class="abc">
              <input type="submit" name="button2" id="button2" value="change my info" />
            </span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="center"><table width="70%" border="1">
          <tr>
            <td colspan="4" align="center"><span class="abc">my cart's information</span></td>
            </tr>
          <tr>
            <td width="25%" align="center"><span class="abc">id</span></td>
            <td width="25%" align="center"><span class="abc">good's name</span></td>
            <td width="25%" align="center"><span class="abc">price per</span></td>
            <td align="center"><span class="abc">number</span></td>
          </tr>
          <%
          	for(int i=0;i<al.size();i++)
          	{
          		%>
          		<tr>
          		<%
          		gb=(goodsBean)al.get(i);
          	
           %> 
            <td width="25%" align="center"><%=gb.getGoodsID()%></td>
            <td width="25%" align="center"><%=gb.getGoodsNAME() %></td>
            <td width="25%" align="center"><%=gb.getGoodsPRICE() %></td>
            <td align="center"><%=mcb.numberOfGoods(gb.getGoodsID()) %></td>
          </tr>
          <%
          }
           %>              
          <tr>
            <td colspan="4" align="left"><span class="abc">your all goods' price is <%=mcb.returnSum() %> .</span></td>
            </tr>
          <tr>
            <td colspan="4" align="center"><span class="abc">
              <input type="submit" name="button3" id="button3" value="return to cart" />
            </span></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td align="right"><span class="abc"> return&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <a href="order_deal_db_servlet">next</a> </span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center">
    <jsp:include page="tail.jsp"/>
    </td>
  </tr>
</table>
     <br>
  </body>
</html>
