<%@ page import="kz.baibalaeva.javaEE.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 05.12.2022
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<%
  User us =(User) request.getSession().getAttribute("user");
%>

<form action="/adminEdit" method="post">
  <div class="mb-3">
    <label for="exampleInputId" class="form-label"></label>
    <input type="hidden" class="form-control" id="exampleInputId" aria-describedby="emailHelp" value="<%=us.getId()%>" name="id">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email:</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=us.getEmail()%>" name="email">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password:</label>
    <input type="text" class="form-control" id="exampleInputPassword1" value="<%=us.getPassword()%>" name="password">
  </div>
  <div class="mb-3">
    <label for="exampleInputAA" class="form-label">City:</label>
    <input type="text" class="form-control" id="exampleInputAA" value="<%=us.getCity()%>" name="city">
  </div>

  <div class="mb-3">
    <label for="exampl" class="form-label">User name:</label>
    <input type="text" class="form-control" id="exampl" value="<%=us.getUserName()%>" name="userName">
  </div>


  <button style="height: 10px" type="submit" >Save</button>

</form>
</body>
</html>
