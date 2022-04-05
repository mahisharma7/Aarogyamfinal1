<%@page import="com.met.dao.DBConnect"%>
<link href="./CSS/cyber.css" rel="stylesheet">
<%@ page import="java.sql.*"%>
<%
try	{
String user=request.getParameter("user").trim();
String hintqus=request.getParameter("hint_question").trim();
String hintans=request.getParameter("hint_answer").trim();

Connection con = DBConnect.getMySqlConnection();
Statement st = con.createStatement();
ResultSet rs;
	
    rs=st.executeQuery("select password from sign_up where UserEmail='"+user+"' and Hint_question='"+hintqus+"' and Hint_answer='"+hintans+"'");
	if(rs.next()==false) {
			out.println("<center><h2>Incorrect Details</h2>");
			out.println("<center><h4><a href=\"javascript:history.back()\">Continue</a></h4>");
			return;
	} else  out.println("<center><h2>Your's Password is :"+rs.getString("Password"));
	}catch(Exception e)	{
	out.println("<center><h2>Failed To change Password Due to The Error "+e);
	}
%>
<center><h4><a href="javascript:history.back()">Continue</a></h4>

