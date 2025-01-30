<%@page import="test.BookBean"%>
<%@page import="test.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Book</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 50%;
        margin: auto;
        margin-top: 50px;
        background: #fff;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    form {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
    label {
        font-weight: bold;
        color: #555;
    }
    input[type="text"] {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover {
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
    <h1>Update Book Details</h1>
    <%
    AdminBean ab = (AdminBean) session.getAttribute("abean");
    BookBean bb = (BookBean) request.getAttribute("bbean");
    if (ab != null) {
        out.println("<p>Page belongs to " + ab.getfName() + "</p>");
    } else {
        out.println("<p>Admin information is not available.</p>");
    }
    %>
    <form action="update" method="post">
        <input type="hidden" name="bcode" value="<%=bb != null ? bb.getCode() : "" %>">
        <label for="bprice">Book Price:</label>
        <input type="text" id="bprice" name="bprice" value="<%=bb != null ? bb.getPrice() : "" %>">
        <label for="bqty">Book Quantity:</label>
        <input type="text" id="bqty" name="bqty" value="<%=bb != null ? bb.getQty() : "" %>">
        <input type="submit" value="Update Book">
    </form>
    <div class="footer">
        &copy; 2024 Book Management System
    </div>
</div>

</body>
</html>
