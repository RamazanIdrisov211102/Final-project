<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28.11.2022
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of services</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div style="width: 80%;   display: table; margin: 0 auto; "  id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
        <a href="hairBeauty"><img  src="https://g.infor.pl/p/_files/28161000/fryzjer-zaklad-fryzjerski-28161179.jpg" class="d-block w-100" alt="..."></a>
            <div class="carousel-caption d-none d-md-block">
                <h5>Hair Service</h5>
                <p>We will restore it in the best way.</p>
            </div>
        </div>
        <div class="carousel-item">
            <a href="lashBeauty"> <img src="https://images.squarespace-cdn.com/content/v1/5b76498f297114d71535e32d/1590632979521-50UKNX8DVGP4R1K4UWPL/AdobeStock_168894720.jpg" class="d-block w-100" alt="..."></a>
            <div class="carousel-caption d-none d-md-block">
                <h5>Lash Service</h5>
                <p>There are all kinds of eyelashes.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://www.soupstock.in/system/files/images/6e/9e/shutterstock_156016604.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>Nail Service</h5>
                <p>The best quality.</p>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Предыдущий</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Следующий</span>
    </button>
</div>
</body>
</html>
