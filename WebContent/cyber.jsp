<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<%@ page import="bean.*"%>
<jsp:useBean id="cat" class="bean.CategoryInsert" scope="request"></jsp:useBean>
<%
	/* Vector v=cat.categoryDetails(); */
%>
<html>
<head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<link href="user.css" rel="stylesheet">
<title>Arogyam Medical Booking Store</title>
</head>
<body>
	<table width=580 cellspacing=0 cellpadding=0 border=0 align=center>
		<tr>
			<td><h1>
					<font color=black><center> Arogyam Aurvedic Medicine Booking
							Store</center></font>
				</h1></td>
		</tr>
	</table>
	<script src="cyber.js"></script>
	<BR>
<%-- 	<TABLE ALIGN=CENTER BORDER=0 oncontextmenu="return false" cellspacing=0
		cellpadding=0>
		<form action="search_products.jsp">
	<br><br>
			<TR>
				<TD>Search Products To Buy&nbsp;:&nbsp;<input name=search>&nbsp;&nbsp;in
					&nbsp;&nbsp;<select name=category>
						<%
for(int i=0;i<v.size();i++)
{
%>%>
<option><%=v.get(i)%></option>

<% } %>

				</select>&nbsp;&nbsp;
					<button type=submit>Proceed</button>
			</TR>
		</form> --%>
	</TABLE>
	<fieldset><center>
		<legend><h2><centre>Login</centre></h2></legend></center>
		<BR>
		<table width=300 align=center>
			<form method=get action="login.jsp">
				<TR>
					<TD colspan=3 nowrap id=expire></td>
				</tr>
				<tr>
					<Td align=right><h2>UserEmail:</h2></td>
					<Td><input name=userid>
					<td rowspan=4> 
						
				<tr>
					<Td align=right><h2>Password:</h2></td>
					<Td><input name=password type=password></td>
				</tR>
				<tr>
					<td colspan=2 align=center><input class=check type=checkbox
						name=Admin value=admin>Login As an Administrator</td>
				</tr>
				<tr>
					<td colspan=2 align=center><button type=submit accesskey="L">
							<u>L</u>ogin
						</button>&nbsp;&nbsp;
						<button type=reset accesskey="R">
							<u>R</u>efresh
						</button></td>
				</tr>
				<tr>
					<td colspan=2 align=center><a href="forgot.jsp"><h3>Forgot
							Password&nbsp;?</h3></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="change.jsp"><h3>Change
							Password</h3></a></td>
				</tr>
			</form>
		</table>
		<BR>
	</fieldset>
	<BR>
	<BR>
	<center><li><b>Welcome to the Online Medical Booking Store.<b />
			<li>Here we pride ourselves in delivering medicines with prime
				commitment and with an honest, open and trustworthy approach.
		<li>We desire to achieve customer fulfillment and satisfaction
				through their pleasant experience.
		<li>Our motto is to serve and satisfy our customers to the utmost
				by providing right medical aid when they need it most. <script>if(location.search.indexOf("invalid")!=-1) document.getElementById('expire').innerHTML="<font color=maroon>Invalid User Name and Password&nbsp;&nbsp;[&nbsp;or&nbsp;]&nbsp;&nbsp;Your Login Session May be Expired. Please Relogin</font>";</script></center>
</body>
</html>
