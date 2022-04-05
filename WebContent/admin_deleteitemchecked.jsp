<%@page import="com.met.dao.DBConnect"%>
<link href="./CSS/cyber.css" rel="stylesheet">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	String table = request.getParameter("category");
	String[] items = request.getParameterValues("item");
	if (session.getValue("login") == null)
		response.sendRedirect("cyber.jsp?invalid");
	try {
		Connection con = DBConnect.getMySqlConnection();
		Statement st = con.createStatement();
		ResultSet rs;
		for (int i = 0; i < items.length; i++) { //stmt.executeUpdate("delete from "+table+" where itemname='"+items[i]+"'");

			st.executeUpdate("delete from product  where CAT_NAME='" + items[i] + "'");

			response.sendRedirect("admin_deleteitem.jsp?category=" + table);
		}
	} catch (Exception e) {
		out.println("<center><h2>Failed To Delete Items Due to The Error <BR>" + e);
	}
%>
<center>
	<h4>
		<a href="javascript:history.back()">Continue</a>
	</h4>