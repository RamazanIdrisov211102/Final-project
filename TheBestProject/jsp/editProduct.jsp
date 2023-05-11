<%@ page import="kz.baibalaeva.javaEE.Product" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03.12.2022
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
  <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div class="mainDiv">
  <%
    Product student = (Product) request.getSession().getAttribute("product");

  %>
  <form action="/editProduct" method="post">
    <div class="mb-3">
      <label for="exampleInputId" class="form-label"></label>
      <input type="hidden" class="form-control" id="exampleInputId" aria-describedby="emailHelp" value="<%=student.getId()%>" name="id">
    </div>
    <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Photo</label>
      <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=student.getPhoto()%>" name="photo">
    </div>
    <div class="mb-3">
      <label for="exampleInputPassword1" class="form-label">Name</label>
      <input type="text" class="form-control" id="exampleInputPassword1" value="<%=student.getName()%>" name="name">
    </div>
    <div class="mb-3">
      <label for="exampleInputAA" class="form-label">Description</label>
      <input type="text" class="form-control" id="exampleInputAA" value="<%=student.getDescription()%>" name="description">
    </div>
    <div class="mb-3">
      <label for="exampleInputAAA" class="form-label">Price</label>
      <input type="text" class="form-control" id="exampleInputAAA" value="<%=student.getPrice()%>" name="price">
    </div>
    <button type="submit" class="btn btn-primary">Save</button>

  </form>

  <form action="/deleteProduct" method="post">
    <div class="mb-3">
      <label for="exampleInputId2" class="form-label"></label>
      <input type="hidden" class="form-control" id="exampleInputId2" aria-describedby="emailHelp" value="<%=student.getId()%>" name="id">
    </div>
    <button type="submit" class="btn btn-primary">Delete</button>
  </form>

</div>
</body>
</html>
