<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%><%@page import="com.shop.model.order_detail_Bean"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
order_detail_Bean odb=(order_detail_Bean)request.getAttribute("orderDetail");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order_detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="myCSS.css">


  </head>
  
  <body class="abc" topmargin="0" background="image/background1.jpg">
   <table width="100%" border="1">
  <tr>
    <td align="center">
    <jsp:include page="head.jsp"/></td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="1">
      <tr>
        <td colspan="6" align="center"><table width="100%" border="1">
          <tr>
            <td align="center">
            
            <img src="image/succeed.gif" width="1079" height="80">
            </td>
          </tr>
        </table>
          order detail</td>
        </tr>
      <tr>
        <td width="11%" align="center">order id</td>
        <td width="14%" align="center">consignee</td>
        <td width="20%" align="center">email address</td>
        <td width="20%" align="center">phone number</td>
        <td width="10%" align="center">total price</td>
        <td width="14%" align="center">grade</td>
        <td width="11%" align="center">&nbsp;</td>
        </tr>        
      <tr>      
        <td align="center"><%=odb.getOrderID() %></td>
        <td align="center"><%=odb.getConsignee() %></td>
        <td align="center"><%=odb.getEmailAddress() %></td>
        <td align="center"><%=odb.getPhone() %></td>
        <td align="center"><%=odb.getTotalPrice() %></td>
        <td align="center"><%=odb.getGrade() %></td>
        <td align="center">check detail</td>
        </tr>
      <tr>
        <td colspan="6" align="center">your order is submit,we will send you a email in order to comfirm the information about this order</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center">
    <jsp:include page="tail.jsp"/></td>
  </tr>
</table>
   <br>
  </body>
</html>
