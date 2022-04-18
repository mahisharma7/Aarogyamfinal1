<%@page import="com.met.dao.DBConnect"%>
<%@ page import="java.sql.*"%>
<%
	if (session.getValue("login") == null)
		response.sendRedirect("cyber.jsp?invalidsession");
%>
<html xmlns="">
<head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<link class="catg" href="./CSS/cyber.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
</head>
<body><jsp:include page="user_transactions.jsp" />
	<%
		try {

			Connection con = DBConnect.getMySqlConnection();
			Statement st = con.createStatement();
			ResultSet rs;
			PreparedStatement stmt = null;

			if (request.getParameterValues("item") == null)
				response.sendRedirect("addcart.jsp");
			String sarr[] = { "", "" };
			String itemnames[] = (request.getParameterValues("item") != null) ? request.getParameterValues("item")
					: sarr;
			String desc[] = request.getParameterValues("desc");
			String price[] = request.getParameterValues("cost");
			String qty[] = request.getParameterValues("qty");
			String catg = request.getParameter("table");
			if (session.getValue("login") == null)
				response.sendRedirect("cyber.jsp?invalid");
			stmt = con.prepareStatement("insert into cart values(?,?,?,?,?)");
			String buffs = "";
			int qtys;
			float ucost = 0;
			for (int i = 0; i < itemnames.length; i++) {
				ucost = Float.parseFloat(price[i]);
				qtys = Integer.parseInt(qty[i]);
				if (qtys != 0) {
					stmt.setString(1, catg);
					stmt.setString(2, itemnames[i]);
					stmt.setString(3, desc[i]);
					stmt.setFloat(4, ucost);
					stmt.setInt(5, qtys);
					int rss = stmt.executeUpdate();
				}
			}
			response.sendRedirect("addcart.jsp");
		} catch (Exception e) {
			String msgs = " ";
			System.out.println("---" + e);
			msgs = (e.getMessage().toLowerCase().indexOf("unique") != -1)
					? "Item u Specified is Already Existed.<br><BR> Please Choose Another item"
					: (e.getMessage().toLowerCase().indexOf("format") != -1)
							? "Quantity must be number and not null" : "unkinown exception occured" + e;
			out.println(
					"<link rel=stylesheet href='./CSS/cyber.css'><body bgcolor=ivory><h1>Error Occured! While Processing Your Transaction</font></h1><P>"
							+ msgs
							+ "</p><br><br><center><a href=\"addcart.jsp\">Continue</a>&nbsp;&nbsp;<a href=\"user.jsp\" target=\"_parent\">Home</a>");
		}
	%>
</body>
</html>
