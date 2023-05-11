<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03.12.2022
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add products</title>
  <%@include file="vendor/head.jsp"%>
  <style>
    * {box-sizing: border-box;}

    /* Style the input container */
    .input-container {
      display: flex;
      width: 100%;
      margin-bottom: 15px;
    }

    /* Style the form icons */
    .icon {
      padding: 10px;
      background: indianred;
      color: white;
      min-width: 50px;
      text-align: center;
    }

    /* Style the input fields */
    .input-field {
      width: 100%;
      padding: 10px;
      outline: none;
    }

    .input-field:focus {
      border: 2px solid peachpuff;
    }

    /* Set a style for the submit button */
    .btn {
      background-color: saddlebrown;
      color: white;
      padding: 15px 20px;
      border: none;
      cursor: pointer;
      width: 100%;
      opacity: 0.9;
    }

    .btn:hover {
      opacity: 1;
    }
  </style>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<form action="/addProduct"  method="post">

  <h2>Add product</h2>

  <div class="input-container">
    <i class="fa fa-envelope icon"></i>
    <input class="input-field" type="text" placeholder="Enter photo link" name="photo">
  </div>

  <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text" placeholder="Enter name" name="name">
  </div>

  <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text" placeholder="Enter description" name="description">
  </div>

  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="number" placeholder="Enter price" name="price">
  </div>

  <div class="input-container">

    <input class="input-field" type="hidden" placeholder="Repeat password" name="user_id">
  </div>

  <button type="submit" class="btn">Add</button>
</form>
</body>
</html>
