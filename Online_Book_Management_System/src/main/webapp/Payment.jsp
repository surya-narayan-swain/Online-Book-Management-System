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
  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f4f4f4;
      background-image: url('background.jpg'); /* Background image */
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
      margin: 0;
      padding: 0;
    }

    .navbar {
      background-color: #007bff;
      padding: 15px 30px;
      color: #fff;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .navbar .title {
      font-size: 28px;
      font-weight: 600;
    }

    .navbar .customer-section {
      display: flex;
      align-items: center;
      font-size: 18px;
      font-weight: normal;
      margin-left: auto; /* Push the customer section to the right */
    }

    .navbar .customer-section img {
      width: 30px;
      height: 30px;
      margin-right: 10px;
    }

    h1 {
      color: #0066cc;
      font-size: 28px;
      text-align: center;
      margin-top: 40px;
    }

    .container {
      max-width: 500px;
      margin-top: 60px;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    label {
      font-size: 18px;
      margin-top: 10px;
      font-weight: bold;
    }

    input[type="text"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border-radius: 5px;
      border: 1px solid #ccc;
      font-size: 16px;
      background-color: #f8f8f8;
    }

    .btn-primary {
      background-color: #007bff;
      border: none;
      color: #fff;
      padding: 12px 20px;
      font-size: 18px;
      border-radius: 5px;
      width: 100%;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
      background-color: #0056b3;
    }

    .btn-secondary {
      background-color: #dc3545;
      border: none;
      color: #fff;
      padding: 12px 20px;
      font-size: 18px;
      border-radius: 5px;
      width: 100%;
      cursor: pointer;
      margin-top: 10px;
      transition: background-color 0.3s ease;
    }

    .btn-secondary:hover {
      background-color: #c82333;
    }

    .form-group {
      margin-bottom: 20px;
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

  <!-- Main Content -->
  <div class="container">
    <h1>
      <%
        CustomerBean cbean = (CustomerBean) session.getAttribute("cBean");
        ArrayList<BookBean> al = (ArrayList<BookBean>) session.getAttribute("productlist");
        BookBean pb = (BookBean) request.getAttribute("pbean");
        out.println("Mr. " + cbean.getFirstName() + "<br>" + "Please Check Your Orders " + "<br><br>");
      %>
    </h1>

    <form action="pco" method="post">
      <div class="form-group">
        <label for="pname">Book Name</label>
        <input type="text" class="form-control" name="pname" value="<%= pb.getName() %>" readonly>
      </div>

      <div class="form-group">
        <label for="pcompany">Book Author</label>
        <input type="text" class="form-control" name="pcompany" value="<%= pb.getAuthor() %>" readonly>
      </div>

      <div class="form-group">
        <label for="pprice">Book Price</label>
        <input type="text" class="form-control" name="pprice" value="<%= pb.getPrice() %>" readonly>
      </div>

      <div class="form-group">
        <label for="rqty">Required Quantity</label>
        <input type="text" class="form-control" name="rqty" value="<%= pb.getReqQty() %>" readonly>
      </div>

      <div class="form-group">
        <label for="tprice">Total Price</label>
        <input type="text" class="form-control" name="tprice" value="<%= pb.getTotalPrice() %>" readonly>
      </div>

      <input type="hidden" name="pcode" value="<%= pb.getCode() %>">

      <button type="submit" class="btn btn-primary">Place Order</button>
      <a href="logout" class="btn btn-secondary">Logout</a>
    </form>
  </div>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
