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
        text-align: center;
    }
    h1 {
        color: #333;
    }
    .msg {
        padding: 10px;
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
        border-radius: 4px;
        margin-bottom: 20px;
    }
    .nav {
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
        margin-top: 30px;
        font-size: 12px;
        color: #888;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Admin Dashboard</h1>
    <%
    AdminBean ab = (AdminBean) session.getAttribute("abean");
    String msg = (String) request.getAttribute("msg");
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
