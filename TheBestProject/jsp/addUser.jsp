<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 02.12.2022
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
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
            background: mediumslateblue;
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
            border: 2px solid pink;
        }

        /* Set a style for the submit button */
        .btn {
            background-color: hotpink;
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
<form action="/addUser"  method="post">

    <h2>Add users</h2>

    <div class="input-container">
        <i class="fa fa-envelope icon"></i>
        <input class="input-field" type="text" placeholder="Enter email" name="email">
    </div>

    <div class="input-container">
        <i class="fa fa-user icon"></i>
        <input class="input-field" type="text" placeholder="Enter username" name="userName">
    </div>

    <div class="input-container">
        <i class="fa fa-user icon"></i>
        <input class="input-field" type="text" placeholder="Enter password" name="password">
    </div>

    <div class="input-container">
        <i class="fa fa-key icon"></i>
        <input class="input-field" type="password" placeholder="Repeat password" name="password1">
    </div>

    <div class="input-container">
        <i class="fa fa-user icon"></i>
        <input class="input-field" type="text" placeholder="Enter city" name="city">
    </div>


    <button type="submit" class="btn">Add</button>
</form>
</body>
</html>
