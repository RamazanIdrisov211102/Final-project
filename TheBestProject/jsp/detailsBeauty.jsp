<%@ page import="kz.baibalaeva.javaEE.Beauty" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25.11.2022
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details page</title>
  <%@include file="vendor/head.jsp"%>
  <style>
    * {box-sizing:border-box;}
    .wrap {
      height: 200px;
      padding: 25px;
    }
    .gradient {
      height: 150px;
      width: 50%;
      margin: 0 auto;
      border: 10px solid transparent;
      border-image: 10 repeating-linear-gradient(45deg, #A7CECC, #A7CECC 10px, transparent 10px, transparent 20px, #F8463F 20px, #F8463F 30px,transparent 30px, transparent 40px);
    }
    .rounded {
      counter-reset: li;
      list-style: none;
      font: 14px "Trebuchet MS", "Lucida Sans";
      padding: 0;
      text-shadow: 0 1px 0 rgba(255,255,255,.5);
    }
    .rounded a {
      position: relative;
      display: block;
      padding: .4em .4em .4em 2em;
      margin: .5em 0;
      background: #DAD2CA;
      color: #444;
      text-decoration: none;
      border-radius: .3em;
      transition: .3s ease-out;
    }
    .rounded a:hover {background: #E9E4E0;}
    .rounded a:hover:before {transform: rotate(360deg);}
    .rounded a:before {
      content: counter(li);
      counter-increment: li;
      position: absolute;
      left: -1.3em;
      top: 50%;
      margin-top: -1.3em;
      background: #8FD4C1;
      height: 2em;
      width: 2em;
      line-height: 2em;
      border: .3em solid white;
      text-align: center;
      font-weight: bold;
      border-radius: 2em;
      transition: all .3s ease-out;
    }
  </style>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>

<%
  ArrayList<Beauty> beauties = (ArrayList<Beauty>) request.getAttribute("beauties");
  if (beauties!=null){
    for (Beauty bt: beauties){
%>
<div class="wrap"><div class="gradient">
  <ol class="rounded">
    <li><%=bt.getMasters()%>></li>
    <li><%=bt.getServices()%>></li>
    <li><%=bt.getPrice()%>></li>
    <li><%=bt.getDatetime()%>></li>
    <li><%=bt.getPhoto()%>></li>
    <li><%=bt.getPost_date()%>></li>
    <li><%=bt.getUser_id().getEmail()%>></li>
    <li><%=bt.getUser_id().getUserName()%>></li>
    <form action="/deleteBeauty" method="post">
      <div class="mb-3">
        <label for="exampleInputId2" class="form-label"></label>
        <input type="hidden" class="form-control" id="exampleInputId2" aria-describedby="emailHelp" value="<%=bt.getId()%>" name="id">
      </div>
      <button type="submit" class="btn btn-danger">Delete</button>
    </form>
  </ol>


</div></div>
<%
  }
  }
%>

</body>
</html>
