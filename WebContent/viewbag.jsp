  <%@page import="com.met.dao.DBConnect"%>
<%@ page import="java.sql.*"%>
<%
	if (session.getValue("login") == null)
		response.sendRedirect("cyber.jsp?invalidsession");
%>
<html>
<head>
<link class="catg" href="user.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
<script language="javascript">
	function Validation(viewbag) {
		if (viewbag.ccno.value == "") {
			alert("please enter value in creditcard no field");
			viewbag.ccno.focus();
			return (false);
		}
		if (viewbag.ccno.value.length < 17) {
			alert("please enter minimum 16 digits in creditcard no field");
			viewbag.ccno.focus();
			return (false);
		}
		if (viewbag.cctype.value == "") {
			alert("please enter a value in creditcard type field");
			viewbag.cctype.focus();
			return (false);
		}
		if (viewbag.dd.value == "") {
			alert("please enter date value in expdate field");
			viewbag.dd.focus();
			return (false);
		}
		if (viewbag.mm.value == "") {
			alert("please enter a value to month in expdate field");
			viewbag.mm.focus();
			return (false);
		}
		if (viewbag.yyyy.value == "") {
			alert("please enter a value to creditcard no in expdate field");
			viewbag.yyyy.focus();
			return (false);
		}
		if (viewbag.cvv.value == "") {
			alert("please enter a value to cvv in cvv no field");
			viewbag.cvv.focus();
			return (false);
		}
	}
</script>
</head>
<body>
	<jsp:include page="user_transactions.jsp" />
	<%
		String buff = "";
		String head = "";

		java.text.SimpleDateFormat fmt = new java.text.SimpleDateFormat("dd-MMM-yyyy");
		String odate = fmt.format(new java.util.Date()).toString();

		try {
			Connection con = DBConnect.getMySqlConnection();
			Statement st = con.createStatement();
			ResultSet rs;
			if (session.getValue("login") == null)
				response.sendRedirect("cyber.jsp?invalid");
			st = con.createStatement();
			String cmd = "Select * from cart";
			rs = st.executeQuery(cmd);
			head += "<table align=center cellspacing=1 cellpadding=3 bgcolor=lightslategray><form method=post action='sendorder.jsp' name='viewbag' onSubmit='return Validation(viewbag)'>";
			head += "<tr bgcolor=lightslategray><th width='10%' style='color:aliceblue'>S.No</th><th  width='10%' style='color:aliceblue'>Category</th><th  width='10%' style='color:aliceblue'>Item Name</th><th  width='10%' style='color:aliceblue'>Description</th><th   width='10%' style='color:aliceblue'>Price</th><th  width='10%' style='color:aliceblue'>Qunatity</th><th  width='10%' style='color:aliceblue'>Total</th></tr>";
			int count = 0;
			float grand = 0;
			while (rs.next()) {
				count++;
				String category = rs.getString("category");
				String item = rs.getString("itemname");
				String desc = rs.getString("description");
				float price = rs.getFloat("price");
				int qty = rs.getInt("Quantity");
				float total = price * qty;
				buff += "<TR bgcolor=whitesmoke><TD>" + count
						+ "</td><td><input type=checkbox checked class=check style='display:none' name= category value='"
						+ category + "'>" + category
						+ "</td><Td><input type=checkbox checked class=check style='display:none' name=itemname value='"
						+ item + "'>" + item
						+ "</td><TD><input type=checkbox checked class=check style='display:none' name= description value='"
						+ desc + "'>" + desc
						+ "</td><td><input type=checkbox checked class=check style='display:none' name=price value='"
						+ price + "'>" + price
						+ "</td><td><input type=checkbox checked class=check style='display:none' name=quantity value='"
						+ qty + "'>" + qty
						+ "</td><td><input type=checkbox checked class=check style='display:none' name=total value='"
						+ total + "'>" + total + "</td></tr>\n";
				grand += total;
			}
			if (buff.length() > 0) {
				out.println(head + buff);
				out.println(
						"<TR><th colspan=6 align=right style='color:aliceblue'>Grand Total</th><Th align=center  style='color:aliceblue'><input name=grandtotal type=hidden value='"
								+ grand + "'>" + grand + "</th></tr></table>");
			} else
				out.println(
						"<link href='./CSS/cyber.css' rel='stylesheet'><center><p>No Items Found.Cart is Empty</p></center>");
		} catch (Exception e) {
			out.println("<link href='./CSS/cyber.css' rel='stylesheet'><center><p>No Items Found</p>");
		}
	%>

	<table width="100%" border="0" align="center">
		<tr>
			<td width="44%" align="right">Card No</td>
			<td width="6%" rowspan="6">&nbsp;</td>
			<td colspan="4"><input type="text" name="ccno" /></td>
		</tr>
		<tr>
			<td width="44%" align="right">Address</td>
			<td width="6%" rowspan="6">&nbsp;</td>
			<td colspan="1"><textarea name="address" rows="4" cols="16">
	</textarea></td>
		</tr>

		<tr>
			<td align="right">Card Type</td>
			<td colspan="1"><select name="cctype">
					<option>select type</option>
					<option value="Master card">Master card</option>
					<option value="Visa card">Visa card</option>
			</select></td>
		</tr>
		<tr>
			<td align="right">Exp Date</td>
			<!-- <td width="15%"> -->
			<td width="21%"><select name="mm">
					<option>mm</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
			</select></td>
			<td width="24%"><select name="yyyy">
					<option>year</option>
					<option value="2013">2017</option>
					<option value="2014">2018</option>
					<option value="2015">2019</option>
					<option value="2016">2020</option>
					<option value="2017">2021</option>
					<option value="2018">2022</option>
					<option value="2019">2023</option>
					<option value="2020">2024</option>
					<option value="2021">2025</option>
			</select></td>
		</tr>
		<tr>
			<td align="right">cvv no</td>
			<td height="23" colspan="3"><input type="password" name="cvv" /></td>
		</tr>
		<tr>
			<td rowspan="2" align="right">&nbsp;</td>
			<td height="9" colspan="3"></td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
	</table>
	<%
		out.println("<center><input name=odate type=hidden value='" + odate
				+ "'><button type=submit accesskey='S'><U>S</u>end Order Now</button></center>");
	%>
	</form>
</body>
</html>
