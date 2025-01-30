<%@page import="test.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 60%;
        margin: 50px auto;
        background: #fff;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    p {
        font-size: 16px;
        color: #555;
    }
    .msg {
        padding: 10px;
        background-color: #dff0d8;
        color: #3c763d;
        border: 1px solid #d6e9c6;
        border-radius: 4px;
        margin-bottom: 20px;
        text-align: center;
    }
    .nav {
        text-align: center;
        margin-top: 20px;
    }
    .nav a {
        display: inline-block;
        margin: 0 10px;
        padding: 10px 20px;
        background-color: #007BFF;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    .nav a:hover {
        background-color: #0056b3;
    }
    .footer {
        text-align: center;
        margin-top: 20px;
        font-size: 12px;
        color: #888;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Welcome, Admin</h1>
    <%
    AdminBean ab = (AdminBean) session.getAttribute("abean");
    String msg = (String) request.getAttribute("msg");
    if (ab != null) {
        out.println("<p>Page belongs to " + ab.getfName() + "</p>");
    } else {
        out.println("<p>Admin information is not available.</p>");
    }
    if (msg != null) {
        out.println("<div class='msg'>" + msg + "</div>");
    }
    %>
    <div class="nav">
        <a href="book.html">Add Book</a>
        <a href="view">View Books</a>
        <a href="logout">Logout</a>
    </div>
</div>
<div class="footer">
    &copy; 2024 Admin Dashboard - Book Management System
</div>

</body>
</html>
