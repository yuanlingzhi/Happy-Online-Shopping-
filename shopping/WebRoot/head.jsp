<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="myCSS.css" rel="stylesheet" type="text/css" />
<table width="100%" border="1" class="abc">
  <tr>
    <td colspan="3" height=10 bgcolor="#FF99CC"></td>
  </tr>
  <tr>
    <td width="20%" height="103"><img src="image/logo.jpg" width="102" height="70" /></td>
    <td width="55%">  <img src="image/logo1.jpg" width="287" height="83" /></td>
    <td width="25%"><p><img src="image/logo2.jpg" width="25" height="25" />  &lt;my account&gt;</p>
<p><img src="image/logo3.jpg" width="25" height="25" />  <a href="myCartServlet?type=show"> &lt;my shopping&gt;</a></p></td>
  </tr>
  <tr>
    <td colspan="3" height=10 bgcolor="#FF99FF"></td>
  </tr>
  <tr>
    <td colspan="3" bgcolor="#FF99FF"><table width="100%" border="1">
      <tr>
        <td width="11%" bgcolor="#FFCC99">&nbsp;</td>
        <td width="11%" bgcolor="#FFCC99" class="navigate">home</td>
        <td width="11%" bgcolor="#FFCC99">&nbsp;</td>
        <td width="11%" bgcolor="#FFCC99" class="navigate">hongkong film</td>
        <td width="11%" bgcolor="#FFCC99">&nbsp;</td>
        <td width="11%" bgcolor="#FFCC99" class="navigate">inland film</td>
        <td width="11%" bgcolor="#FFCC99">&nbsp;</td>
        <td width="11%" bgcolor="#FFCC99" class="navigate">about us</td>
        <td width="9%" bgcolor="#FFCC99">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
