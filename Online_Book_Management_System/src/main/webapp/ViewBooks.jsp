<%@page import="java.util.Iterator"%>
<%@page import="test.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Books</title>

  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f4;
      padding-top: 50px;
    }

    .container {
      max-width: 900px;
      margin: 0 auto;
      background-color: white;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      font-size: 32px;
      font-weight: bold;
      color: #333;
      text-align: center;
      margin-bottom: 30px;
    }

    .book-table {
      width: 100%;
      margin-top: 20px;
      border-collapse: collapse;
    }

    .book-table th, .book-table td {
      padding: 12px;
      text-align: center;
      border: 1px solid #ddd;
    }

    .book-table th {
      background-color: #007bff;
      color: white;
    }

    .book-table td {
      background-color: #f9f9f9;
    }

    .book-table a {
      color: #007bff;
      text-decoration: none;
    }

    .book-table a:hover {
      text-decoration: underline;
    }

    .footer-links {
      margin-top: 30px;
      text-align: center;
    }

    .footer-links a {
      font-size: 18px;
      margin: 0 15px;
      color: #007bff;
      text-decoration: none;
    }

    .footer-links a:hover {
      color: #ffcc00;
    }

    .message {
      text-align: center;
      font-size: 18px;
      color: #555;
    }
  </style>
</head>
<body>

  <div class="container">
    <h1>Manage Books</h1>

    <div class="message">
      <%
        AdminBean ab = (AdminBean) session.getAttribute("abean");
        out.println("Page belongs to " + ab.getfName() + "<br>");
      %>
    </div>

    <% 
      ArrayList<BookBean> al = (ArrayList<BookBean>) session.getAttribute("alist");
      if (al == null || al.size() == 0) {
        out.println("<p>No books available.</p>");
      } else {
    %>
      <table class="book-table">
        <thead>
          <tr>
            <th>Book Code</th>
            <th>Book Name</th>
            <th>Book Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
            Iterator<BookBean> it = al.iterator();
            while (it.hasNext()) {
              BookBean bb = it.next();
          %>
          <tr>
            <td><%= bb.getCode() %></td>
            <td><%= bb.getName() %></td>
            <td><%= bb.getAuthor() %></td>
            <td><%= bb.getPrice() %></td>
            <td><%= bb.getQty() %></td>
            <td>
              <a href="edit?bcode=<%= bb.getCode() %>">Edit</a> |
              <a href="delete?bcode=<%= bb.getCode() %>">Delete</a>
            </td>
          </tr>
          <% 
            }
          %>
        </tbody>
      </table>
    <% 
      }
    %>

    <div class="footer-links">
      <a href="book.html">Add New Book</a>
      <a href="logout">Logout</a>
    </div>
  </div>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
