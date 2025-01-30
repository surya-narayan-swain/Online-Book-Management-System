<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
<style>
   body {
       font-family: Arial, serif;
       background-color: rgb(128, 128, 128);
   
   }
   .navbar {
        background-color: rgb(128, 128, 128);
        padding: 15px 0;
        text-align: center;
    }

    .navbar h1 {
        color: white;
        margin: 0;
        font-size: 36px;
        font-weight: bold;
    }
   h1 {
       color:  rgb(0, 0, 255);
       font-size: 24px;
   }
</style>
</head>
<body>
	<center>
	<h1>
		<%
			String msg=(String)request.getAttribute("msg");
			out.println(msg+"<br><br>");
		%>
	</h1>
	
	</center>
	<jsp:include page="customerlogin.html"></jsp:include>
</body>
</html>