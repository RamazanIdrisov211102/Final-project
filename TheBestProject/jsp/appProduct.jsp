<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.baibalaeva.javaEE.Product" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04.12.2022
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products</title>
    <%@include file="vendor/head.jsp"%>

</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<%
    ArrayList<Product> products = (ArrayList<Product>) request.getSession().getAttribute("orders");
    if (products!=null){
        for (Product pr: products){
%>
<div class="wrap"><div class="gradient">
    <ol class="rounded">
        <li style="list-style-type: circle"><img width="25%" src="<%=pr.getPhoto()%>">
            <ol>
                <li style="list-style-type: disc"><%=pr.getName()%></li>
                <li style="list-style-type: disc"><%=pr.getDescription()%></li>
                <li style="list-style-type: disc"><%=pr.getPrice()%></li>
                <li style="list-style-type: disc"><%=pr.getUser_id().getEmail()%></li>
                <li style="list-style-type: disc"><%=pr.getUser_id().getUserName()%></li>
                <form method="post" action="/deleteAppProduct">
                    <input type="hidden" value="<%=pr.getId()%>" name="id">
                    <button type="submit">Delete</button>
                </form>
            </ol>
        </li>
    </ol>
</div></div>
<%
    }
    }
%>
</body>
</html>
