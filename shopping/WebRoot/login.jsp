<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="myCSS.css">


  </head>
  
  <body topmargin="0" background="image/background1.jpg">
    <br>
    
    <table width="100%" border="1">
  <tr>
    <td align="center"><jsp:include page="head.jsp"/></td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="1">
      <tr>
        <td align="center"><img src="image/second.jpg" width="859" height="80" /></td>
      </tr>
      <tr>
        <td align="center"><table bgcolor="#a1a1a1" width="45%" border="1" bordercolor="#66FF00">
          <tr>
            <td colspan="2" align="center"><span class="abc"><img src="image/register.gif" width="636" height="102" /></span></td>
            </tr>
             <form action="login_PIN_judge" method=post>
          <tr>
            <td width="50%" align="right"><span class="abc">user name:</span></td>
            <td align="left">              <span class="abc">
             
              <input type="text" name="textfield" id="textfield"  width="100" />
            </span></td>
          </tr>
          <tr>
            <td width="50%" align="right"><span class="abc">password:</span></td>
            <td align="left"><span class="abc">
              <input type="text" name="textfield2" id="textfield2" width="100" />
            </span></td>
          </tr>
          <tr>
            <td width="50%" align="right"><span class="abc">
            
              <input type="submit" name="button" id="button" value="login" /></form>
            </span></td>
            <td align="left"><span class="abc">
              <input type="submit" name="button2" id="button2" value="register" />
            </span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="right"><span class="abc">next</span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center"><jsp:include page="tail.jsp"/></td>
  </tr>
</table>
  </body>
</html>
