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
<link class="catg" href="user.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
</head>
<body><jsp:include page="user_transactions.jsp" />
	<%
		try {
			Connection con = DBConnect.getMySqlConnection();
			Statement st = con.createStatement();
			ResultSet rs;
			PreparedStatement stmt = null;

			String user = session.getValue("login").toString();
			String address = request.getParameter("address");

			String category[] = request.getParameterValues("category");
			String itemname[] = request.getParameterValues("itemname");
			String desc[] = request.getParameterValues("description");
			String price[] = request.getParameterValues("price");
			String qty[] = request.getParameterValues("quantity");
			String total[] = request.getParameterValues("total");
			String odate = request.getParameter("odate");
			float grand = Float.parseFloat(request.getParameter("grandtotal"));
			String getid = "SELECT MAX(time) from sendorder";
			st = con.createStatement();
			stmt = con.prepareStatement("insert into sendorder values(?,?,?,?,?,?,?,?,?,?,?)");
			float cost, tot;
			int qt, val = 0;
			for (int i = 0; i < itemname.length; i++) {
				rs = st.executeQuery(getid);
				if (rs.next()) {
					val = rs.getInt(1);
					if (val > 0) {
						val += 1;
					} else {
						val = 1;
					}
				}
				cost = Float.parseFloat(price[i]);
				qt = Integer.parseInt(qty[i]);
				tot = Float.parseFloat(total[i]);
				stmt.setString(1, user);
				stmt.setInt(2, val);
				stmt.setString(3, category[i]);
				stmt.setString(4, itemname[i]);
				stmt.setString(5, desc[i]);
				stmt.setFloat(6, cost);
				stmt.setInt(7, qt);
				stmt.setFloat(8, tot);
				stmt.setString(9, odate);
				stmt.setFloat(10, grand);
				stmt.setString(11, address);
				int rss = stmt.executeUpdate();
			}
			st.execute("delete from cart");
			// response.sendRedirect("addcart.jsp"); 
			out.println(
					"<center><h3 style='color:ivory;border:1px solid gray;background:maroon;font-size:15px;width:500px;height:60px'>"
							+ session.getValue("login")
							+ " Thank You For Ordering.<BR>We Will Send it To Your Home with in a week</center></h3><BR><center><a href='user.jsp'>Continue</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='javascript:parent.close()'>Close</a></center>");

		} catch (Exception e) {
			String msgs = " ";
			msgs = (e.getMessage().toLowerCase().indexOf("unique") != -1)
					? "Item you Specified is Already Existed.<br><BR> Please Choose Another item"
					: (e.getMessage().toLowerCase().indexOf("format") != -1)
							? "Quantity must be number and not null" : "unkinown exception occured" + e;
			out.println(
					"<link rel=stylesheet href='./CSS/cyber.css'><body bgcolor=ivory><h1>Error Occured! While Processing Your Transaction</font></h1><P>"
							+ msgs + "</p><br><br><center><a href=\"user.jsp\">Continue</a><BR>" + e);
		}
	%>
</body>
</html>
