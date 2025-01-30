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
  <title>Order Product</title>

  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

  <style>
    /* Full-page background styling */
    body {
      font-family: Arial, sans-serif;
      background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmp9TXQMwM7nBGQgrTR6EngfsSXx385Hyi-w&s');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      color: #333;
      margin: 0;
      padding: 0;
    }

    /* Navbar Styling */
    .navbar {
      background-color: #333;
      padding: 15px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .navbar .title {
      font-size: 24px;
      font-weight: bold;
      color: #fff;
    }

    .navbar .customer-section {
      display: flex;
      align-items: center;
      font-size: 18px;
      font-weight: normal;
      color: #fff;
    }

    .navbar .customer-section img {
      width: 24px;
      height: 24px;
      margin-right: 8px;
    }

    /* Optional overlay for readability */
    .overlay {
      background-color: rgba(255, 255, 255, 0.50);
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
    }

    /* Centered container styling */
    .container {
      position: relative;
      z-index: 2;
      margin-top: 50px;
      padding: 30px;
      max-width: 600px;
      background-color: rgba(192, 192, 192, 0.9);
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
      text-align: left;
    }

    h1 {
      color: #0056b3;
      text-align: center;
      font-size: 28px;
      margin-bottom: 30px;
    }

    label {
      font-weight: bold;
      display: block;
      margin: 10px 0 5px;
    }

    input[type="text"] {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      font-size: 16px;
      margin-bottom: 15px;
    }

    button {
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 18px;
      cursor: pointer;
      margin-top: 15px;
    }

    button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <div class="navbar">
    <div class="title">Electronic Store</div>
    <div class="customer-section">
      <img src="https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg" alt="Customer Icon">
      <div>Customer</div>
    </div>
  </div>

  <!-- Overlay for background text readability -->
  <div class="overlay"></div>

  <div class="container">
    <h1>
      <%
        CustomerBean cbean = (CustomerBean) session.getAttribute("cBean");
        ArrayList<BookBean> al = (ArrayList<BookBean>) session.getAttribute("alist");
        BookBean pb = (BookBean) request.getAttribute("bbean");
        out.println("Mr." + cbean.getFirstName() + "<br>" + "Please Choose Required Quantity" + "<br>");
      %>
    </h1>
    
    <form action="order" method="post">
      <div class="form-group">
        <label for="pname">Book Name</label>
        <input type="text" class="form-control" name="pname" value="<%= pb.getName() %>" readonly="readonly">
      </div>
      
      <div class="form-group">
        <label for="pcompany">Book Author</label>
        <input type="text" class="form-control" name="pcompany" value="<%= pb.getAuthor() %>" readonly="readonly">
      </div>
      
      <div class="form-group">
        <label for="pprice">Book Price</label>
        <input type="text" class="form-control" name="pprice" value="<%= pb.getPrice() %>" readonly="readonly">
      </div>
      
      <div class="form-group">
        <label for="pqty">Book Quantity</label>
        <input type="text" class="form-control" name="pqty" value="<%= pb.getQty() %>" readonly="readonly">
      </div>

      <div class="form-group">
        <label for="rqty">Required Quantity</label>
        <input type="text" class="form-control" name="rqty" required="required">
      </div>

      <input type="hidden" name="pcode" value="<%= pb.getCode() %>">
      
      <button type="submit" class="btn btn-primary">Order</button>
    </form>
  </div>

  <!-- Bootstrap JS (Optional but required for some Bootstrap features) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
