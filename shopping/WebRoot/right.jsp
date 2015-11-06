<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%><%@page import="com.shop.model.goodsBeanBO"%><%@page import="com.shop.model.goodsBean"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
goodsBeanBO gbb=new goodsBeanBO();
//get pageNow

String s=(String)request.getAttribute("pageNow");
int pageNow=1;
if(s!=null)
{
	int s_pageNow=Integer.parseInt(s);
	pageNow=s_pageNow;	
}
ArrayList al=gbb.paging(6,pageNow);
int pageCount=gbb.getPageCount(6);
%>

<link href="myCSS.css" rel="stylesheet" type="text/css">
<table width="100%" border="0">
  <tr>
    <td colspan="3" align="left" valign="middle"><span class="abc"><img src="image/title.jpg" width="150" height="12%">pay close attention to me:</span></td>
  </tr>
  <%
  		int flag=0;
  		for(int i=0;i<2;i++)
  		{
  			%>
  			<tr>  			
  			<%
  			for(int j=0;j<3;j++)
  			{
  				goodsBean gb=new goodsBean();
  				if(flag>=al.size())
  				{
	  				gb.setGoodsID("0");
  					gb.setGoodsINTRO("we have no PHOTO");
  					gb.setGoodsNAME("sorry, we haven't PIC");
  					gb.setGoodsNUM("0");
  					gb.setGoodsPHOTO("no_photo.jpg");
  					gb.setGoodsPRICE("0");
  					gb.setType("0");
  				}
  				else
  				{  	
  					gb = (goodsBean)al.get(flag);
	  				flag++;	
  				}
  			%>
  	<td width="33%" align="center"><table width="100%" height="170" border="0">
   		<tr>
     		 <td width="32%" rowspan="3"><h1><span class="abc"><img src="image/<%=gb.getGoodsPHOTO() %>" width="112" height="120"></span></h1></td>
        <td width="68%" height="40">&nbsp;</td>
     		 </tr>
     		 <tr>
     		   <td height="37"><span class="abc">
     		   <a href="showGoodsServlet?type=showDetail&id=<%=gb.getGoodsID() %>">name:<%=gb.getGoodsNAME() %></a></span></td>
    		  </tr>
    		  <tr>
    		    <td height="44"><span class="abc">amount:<%=gb.getGoodsNUM()%></span></td>
   		   </tr>
  		    <tr>
    		    <td colspan="2"><span class="abc">introduce:<%=gb.getGoodsINTRO() %></span></td>
    		    </tr>
  		  </table></td>
  					<%
  			}
  			%>
  			</tr>
  			<%
  			if(i==0)
  			{%>
  			 	 <tr>
    <td colspan="3" align="center" height="24" bgcolor="#FF99FF">&nbsp;</td>
  				</tr>
  				<%
  		    }
  			
  			
  		}
  
   %>
    

  <tr>
    <td height="18" colspan="3" align="center"><span class="abc">
    <%
    for(int i=0;i<pageCount;i++)
    {
    	%>
    	<a href="showGoodsServlet?type=paging&pageNow=<%=(i+1)%>">[<%=i+1%>]&nbsp;</a>
    	<%
    }
     %>
    </span></td>
  </tr>
</table>


