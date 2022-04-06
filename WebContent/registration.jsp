<%@page import="com.met.dao.DBConnect"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String UserName = request.getParameter("custname");
	String Password = request.getParameter("custpass");
	String Address = request.getParameter("address");
	String EmailId = request.getParameter("custemail");
	Long MobileNo = Long.parseLong(request.getParameter("mobileno"));
	String City = request.getParameter("city");
	String PinCode = request.getParameter("pincode");
	String HintQuestion = request.getParameter("hint_question");
	String HintAns = request.getParameter("hint_ans");
	Connection con = DBConnect.getMySqlConnection();
	Statement st = con.createStatement();
	//ResultSet rs;
	try {
	int i = st
			.executeUpdate("insert into sign_up(CustName, Password, Address, UserEmail, MobileNo, City, Pincode, Hint_question, Hint_answer) values ('"
					+ UserName
					+ "','"
					+ Password
					+ "','"
					+ Address
					+ "','" 
					+ EmailId
					+ "','"
					+ MobileNo
					+ "','"
					+ City
					+ "','"
					+ PinCode
					+ "','"
					+ HintQuestion
					+ "','"
					+ HintAns 
					+ "')");
	
	if (i > 0) {
		out.println("<link rel=stylesheet href='./CSS/cyber.css'><body bgcolor=pink><h1>Your Account is Created Successfully</h1><br><br><center><a href=\"index.html\" target=\"_parent\">Home</a>");
	}
		else out.println("<link rel=stylesheet href='./CSS/cyber.css'><body bgcolor=pink><h1>Your Action Failed</h1><br><br><center><a href=\"javascript:history.back()\">Go Back</a>&nbsp;&nbsp;<a href=\"index.html\" target=\"_parent\">Home</a>");
	} catch(Exception e)	{
   		String msgs=" ";
		/* msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"The User Name U Specified is Already Existed.<BR><BR>Please Choose Another Name":"UnKnown Exception Occured"; */
		out.println("<link rel=stylesheet href='./CSS/cyber.css'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Action</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.html\" target=\"_parent\">Home</a>");
	}
%>