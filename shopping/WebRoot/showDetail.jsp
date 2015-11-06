<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%><%@page import="com.shop.model.goodsBean"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//get the information we want show to custom
goodsBean gb= (goodsBean)request.getAttribute("goodsINFO");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="myCSS.css">
	

  </head>
  
  <body background="image/background1.jpg" topmargin="0">
  <center>
   
<table class="abc" width="100%" border="1">
  <tr>
    <td align="center">
    <jsp:include page="head.jsp"/></td>
  </tr>
  <tr>
    <td height="255" align="center"><table width="100%" border="1">
      <tr>
        <td colspan="2">&nbsp;</td>
        </tr>
      <tr>
        <td width="18%" rowspan="8" ><img src="image/<%=gb.getGoodsPHOTO()%>" width="136" height="169"></td>
        <td width="82%" align="center"><%=gb.getGoodsNAME() %></td>
      </tr>
      <tr>
        <td>glamour:<%=gb.getGoodsNUM() %></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>NO.<%=gb.getGoodsID()%></td>
      </tr>
      <tr>
        <td>type:<%=gb.getType()%></td>
      </tr>
      <tr>
        <td>publisher: YLZ</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="63">introduction: <%=gb.getGoodsINTRO()%> </td>
      </tr>
      <tr>
        <td height="28" colspan="2"><form  method="post" action="myCartServlet">
        <input type="hidden" name="type"  value="add">
          <input type="hidden" name="id" value="<%=gb.getGoodsID()%>">
          <input type="submit" name="buy"  value="buy it"></form>
          <form  method="post" action="index.jsp">
          <input type="submit" name="return"  value="return"></form></td>        
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center">
    <jsp:include page="tail.jsp"/>
	</td>
  </tr>
</table>


  </center>
  </body>
</html>
