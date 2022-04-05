<%@page import="com.met.dao.DBConnect"%>
<link href="./CSS/cyber.css" rel="stylesheet">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
String[] users=request.getParameterValues("user");
if(session.getValue("login")==null) response.sendRedirect("cyber.jsp?invalid");	
try	{
	Connection con = DBConnect.getMySqlConnection();
	Statement st = con.createStatement();
	ResultSet rs;
	
	for(int i=0;i<users.length;i++) st.executeUpdate("delete from sign_up where UserEmail='"+users[i]+"'");
	response.sendRedirect("deleteuser.jsp");
} catch(Exception e) {
		out.println("<center><h2>Failed To Delete Items Due to The Error <BR>"+e);
}
%>
<center><h4><a href="javascript:history.back()">Continue</a></h4>

