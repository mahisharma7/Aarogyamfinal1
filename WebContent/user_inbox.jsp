<%@page import="com.met.dao.DBConnect"%>
<%@ page import="java.sql.*"%>
<%
	if (session.getValue("login") == null)
		response.sendRedirect("cyber.jsp?invalidsession");
	

%>
<script>
	function getMessage(val) {
		styles = "<link href='./CSS/cyber.css' rel='stylesheet'><title>Message</title>"
		nwin = open("", "",
				"scrollbars=yes,width=500 height=300,left=120,top=200");
		nwin.document.write(styles + "<p>"
				+ document.getElementById('msgs' + val).innerHTML + "</p>");
		nwin.document.close();
	}
</script>
<html xmlns="">
<head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<link class="catg" href="user.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
</head>
<body><jsp:include page="user_transactions.jsp" />
	<BR>
	<fieldset>
		<legend>Messages From Administrator</legend>
		<BR>
		<%
			String buff = "";
			String head = "";
			try {
				Connection con = DBConnect.getMySqlConnection();
				Statement st = con.createStatement();
				ResultSet rs;
				
				String cmd = "Select * from user_inbox where UserEmail='" + session.getValue("login") + "'";
				rs = st.executeQuery(cmd);
				head += "<table align=center width=600 cellspacing=1 cellpadding=2 bgcolor=lightslategray><form method=post action=\"user_deletemsgchecked.jsp\">";
				head += "<tr bgcolor=lightslategray><th style='color:aliceblue'>S.no</th><th style='color:aliceblue'>From</th><th style='color:aliceblue'>Subject</th><th style='color:aliceblue'>Date</th></tr>";
				int count = 0;
				boolean rec = false;
				while (rs.next()) {
					rec = true;
					count++;
					int id = rs.getInt("mid");
					String from = rs.getString("msg_from");
					String sub = rs.getString("msg_subject");
					String data = rs.getString("msg_data");
					sub = (sub != null) ? sub : "[&nbsp;None&nbsp;]";
					data = (data != null) ? data : "[&nbsp;No Message is Available&nbsp;]";
					java.text.SimpleDateFormat fmt = new java.text.SimpleDateFormat("dd-MMM-yyyy");
					String msgdate = fmt.format(rs.getDate("msg_date")).toString();
					buff += "<TR bgcolor=whitesmoke><TD>" + count + "</td>";
					buff += "<td><input name='from' value='" + id + "' type=checkbox class=check>" + from + "</td>";
					buff += "<Td><div id='msgs" + count + "' style='display:none'>" + data
							+ "</div><a href='javascript:getMessage(" + count + ")'>" + sub + "</a></td>";
					buff += "<TD>" + msgdate + "</td></tr>";
				}
				if (buff.length() > 0)
					out.println(head + buff + "</table>");
				else
					out.println(
							"<link href='./CSS/cyber.css' rel='stylesheet'><center><p>No Messages Found.Your Inbox Terminal is Empty</p></center>");
			} catch (Exception e) {
				out.println("No Items Found" + e);
			}
		%>
		<table align=center width=600>
			<tr>
				<Td align=center><button type=submit accesskey="D">
						<u>D</u>elete
					</button> &nbsp;&nbsp;
					<button type=submit accesskey="R">
						<u>R</u>eset
					</button></td>
			</tr>
		</table>
		<BR>
	</fieldset>
</body>
</html>
