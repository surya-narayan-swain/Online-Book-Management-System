<%@page import="test.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Confirmation</title>

  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Google Fonts (Poppins for a modern look) -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

  <style>
    /* Basic styling */
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f9f9f9; /* Light grey background */
      margin: 0;
      padding: 0;
    }

    /* Navbar styling */
    .navbar {
      background-color: #007bff; /* Bootstrap blue */
      padding: 20px 30px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .navbar .title {
      font-size: 28px;
      font-weight: 600;
      color: white;
    }

    .navbar .customer-section {
      display: flex;
      align-items: center;
      font-size: 18px;
      color: white;
      margin-left: auto; /* This will align the customer section to the right */
    }

    .navbar .customer-section img {
      width: 30px;
      height: 30px;
      margin-right: 10px;
    }

    /* Main container */
    .container {
      position: relative;
      z-index: 2;
      margin-top: 100px;
      padding: 40px;
      background-color: white;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      text-align: center;
      max-width: 700px;
      margin-left: auto;
      margin-right: auto;
      transition: transform 0.3s ease;
    }

    .container:hover {
      transform: scale(1.05); /* Slight zoom effect on hover */
    }

    .success-gif {
      width: 150px;
      margin-bottom: 30px;
    }

    h1 {
      color: #28a745; /* Green for success */
      font-size: 32px;
      font-weight: 600;
      margin-bottom: 20px;
    }

    p {
      font-size: 18px;
      color: #555;
      margin-bottom: 30px;
    }

    /* Button styling */
    .btn {
      display: inline-block;
      padding: 12px 30px;
      text-decoration: none;
      font-size: 18px;
      border-radius: 5px;
      margin: 10px 0;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
    }

    /* Primary button (View Product) */
    .btn-primary {
      background-color: #007bff;
      border: none;
      color: white;
    }

    .btn-primary:hover {
      background-color: #0056b3;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    /* Danger button (Logout) */
    .btn-danger {
      background-color: #dc3545;
      border: none;
      color: white;
    }

    .btn-danger:hover {
      background-color: #c82333;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="title">Book Store</div>
    <div class="customer-section ml-auto">
      <img src="https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg" alt="Customer Icon">
      <div>Customer</div>
    </div>
  </nav>

  <!-- Order confirmation content -->
  <div class="container">
    <h1>
      <%
        CustomerBean cbean = (CustomerBean) session.getAttribute("cBean");
        ArrayList<BookBean> al = (ArrayList<BookBean>) session.getAttribute("productlist");
        BookBean pb = (BookBean) request.getAttribute("bbean");
        out.println("Hello Mr. " + cbean.getFirstName() + "<br>"
                    + "Payment Successfully!! " + "<br>"
                    + "Your Order Has Been Placed Successfully!" + "<br>");
      %>
    </h1>

    <!-- Success gif animation -->
    <img src="https://i.pinimg.com/originals/57/b5/48/57b54818e2011d482548fb54201ce6c1.gif" alt="Success" class="success-gif">

    <p>Thank you for your order! You will receive a confirmation email shortly.</p><br>

    <!-- Action buttons -->
    <a href="Cview" class="btn btn-primary btn-lg">View Product</a><br>
    <a href="Logout" class="btn btn-danger btn-lg">Logout</a><br><br>
  </div>

  <!-- Bootstrap JS and dependencies (Optional but required for some Bootstrap components) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
