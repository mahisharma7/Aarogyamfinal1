
<link href="./CSS/cyber.css" rel="stylesheet">
<%@ page import="java.sql.*"%>
<%@page import="com.met.dao.*"%>
<%@page import="java.sql.DriverManager" %>
<%
	try {
		//out.println("check");
		String user = request.getParameter("userid");
		String pass = request.getParameter("password");
		
		String admin = (request.getParameter("Admin") != null) ? request.getParameter("Admin").toLowerCase()
				: null;
		String table = (admin != null) ? "admin" : "sign_up";
		out.println("check2");
		
		Connection con = DBConnect.getMySqlConnection();
		
	Statement st = con.createStatement();
	
		ResultSet rs;
		out.println("check2");
		rs = st.executeQuery(
			"select * from " + table + " where UserEmail= '" + user + "' and Password= '" + pass + "'");
		
		out.println("<center><h1>Un Authorized User Found</font></h1></center>");
		session.putValue("login", user);

		if (rs.next()) {
			session.setAttribute("UserEmail", user);
			response.sendRedirect((admin != null) ? "admin.jsp" : "user.jsp");
		} else {
			out.println(
					"<link rel=stylesheet href='user.css'><body bgcolor=yellow><p><font face=tahoma color=maroon><BR>Please Check The User Name and Password u supplied is Correct or Not</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:parent.close()\">Skip From This Page</a>");
		}
	} catch (Exception e) {
		out.println(e);
		out.println(
				"<link rel=stylesheet href='user.css'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:parent.close()\">Skip From This Page</a>");

	}
%>
