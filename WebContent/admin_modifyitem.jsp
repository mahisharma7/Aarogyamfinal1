<%@page import="com.met.dao.DBConnect"%>
<%@ page import="java.sql.*"%>
<%
	if (session.getValue("login") == null)
		response.sendRedirect("cyber.jsp?invalidsession");
	String table = request.getParameter("category");
%>
<script>
 function getValues(combo) {
 document.forms[0].description.value=combo.options[combo.selectedIndex].getAttribute('desc');
 document.forms[0].cost.value=combo.options[combo.selectedIndex].getAttribute('cost');
 }
 onload=function() {
	 if(document.forms[0].name.options.length>1)
     document.forms[0].name.options[1].selected=true;
	 getValues(document.forms[0].name);}
 </script>
<html xmlns="">
<head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<link class="catg" href="user.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
</head>
<body><jsp:include page="admin_transactions.jsp" />
	<BR>
	<fieldset>
		<legend>Modify Existing Product</legend>
		<BR>
		<table align=center cellspacing=1 cellpadding=3>
			<form method=post action="admin_modifyitemupdate.jsp">
				<tr>
					<Td>Category:</td>
					<TD><input readonly value="<%=table%>" name=category></td>
				</tr>
				<TR>
					<TD align=right>Items:</td>
					<td><select name=name onchange=getValues(this);>
							<option value="" desc="" cost="">Select Item</option>
							<%
								try {
									Connection con = DBConnect.getMySqlConnection();
									Statement st = con.createStatement();
									ResultSet rs;
									
									String cmd = "Select * from product where CAT_NAME='" + table + "'";
									System.out.println("<<<<<<>>>>>>" + cmd);
									rs = st.executeQuery(cmd);
									while (rs.next()) {
										String name = rs.getString(3);
										String desc = rs.getString(4);
										float cost = rs.getFloat(5);
										out.println("<option desc='" + desc + "' cost='" + cost + "' value='" + name + "'>" + name
												+ "</option>");
									}
								} catch (Exception e) {
									out.println("<option value='null'>" + e.getMessage().toString() + "</option>"

									);
									System.out.println("<<<<<<>>>>>>" + e);

								}
							%>
					</select></td>
				</tr>
				<tr>
					<TD align=right>Description:</td>
					<Td><input name=description></td>
				</tr>
				<tr>
					<TD align=right>Price:</td>
					<Td><input name=cost></td>
				</tr>
				<tr>
					<Td colspan=2 align=center><button type=submit accesskey="P">
							<u>P</u>roceed
						</button> &nbsp;&nbsp;
						<button type=reset accesskey="R">
							<u>R</u>eset
						</button></td>
				</tr>
		</table>
		<BR>
	</fieldset>
</body>
</html>
