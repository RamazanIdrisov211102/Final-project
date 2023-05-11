<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.baibalaeva.javaEE.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 05.12.2022
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin User</title>
    <%@include file="vendor/head.jsp"%>


    <style type="text/css">

        .m {

            float: left;

            margin-right: 10px;

        }
    </style>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div style=" margin-left: 30px" class="m">
<table border=1>
    <tr>
        <th style="background-color: aqua">Id</th>
        <th style="background-color: #A7CECC">Email</th>
        <th style="background-color: mediumslateblue">Password</th>
        <th style="background-color: indianred">City</th>
        <th  style="background-color: khaki">User Name</th>
        <th>Action</th>
    </tr>
</table>

</div>
<div style="margin-top:30px; margin-left: -310px"  class="m">
<%

    ArrayList<User>  users = (ArrayList<User>) request.getSession().getAttribute("users");
    if (users!=null){
        for (User usy: users){
%>

<table style="margin-top:4px"   border=2>


    <tr>
        <td style="background-color: aqua"><%=usy.getId()%><br></td>
        <td style="background-color: #A7CECC"><%=usy.getEmail()%><br></td>
        <td style="background-color: mediumslateblue"><%=usy.getPassword()%><br></td>
        <td style="background-color: indianred"><%=usy.getCity()%><br></td>
        <td style="background-color: khaki"><%=usy.getUserName()%><br></td>
        <td>
            <form action="/adminEdit" method="get">
                <input type="hidden" value="<%=usy.getId()%>" name="id">
                <button class="btn btn-primary"> EDIT</button>
            </form>
        </td>
        <td>
            <form action="/deleteU" method="post">
                <input type="hidden" value="<%=usy.getId()%>" name="id">
                <button class="btn btn-primary"> Delete</button>
            </form>
        </td>
    </tr>



</table>

    <%
            }
        }
    %>


</div>




</body>
</html>
