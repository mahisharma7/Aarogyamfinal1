<%@page import="com.met.dao.DBConnect"%>
<link href="./CSS/cyber.css" rel="stylesheet">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	String table = request.getParameter("category");
	String[] msgs = request.getParameterValues("from");
	if (session.getValue("login") == null)
		response.sendRedirect("cyber.jsp?invalid");
	try {

		Connection con = DBConnect.getMySqlConnection();
		Statement st = con.createStatement();
		ResultSet rs;

		for (int i = 0; i < msgs.length; i++)
			st.executeUpdate("delete from user_inbox where mid='" + msgs[i] + "'");
		response.sendRedirect("user_inbox.jsp");
	} catch (Exception e) {
		out.println("<center><h2>Failed To Delete Items Due to The Error <BR>" + e);
	}
%>
<center>
	<h4>
		<a href="user_inbox.jsp">Back To Inbox</a>
	</h4>