<%@page import="test.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Dashboard</title>

  <!-- Google Font for better typography -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

  <!-- New CSS -->
  <style>
    /* Global Styles */
    body {
      font-family: 'Roboto', sans-serif;
      background-color: #f4f7fc; /* Soft light background */
      color: #333;
      margin: 0;
      padding: 0;
    }

    /* Navbar Styling */
    .navbar {
      background-color: #3498db; /* Blue */
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .navbar .title {
      font-size: 26px;
      font-weight: 700;
      color: #fff;
    }

    .navbar .customer-section {
      display: flex;
      align-items: center;
      color: #fff;
    }

    .navbar .customer-section img {
      width: 30px;
      height: 30px;
      margin-right: 10px;
    }

    /* Main Container Styling */
    .container {
      max-width: 900px;
      margin: 50px auto;
      background-color: #fff;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
      transition: all 0.3s ease-in-out;
    }

    .container:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
    }

    /* Welcome Message */
    h1 {
      font-size: 28px;
      color: #2c3e50; /* Dark blue-gray */
      margin-bottom: 20px;
    }

    /* Product Box Section */
    .product-box {
      display: flex;
      justify-content: space-around;
      margin-top: 40px;
    }

    /* Individual Product Card */
    .product-card {
      background-color: #ecf0f1; /* Light gray */
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      width: 25%;
      transition: all 0.3s ease;
      text-align: center;
    }

    .product-card:hover {
      transform: scale(1.05);
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
    }

    .product-card img {
      width: 100%;
      border-radius: 8px;
      margin-bottom: 15px;
    }

    .product-card a {
      display: inline-block;
      padding: 12px 25px;
      color: #fff;
      background-color: #3498db;
      text-decoration: none;
      border-radius: 5px;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    .product-card a:hover {
      background-color: #2980b9;
    }

    /* Logout Button Styling */
    .logout-btn {
      display: inline-block;
      padding: 12px 25px;
      color: #fff;
      background-color: #e74c3c; /* Red */
      text-decoration: none;
      border-radius: 5px;
      font-size: 16px;
      width: 200px;
      text-align: center;
      margin-top: 30px;
      transition: background-color 0.3s ease;
    }

    .logout-btn:hover {
      background-color: #c0392b; /* Darker red */
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .product-box {
        flex-direction: column;
        align-items: center;
      }

      .product-card {
        width: 80%;
        margin-bottom: 20px;
      }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <div class="navbar">
    <div class="title"style="margin: auto;font-size: 35px">Book Store</div>
    <div class="customer-section">
      <img src="https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg" alt="Customer Icon">
      <div>Customer</div>
    </div>
  </div>

  <!-- Main Dashboard Container -->
  <div class="container">
    <h1>
      <%
        CustomerBean cBean = (CustomerBean) session.getAttribute("cBean");
        out.println("Welcome, " + cBean.getFirstName() + "!");
      %>
    </h1>
    <div class="product-box">
      <div class="product-card">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXSIvpZlfkPTS8c1676RSwSaiZCE8PKDed_Q&s" alt="View Product">
        <a href="Cview">View Products</a>
      </div>
    </div>
    <a href="logout" class="logout-btn">Logout</a>
  </div>

</body>
</html>
