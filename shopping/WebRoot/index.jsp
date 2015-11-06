<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="myCSS.css">


  </head>
  
  <body topmargin="0" background="image/background1.jpg">
    <table width="80%" border="1" align="center">
  <tr>
    <td height="53" colspan="2" align="center">
    <jsp:include page="head.jsp"></jsp:include>
	</td>
  </tr>
  <tr>
    <td width="19%" height="342" align="center" valign="top">
    <jsp:include page="left.jsp"/>
    </td>
    <td width="81%" align="center" valign="top">
    <jsp:include page="right.jsp"/>
    </td>
  </tr>
  <tr>
    <td height="74" colspan="2" align="center">
    <jsp:include page="tail.jsp"/>
    </td>
  </tr>
</table> <br>
  </body>
</html>
