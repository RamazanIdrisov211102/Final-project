<%@ page import="kz.baibalaeva.javaEE.Beauty" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.baibalaeva.javaEE.User" %>
<%@ page import="kz.baibalaeva.javaEE.Product" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 27.11.2022
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%
    String error = request.getParameter("emailError");
    String errorp= request.getParameter("passwordError");
    String success = request.getParameter("success");
    if (error!=null){
%>
    <div class="alert alert-danger alert-dismissible fade show">
        Email Error!
    </div>
<%
    }  if (errorp!= null) {

%>
<div class="alert alert-danger alert-dismissible fade show">
    Password Error!
</div>
<%
    }  if (success!= null) {

%>
<div class="alert alert-success alert-dismissible fade show">
   Welcome to beauty world!
</div>
<%
    }
%>

<%@include file="vendor/navbar.jsp"%>

<%
    String language = request.getAttribute("language").toString();
%>


<%
    if (language.equals("English")){
%>

<br>

<%
    if (currentUser!=null && currentAdmin==null){

%>
<button type="submit"><a href="/myOrders?id=<%=currentUser.getId()%>">Application of my products</a></button>
<%
    }
%>


<img src="https://i.artfile.ru/2560x1440_1503878_[www.ArtFile.ru].jpg"   height="340px" width="335px" style="
 margin-left: 810px; border-radius: 180px ">

<h2 style="margin: -290px 0; font-style: italic"><b>&emsp;A place that makes you feel great and beauty.</b></h2>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<p style="margin: -310px 0; color: lightslategrey ">&emsp;Your unique beauty
    &emsp;Time to reveal yourself &emsp;Glow you`re face</p>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h3>Our products:</h3>
<div style="justify-content: space-between; display: flex; " class="mainDiv">
    <%
        ArrayList<Product> products =(ArrayList<Product>) request.getAttribute("product");
        if (products!= null){
            for (Product pr: products){

    %>
    <div class="card" style="width: 18rem;">
        <img src="<%=pr.getPhoto()%>" class="card-img-top svoiimg" alt="...">
        <div class="card-body">
            <h5 class="card-title"><%=pr.getName()%></h5>
            <p class="card-text"><%=pr.getPrice()%></p>
            <a href="/readblog?id=<%=pr.getId()%>" class="btn btn-primary">Add comment </a>
            <p class="card-text"><%=pr.getPost_date()%></p>
            <form action="/orderProduct" method="post">

                <input type="hidden" value="<%=pr.getPhoto()%>" name="photo">
                <input type="hidden" value="<%=pr.getName()%>" name="name">
                <input type="hidden" value="Lip" name="description">
                <input type="hidden" value="<%=pr.getPrice()%>" name="price">
                <button  class="btn btn-primary" type="submit">Leave a request</button>
            </form>

        </div>
    </div>
    <%
            }
        }

    %>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<%
}else if (language.equals("Russian")){
%>

<%
    if (currentUser!=null  && currentAdmin==null){

%>
<button type="submit"><a href="/myOrders?id=<%=currentUser.getId()%>">Application of my products</a></button>
<%
    }
%>

<br>

<img src="https://i.artfile.ru/2560x1440_1503878_[www.ArtFile.ru].jpg"   height="340px" width="335px" style="
 margin-left: 810px; border-radius: 180px ">

<h5 style="margin: -290px 0; font-style: italic"><b>&emsp;Место, которое заставляет вас чувствовать себя великолепно и красиво.</b></h5>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<p style="margin: -310px 0; color: lightslategrey ">&emsp;Ваша неповторимая красота
    &emsp;Время раскрыть себя &emsp;Сияние твоего лица</p>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h3>Наши продукты:</h3>
<div style="justify-content: space-between; display: flex; " class="mainDiv">
    <%
        ArrayList<Product> products =(ArrayList<Product>) request.getAttribute("product");
        if (products!= null){
            for (Product pr: products){

    %>
    <div class="card" style="width: 18rem;">
        <img src="<%=pr.getPhoto()%>" class="card-img-top svoiimg" alt="...">
        <div class="card-body">
            <h5 class="card-title"><%=pr.getName()%></h5>
            <p class="card-text"><%=pr.getPrice()%></p>
            <a href="/readblog?id=<%=pr.getId()%>" class="btn btn-primary">Add comment </a>
            <p class="card-text"><%=pr.getPost_date()%></p>
            <form action="/orderProduct" method="post">

                <input type="hidden" value="<%=pr.getPhoto()%>" name="photo">
                <input type="hidden" value="<%=pr.getName()%>" name="name">
                <input type="hidden" value="Lip" name="description">
                <input type="hidden" value="<%=pr.getPrice()%>" name="price">
                <button  class="btn btn-primary" type="submit">Leave a request</button>
            </form>




        </div>
    </div>
    <%
            }
        }

    %>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<%
}else {
%>
<br>

<%
    if (currentUser!=null  && currentAdmin==null){

%>
<button type="submit"><a href="/myOrders?id=<%=currentUser.getId()%>">Application of my products</a></button>
<%
    }
%>



<img src="https://i.artfile.ru/2560x1440_1503878_[www.ArtFile.ru].jpg"   height="340px" width="335px" style="
 margin-left: 810px; border-radius: 180px ">

<h2 style="margin: -290px 0; font-style: italic"><b>&emsp;Сізді керемет және әдемі сезінетін орын.</b></h2>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<p style="margin: -310px 0; color: lightslategrey ">&emsp;Сіздің ерекше сұлулығыңыз
    &emsp;Өзіңізді ашуға уақыт келді &emsp;Сіздің бетіңіздің жарқырауы</p>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h3>Біздің өнімдер:</h3>
<div style="justify-content: space-between; display: flex; " class="mainDiv">
    <%
        ArrayList<Product> products =(ArrayList<Product>) request.getAttribute("product");
        if (products!= null){
            for (Product pr: products){

    %>
    <div class="card" style="width: 18rem;">
        <img src="<%=pr.getPhoto()%>" class="card-img-top svoiimg" alt="...">
        <div class="card-body">
            <h5 class="card-title"><%=pr.getName()%></h5>
            <p class="card-text"><%=pr.getPrice()%></p>
            <a href="/readblog?id=<%=pr.getId()%>" class="btn btn-primary">Add comment</a>
            <p class="card-text"><%=pr.getPost_date()%></p>
            <form action="/orderProduct" method="post">

                <input type="hidden" value="<%=pr.getPhoto()%>" name="photo">
                <input type="hidden" value="<%=pr.getName()%>" name="name">
                <input type="hidden" value="Lip" name="description">
                <input type="hidden" value="<%=pr.getPrice()%>" name="price">
                <button  class="btn btn-primary" type="submit">Leave a request</button>
            </form>



        </div>
    </div>
    <%
            }
        }

    %>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<%
    }
%>


</body>
</html>
