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
<link href="user.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
</head><body>
<table width=780 cellspacing=0 cellpadding=0 border=0 align=center> 
<tr><td><table width=780 cellspacing=0 cellpadding=0 border=0 align=center>
  <tr>
    <td><h1><font color=yellow>
      <center>
        Online Medical Booking Store
      </center>
    </font></h1></td>
  </tr>
</table></td>
</tr></table>
<script src="cyber.js"></script><BR>
<TABLE ALIGN=CENTER BORDER=0 oncontextmenu="return false"  cellspacing=0 cellpadding=0>
<form action="search_products.jsp"><TR><TD>Search Products To Buy&nbsp;:&nbsp;<input name=search>&nbsp;&nbsp;in
&nbsp;&nbsp;<select name=category>
<%
for(int i=0;i<v.size();i++)
{
%>%>
<option><%=v.get(i)%></option>

<%
}	
%>
<!--
<option value='appliances'>Appliances
<option value='buildings'>Buildings
<option value='clothing'>Clothing
<option value='electronics'>Electronics
<option value='hardware'>Hardware
<option value='food'>Food
<option value='books'>Books
-->
</select>&nbsp;&nbsp;<button type=submit>Proceed</button>
	</TR>
</form></TABLE>
<fieldset><legend>Retrieve Password Here</legend><BR>
<table width=600 align=center cellspacing=0 cellpadding=2><form method=post action="forgotpassword.jsp">
<tr><Td align=right>User Name:</td><Td><input name=user></td><td rowspan=4><img src="addcart.jpg" width=300 height=120 border=0></tR>
<tr><Td align=right>Hint Question:</td><Td><select name=hint_question>
     <option value="null" selected>Hint Question</option>
     <option value="food">Favorite Food</option>
     <option value="place">Historical Place</option>
     <option value="pet">Pet Name</option>
     <option value="event">Memorable Event</option>
     </select></td></tr>
<tr><Td align=right>Hint Answer:</td><Td><input name=hint_answer></td></tR>
<tr><td colspan=2 align=center><button type=submit accesskey="F"><u>F</u>ind Now</button>&nbsp;&nbsp;
<button type=reset accesskey="R"><u>R</u>efresh</button></td></tr>
</form></table><BR></fieldset><BR><BR><BR><BR>
<li><b>Welcome to the Online Medical Booking Store.<b/>
<li>Here we pride ourselves in delivering medicines with prime commitment and with an honest, open and trustworthy approach.
<li>We desire to achieve customer fulfillment and satisfaction through their pleasant experience. 
<li>Our motto is to serve and satisfy our customers to the utmost by providing right medical aid when they need it most.
</body></html>
