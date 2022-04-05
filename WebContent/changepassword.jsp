<%@page import="com.met.dao.DBConnect"%>
<link href="./CSS/cyber.css" rel="stylesheet">
<%@ page import="java.sql.*"%>
<%
	if (session.getValue("login") == null)
		response.sendRedirect("cyber.jsp?invalid");
	try {
		String user = request.getParameter("user").trim();
		String exist = request.getParameter("exist").trim();
		String newpass = request.getParameter("pass").trim();
		String admin = (request.getParameter("admin") != null) ? request.getParameter("admin").toLowerCase()
				: null;
		String table = (admin != null) ? "admin" : "sign_up";

		Connection con = DBConnect.getMySqlConnection();
		Statement st = con.createStatement();
		ResultSet rs;
		rs = st.executeQuery(
				"select * from " + table + " where UserEmail='" + user + "' and Password='" + exist + "'");
		if (rs.next() == false) {
			out.println("<center><h2>Incorrect Password</h2>");
			out.println("<center><h4><a href=\"javascript:history.back()\">Continue</a></h4>");
			return;
		} else {
			st.close();
			st = con.createStatement();
			int result = st.executeUpdate(
					"update " + table + " set Password='" + newpass + "' where UserEmail='" + user + "'");
			out.println("<center><h2><h2>The operation was completed successfully</h2>");
		}
	} catch (Exception e) {
		out.println("<center><h2>Failed To change Password Due to The Error " + e);
	}
%>
<center>
	<h4>
		<a href="javascript:history.back()">Continue</a>
	</h4>