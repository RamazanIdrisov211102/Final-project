<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="kz.baibalaeva.javaEE.Product" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04.12.2022
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My orders</title>
    <%@include file="vendor/head.jsp"%>

</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<%
    ArrayList<Product> orders= (ArrayList<Product>) request.getSession().getAttribute("orders");
    if (orders!=null){
        for (Product or:orders){
    
%>
<div class="wrap"><div class="gradient">
    <ol class="rounded">
        <li style="list-style-type: circle"><img width="25%" src="<%=or.getPhoto()%>">
            <ol>
                <li style="list-style-type: disc"><%=or.getName()%></li>
                <li style="list-style-type: disc"><%=or.getDescription()%></li>
                <li style="list-style-type: disc"><%=or.getPrice()%></li>
                <li style="list-style-type: disc"><%=or.getUser_id().getEmail()%></li>
                <li style="list-style-type: disc"><%=or.getUser_id().getUserName()%></li>
                
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
