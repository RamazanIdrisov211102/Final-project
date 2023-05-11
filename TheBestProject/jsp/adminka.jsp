<%@ page import="kz.baibalaeva.javaEE.Beauty" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 05.12.2022
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Applications</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>

<%
    if (currentUser!= null&&  currentAdmin==null){

    ArrayList<Beauty> beauties= (ArrayList<Beauty>) request.getSession().getAttribute("beauties");
    if (beauties!= null){
        for (Beauty bt: beauties){
%>
<div class="wrap"><div class="gradient">
    <ol class="rounded">
        <li style="list-style-type: circle"><%=bt.getMasters()%>
            <ol>
                <li style="list-style-type: disc"><%=bt.getServices()%></li>
                <li style="list-style-type: disc"><%=bt.getPrice()%></li>
                <li style="list-style-type: disc"><%=bt.getDatetime()%></li>
                <li style="list-style-type: disc"><%=bt.getPhoto()%></li>
                <li style="list-style-type: disc"><%=bt.getPost_date()%></li>
                <li style="list-style-type: disc"><%=bt.getUser_id().getEmail()%></li>
                <li style="list-style-type: disc"><%=bt.getUser_id().getUserName()%></li>
            </ol>
        </li>
    </ol>
</div></div>
<%
        }
    }
    }
%>






</body>
</html>
