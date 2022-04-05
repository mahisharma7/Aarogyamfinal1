<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="">
<head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cahe">
<meta http-equiv="expires" content="0">
<link href="./CSS/cyber.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
<style>
select {
	width: 110px
}

textarea {
	background: honeydew;
	overflow: auto;
	border: 1px solid gray
}
</style>
</head>
<body>
	<table width=780 cellspacing=0 cellpadding=0 border=0 align=center>
		<tr>
			<td><table width=780 cellspacing=0 cellpadding=0 border=0
					align=center>
					<tr>
						<td><h1>
								<font color=yellow>
									<center>Online Medical Booking Store</center>
								</font>
							</h1></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<script src="cyber.js"></script>
	<SCRIPT SRC="./email.js" LANGUAGE=JAVASCRIPT></SCRIPT>
	<fieldset>
		<legend>Register New User</legend>
		<BR>

		

			<table border=0 cellpadding=5 cellspacing=0 width="500"
				style="font-family: tahoma; font-weight: bold; color: gray; font-size: 12px">
				
				<form method="post" action="registration.jsp">

				
					<tr>
						<td align=right>User Name:</td>
						<td><input name="custname" required="required"></td>
					</tr>
					<tr>
						<td align=right>Password:</td>
						<td><input name="custpass" type=password required="required"></td>
					</tr>

					<tr>
						<td align=right>Address:
						<td><textarea wrap=off accesskey="D" rows=3 cols=20
								name=address required="required"></textarea></td>
					</tr>
					<td align=right>Email Id:</td>
					<td><input name="custemail" required="required"></td>
					</tr>

					<Tr>
						<td align=right>Phone/Mobile:
						<td><input name=mobileno required="required"
							pattern="[1-9]{1}[0-9]{9}">
					</tr>

					<tr>
						<td align=right>City:</td>
						<td><input name="city" required="required"></td>
					</tr>

					<tr>
						<td align=right>PinCode:</td>
						<td><input name="pincode" required="required"
							pattern="[0-9]{1}[0-9]{5}"></td>
					</tr>

					<tr>
						<td align=right>Hint Question:</td>
						<td><select name="hint_question">
								<option value="null" selected>Hint Question</option>
								<option value="food">Favorite Food</option>
								<option value="place">Historical Place</option>
								<option value="pet">Pet Name</option>
								<option value="event">Memorable Event</option>
						</select>&nbsp; <input name="hint_ans" required="required"></td>
					</tr>


					<tr>
						<td colspan=2 align=center><button type=submit>Proceed</button>&nbsp;&nbsp;
							<button type=reset>Refresh</button>
		
		</form>
			</table>
		
</body>
</html>