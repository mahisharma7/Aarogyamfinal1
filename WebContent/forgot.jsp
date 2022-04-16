<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<jsp:useBean id="cat" class="bean.CategoryInsert" scope="request"></jsp:useBean>
<%
Vector v=cat.categoryDetails();
%>
<html xmlns="">
<head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cahe">
<meta http-equiv="expires" content="0">
<link href="cyber.css" rel="stylesheet">
<title>Aarogyam Ayurvedic Medicine Store</title>
</head><body>
<table width=780 cellspacing=0 cellpadding=0 border=0 align=center> 
<tr><td><table width=780 cellspacing=0 cellpadding=0 border=0 align=center>
  <tr>
    <td><h1><font color=black>
      <center>
       Aarogyam Ayurvedic Medicine Store
      </center>
    </font></h1></td>
  </tr>
</table></td>
</tr></table>
<script src="cyber.js"></script><BR>
<%-- <TABLE ALIGN=CENTER BORDER=0 oncontextmenu="return false"  cellspacing=0 cellpadding=0>
<form action="search_products.jsp"><TR><TD>Search Products To Buy&nbsp;:&nbsp;<input name=search>&nbsp;&nbsp;in
&nbsp;&nbsp;<select name=category>
<%
for(int i=0;i<v.size();i++)
{
%>%>
<option><%=v.get(i)%></option>

<%
}	
%> --%>
<!--
<option value='appliances'>Appliances
<option value='buildings'>Buildings
<option value='clothing'>Clothing
<option value='electronics'>Electronics
<option value='hardware'>Hardware
<option value='food'>Food
<option value='books'>Books
-->
<!-- </select>&nbsp;&nbsp;<button type=submit>Proceed</button> -->
	</TR>
</form></TABLE>
<fieldset><legend><b><h1>Retrieve Password Here</h1></b></legend><BR>
<table width=600 align=center cellspacing=0 cellpadding=2><form method=post action="forgotpassword.jsp">
<tr><Td align=right><h2>User Name:</h2></td><Td><input name=user></td><td rowspan=4><img src="images.jpg" width=300 height=120 border=0></tR>
<tr><Td align=right><h2>Hint Question:</h2></td><Td><select name=hint_question>
     <option value="null" selected><h2>Hint Question</h2></option>
     <option value="food"><h2>Favorite Food</h2></option>
     <option value="place"><h2>Historical Place</h2></option>
     <option value="pet"><h2>Pet Name</h2></option>
     <option value="event"><h2>Memorable Event</h2></option>
     </select></td></tr>
<tr><Td align=right><h2>Hint Answer:</h2></td><Td><input name=hint_answer></td></tR>
<tr><td colspan=2 align=center><button type=submit accesskey="F"><u>F</u>ind Now</button>&nbsp;&nbsp;
<button type=reset accesskey="R"><u>R</u>efresh</button></td></tr>
</form></table><BR></fieldset><BR><BR><BR><BR>
<h3><li><b>Welcome to the Online Medical Booking Store.</h3><b/>
<h3><li>Here we pride ourselves in delivering medicines with prime commitment and with an honest, open and trustworthy approach.</h3>
<h3><li>We desire to achieve customer fulfillment and satisfaction through their pleasant experience. </h3>
<h3><li>Our motto is to serve and satisfy our customers to the utmost by providing right medical aid when they need it most.</h3>
</body></html>
