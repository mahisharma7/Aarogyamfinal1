<%@page import="com.met.dao.DBConnect"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
	System.out.println("-------------------");
	if (session.getValue("login") == null)
		response.sendRedirect("cyber.jsp?invalidsession");
%>
<html xmlns="">
<head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<link class="catg" href="user.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
</head>
<body><jsp:include page="user_transactions.jsp" /><BR>
	<%
		String buff = "";
		String head = "";
		String product = request.getParameter("search");
		String category = request.getParameter("category");
		try {

			Connection con = DBConnect.getMySqlConnection();
			Statement st = con.createStatement();
			ResultSet rs;

			String cmd = "Select * from  product  where CAT_NAME='" + category + "' and PRODUCTNAME like '%"
					+ product + "%'";
			System.out.println("<<<<<<<<>>>>>>" + cmd);
			rs = st.executeQuery(cmd);
			head += "<table align=center width=600 cellspacing=1 cellpadding=2 bgcolor=lightslategray><form method=post action=\"user_deletemsgchecked.jsp\">";
			head += "<tr bgcolor=lightslategray><th style='color:aliceblue'>S.no</th><th style='color:aliceblue'>Category</th><th style='color:aliceblue'>Item Name</th><th style='color:aliceblue'>Description</th><th style='color:aliceblue'>Price</th></tr>";
			int count = 0;
			String itemname, desc, pname;
			float price;
			while (rs.next()) {
				count++;
				itemname = rs.getString(2);
				pname = rs.getString(3);
				desc = rs.getString(4);
				price = rs.getFloat(5);

				buff += "<TR bgcolor=whitesmoke><TD>" + count + "</td>";
				buff += "<td>" + itemname + "</td>";
				buff += "<Td>" + pname + "</td>";
				buff += "<Td>" + desc + "</td>";
				buff += "<TD>" + price + "</td></tr>";
			}
			if (buff.length() > 0)
				out.println(head + buff + "</table>");
			else
				out.println(
						"<link href='./CSS/cyber.css' rel='stylesheet'><center><p>Sorry ! No Matches Found To Your Query. Please Try Again</p></center>");
		} catch (Exception e) {
			out.println("No Items Found" + e);
		}
	%>