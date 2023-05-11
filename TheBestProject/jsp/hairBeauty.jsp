<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 28.11.2022
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hair</title>
  <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div style="width: 80%;   display: table; margin: 0 auto; "  id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>

  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="hairBeauty"><img  src="https://www.foochia.com/wp-content/uploads/2016/08/bigstock-Beautiful-woman-in-hair-salon-83907104.jpg" class="d-block w-100" alt="..."></a>
      <div class="carousel-caption d-none d-md-block">
        <h5 style="background-color: black">Meru Sadykova, 21 year</h5>
        <p style="background-color: rebeccapurple">Sociable and friendly. She has taken many courses and is able to do even complex types of hairstyles.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://www.mycarpaltunnel.com/wp-content/uploads/2015/11/i-love-cutting-hair-says-hairdresser.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5 style="background-color: black">Tomiris Tagasheva, 25 year</h5>
        <p style="background-color: rebeccapurple">Smiling and customer-oriented. Has many certificates and does all kinds of hairstyles.</p>
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

<%
    User current = (User) request.getSession().getAttribute("currentUser");
    if (current!=null){

%>
<div style="background-color: lightpink">
  <form action="addBeauty" method="post">
    <div class="mb-3">
      <label  class="form-label">Masters: </label>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="masters" id="gridRadios1" value="Meru Sadykova" checked>
          <label class="form-check-label" for="gridRadios1">
            Meru Sadykova
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="masters" id="gridRadios2" value="Tomiris Tagasheva">
          <label class="form-check-label" for="gridRadios2">
            Tomiris Tagasheva
          </label>
        </div>




    </div>
    <div class="mb-3">
      <label for="exampleInputPassword1" class="form-label">What kind of haircut do you want?</label>
      <input type="text" class="form-control" id="exampleInputPassword1" name="services">
    </div>
    <div class="mb-3">
      <label class="form-label" for="exampleCheck1">What price do you expect?</label>
      <input type="number" class="form-control" id="exampleCheck1" name="price">
    </div>
    <div class="mb-3">
      <label class="form-label" for="example">Datetime:</label>
      <input type="date" class="form-control" id="example" name="datetime">
    </div>
    <div class="mb-3">
      <label class="form-label" for="exam">Please, leave you`re comments:</label>
      <input type="text" class="form-control" id="exam" name="photo">
    </div>
    <button type="submit" style="background-color: aqua" class="btn btn-primary">Add</button>
  </form>
</div>
<%
  }
%>
</body>
</html>
