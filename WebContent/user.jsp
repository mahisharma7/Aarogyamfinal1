<%if(session.getValue("login")==null) response.sendRedirect("cyber.jsp?invalidsession");%>
<html>
<head>
<link class="catg" href="./CSS/cyber.css" rel="stylesheet">
<link class="catg" href="user.css" rel="stylesheet">
<title>Online Medical Booking Store</title>
</head>
<body>
<jsp:include page="user_transactions.jsp" />
<br> <br> <br> <br>
<TABLE  cellSpacing=3 cellPadding=3 width=600 align="centre" border=0 >
 <TBODY cellSpacing=3 cellPadding=3 width=600 align="center" border=0 >
 <b><p1>Ayurvedic ==============>            Ayurveda is an ancient Indian system of medicine <b/> </p1><br>
<b><p1>Baby Care  ==============>             Baby food and baby care products <b/> </p1><br>
<b><p1>Body Care  ==============>             All you need for your personal body care <b/> </p1><br>
<b><p1>Eye Care   ==============>             Eye Care products for beautiful and glowing eyes<b/> </p1><br>
<b><p1>Hair&Skin Care ==============>           Professional hair and skin care products available  <b/> </p1><br>
<b><p1>Health Care ==============>            All kinds of medicine for your health care<b/> </p1><br>
<b><p1>Nutrition   ==============>             safe and nutritious food supply for ur good health<b/> </p1><br>
<b><p1>Over the Counter(OTC) ==============>           You can buy without a prescription from a healthcare professional.<b/> </p1><br>



	
	
</TBODY>
</TABLE>
</body></html>

