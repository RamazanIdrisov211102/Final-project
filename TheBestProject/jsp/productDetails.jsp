<%@ page import="kz.baibalaeva.javaEE.Product" %>
<%@ page import="kz.baibalaeva.javaEE.Comment" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 29.11.2022
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Details</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>

<div class="mainDiv">
    <div class="blogInfo">

        <%
            Product blog = (Product) request.getSession().getAttribute("product");
        %>
        <%
            if(blog != null){
        %>
       <img style="width: 40%;   display: table; margin: 0 auto; " src="<%=blog.getPhoto()%>">
        <p ><%=blog.getName()%></p>
        <p><%=blog.getDescription()%></p>
        <p><%=blog.getPrice()%></p>
        <p>Posted by<%=blog.getUser_id().getEmail()%> at <%=blog.getPost_date()%></p>
        <%
            if (currentAdmin!=null){
        %>

        <form action="/editProduct" method="get">
            <input type="hidden" value="<%=blog.getId()%>" name="id">
            <button class="btn btn-primary"> EDIT</button>
        </form>

        <%
            }
            if(currentUser != null){
        %>
        <form action="/addComment" method="post">
            <input type="hidden" name="blog_id" value="<%=blog.getId()%>">
            <textarea class="form-control" placeholder="write a comment" name="comment"></textarea>
            <button type="submit" class="btn-success mt-3">ADD COMMENT</button>
        </form>
        <%
            }
        %>
        <%
            ArrayList<Comment> comments = (ArrayList<Comment>) request.getSession().getAttribute("comments");
            if(comments != null){
                for(Comment comment : comments){

        %>
        <div>
            <div>
                <h5><%=comment.getUser().getEmail()%></h5>
                <p><%=comment.getComment()%></p>
                <p>At <strong><%=comment.getPost_date()%></strong></p>
            </div>
        </div>
        <%
                    }
                }
            }
        %>
    </div>
</div>

</body>
</html>
