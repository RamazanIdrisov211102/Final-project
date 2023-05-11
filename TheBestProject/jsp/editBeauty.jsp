<%@ page import="kz.baibalaeva.javaEE.Beauty" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25.11.2022
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit page</title>
  <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div class="mainDiv">
  <%

    Beauty beauty = (Beauty) request.getSession().getAttribute("beauty");

  %>
  <form action="/editBeauty" method="post">
    <div class="mb-3">
      <label for="exampleInputId" class="form-label"></label>
      <input type="hidden" class="form-control" id="exampleInputId" aria-describedby="emailHelp" value="<%=beauty.getId()%>" name="id">
    </div>
    <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Masters:</label>
      <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=beauty.getMasters()%>" name="masters">
    </div>
    <div class="mb-3">
      <label for="exampleInputPassword1" class="form-label">Services:</label>
      <input type="text" class="form-control" id="exampleInputPassword1" value="<%=beauty.getServices()%>" name="services">
    </div>
    <div class="mb-3">
      <label for="exampleInputAA" class="form-label">Price</label>
      <input type="number" class="form-control" id="exampleInputAA" value="<%=beauty.getPrice()%>" name="price">
    </div>

    <div class="mb-3">
      <label for="exampl" class="form-label">Datetime</label>
      <input type="date" class="form-control" id="exampl" value="<%=beauty.getDatetime()%>" name="datetime">
    </div>

    <div class="mb-3">
      <label for="exam" class="form-label">Photo:</label>
      <input type="text" class="form-control" id="exam" value="<%=beauty.getPhoto()%>" name="photo">
    </div>
    <button type="submit" class="btn btn-primary">Save</button>

  </form>

  <form action="/deleteBeauty" method="post">
    <div class="mb-3">
      <label for="exampleInputId2" class="form-label"></label>
      <input type="hidden" class="form-control" id="exampleInputId2" aria-describedby="emailHelp" value="<%=beauty.getId()%>" name="id">
    </div>
    <button type="submit" class="btn btn-danger">Delete</button>
  </form>

</div>

</body>
</html>
