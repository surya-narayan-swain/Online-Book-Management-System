<%@page import="java.util.Iterator"%>
<%@page import="test.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Page</title>

  <style>
    /* Global Styles */
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 0;
      color: #333;
      overflow-x: hidden;
    }

    /* Navbar Styling */
    .navbar {
      background-color: #2c3e50;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 10;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .navbar .title {
      font-size: 32px;
      color: #fff;
      font-weight: 600;
    }

    .navbar .customer-section {
      display: flex;
      align-items: center;
      color: #fff;
    }

    .navbar .customer-section img {
      width: 35px;
      height: 35px;
      margin-right: 20px;
    }

    /* Main Content Area */
    .main-content {
      margin-top: 100px;
      padding: 50px 20px;
      text-align: center;
    }

    h2 {
      font-size: 36px;
      color: #333;
      margin-bottom: 30px;
      font-weight: 600;
    }

    /* Product Container (Grid Layout) */
    .product-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 30px;
    }

    /* Product Card Styling */
    .product-card {
      background-color: #fff;
      width: 300px;
      padding: 20px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
      transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
      position: relative;
    }

    .product-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
    }

    .product-card h3 {
      font-size: 24px;
      color: #2c3e50;
      margin-bottom: 10px;
      font-weight: 600;
    }

    .product-info {
      color: #777;
      font-size: 18px;
      margin: 10px 0;
    }

    /* Extra Info visible on Hover */
    .extra-info {
      display: none;
      font-size: 16px;
      color: #555;
      margin-top: 10px;
    }

    .product-card:hover .extra-info {
      display: block;
    }

    /* Buy Button Styling */
    .product-card a {
      display: inline-block;
      margin-top: 20px;
      padding: 12px 25px;
      background-color: #3498db;
      color: #fff;
      text-decoration: none;
      font-weight: 600;
      border-radius: 30px;
      transition: background-color 0.3s ease;
    }

    .product-card a:hover {
      background-color: #2980b9;
    }

    /* Logout Button Styling */
    .logout {
      padding: 14px 28px;
      background-color: #e74c3c;
      color: white;
      text-decoration: none;
      font-weight: 600;
      border-radius: 30px;
      text-align: center;
      width: 220px;
      margin: 30px auto;
      display: block;
      transition: background-color 0.3s ease;
    }

    .logout:hover {
      background-color: #c0392b;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .product-container {
        flex-direction: column;
        align-items: center;
      }

      .product-card {
        width: 80%;
      }

      h2 {
        font-size: 28px;
      }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <div class="navbar">
    <div class="title">Book Store</div>
    <div class="customer-section" >
      <img src="https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg" alt="Customer Icon">
      <div style="margin-right:40px ;font-size: 30px">Customer</div>
    </div>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <h2>
      <%
        CustomerBean cbean = (CustomerBean) session.getAttribute("cBean");
        ArrayList<BookBean> al = (ArrayList<BookBean>) session.getAttribute("productlist");
        out.println("Mr. " + cbean.getFirstName() + "<br>" + "Available Books");
      %>
    </h2>

    <div class="product-container">
      <%
        if (al == null || al.size() == 0) {
      %>
        <p style="text-align:center;">There are no Books available at the moment.</p>
      <%
        } else {
          Iterator<BookBean> i = al.iterator();
          while (i.hasNext()) {
            BookBean pb = i.next();
      %>
        <div class="product-card">
          <h3><%= pb.getName() %></h3>
          <div class="product-info">Price: $<%= pb.getPrice() %></div>

          <!-- Extra details shown on hover -->
          <div class="extra-info">
            <p><strong>Book Code:</strong> <%= pb.getCode() %></p>
            <p><strong>Author:</strong> <%= pb.getAuthor() %></p>
            <p><strong>Quantity Available:</strong> <%= pb.getQty() %></p>
          </div>

          <a href="buy?Pcode=<%= pb.getCode() %>">Buy</a>
        </div>
      <%
          }
        }
      %>
    </div>

    <a href="logout" class="logout">Logout</a>
  </div>

</body>
</html>
