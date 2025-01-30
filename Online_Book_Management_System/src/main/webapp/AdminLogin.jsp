<%@page import="test.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>

  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f1f1f1; /* Light grey background */
      padding-top: 70px; /* Add padding to create space for the navbar */
    }

    /* Navbar styles */
    .navbar {
      background-color: #007bff;
      padding: 10px 30px;
    }

    .navbar .navbar-nav .nav-link {
      color: white;
      font-size: 16px;
      padding: 10px 20px;
      transition: color 0.3s ease;
    }

    .navbar .navbar-nav .nav-link:hover {
      color: #ffcc00; /* Gold color on hover */
    }

    .navbar-brand {
      color: white;
      font-size: 24px;
      font-weight: bold;
    }

    .navbar-nav .nav-item {
      margin-right: 15px;
    }

    /* Container styling */
    .container {
      max-width: 1000px;
      margin: 0 auto;
      background-color: white;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    /* Heading styles */
    h1 {
      font-size: 36px;
      font-weight: bold;
      color: #333;
      text-align: center;
      margin-bottom: 20px;
    }

    /* Welcome message */
    .welcome-message {
      font-size: 20px;
      color: #555;
      text-align: center;
      margin-bottom: 40px;
    }

    /* Action buttons */
    .admin-actions {
      text-align: center;
    }

    .btn-custom {
      background-color: #28a745;
      color: white;
      padding: 12px 30px;
      font-size: 18px;
      border-radius: 5px;
      margin: 10px 0;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    .btn-custom:hover {
      background-color: #218838;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    .btn-danger {
      background-color: #dc3545;
      color: white;
      padding: 12px 30px;
      font-size: 18px;
      border-radius: 5px;
      margin: 10px 0;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    .btn-danger:hover {
      background-color: #c82333;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    /* Responsive styling */
    @media (max-width: 768px) {
      .container {
        padding: 20px;
      }

      .navbar .navbar-nav {
        flex-direction: column;
        align-items: center;
      }

      .navbar .navbar-nav .nav-link {
        margin: 10px 0;
        font-size: 18px;
      }

      .btn-custom, .btn-danger {
        width: 100%;
        padding: 15px;
        font-size: 20px;
      }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
      <a href="#" class="navbar-brand">Admin Dashboard</a>
      <div class="navbar-nav ml-auto">
        <a href="book.html" class="nav-item nav-link">Add Book</a>
        <a href="view" class="nav-item nav-link">View Book</a>
        <a href="logout" class="nav-item nav-link">Logout</a>
      </div>
    </div>
  </nav>

  <!-- Main Content -->
  <div class="container">
    <h1>Welcome to Admin Dashboard</h1>

    <div class="welcome-message">
      <%
        AdminBean ab = (AdminBean) session.getAttribute("abean");
        out.println("Hello, " + ab.getfName() + "<br>");
      %>
      Welcome Admin! You have full control over the store.
    </div>

    <!-- Admin Actions -->
    <div class="admin-actions">
      <a href="book.html" class="btn btn-custom">Add New Book</a>
      <a href="view" class="btn btn-custom">View All Books</a>
      <a href="logout" class="btn btn-danger">Logout</a>
    </div>
  </div>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
