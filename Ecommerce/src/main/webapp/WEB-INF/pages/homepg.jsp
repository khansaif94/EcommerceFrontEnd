<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOME PAGE</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      height:50%;
      margin: auto;
  }
  </style>
</head>
<body>
<%@include file="navbar.jsp" %>
   <div class="container-fluid">
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
  </ol>
  
               <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
    <img class="first-slide home-image" src="resources/images/home p1.jpg"/>
     <div class="container">
      <div class="carousel-caption">
      <h1>Welcome to SHOES N SHINE</h1>
        <p>The Perfect Place To Find Your Wear</p>
      </div>
     </div>
    </div>
    
   <div class="item">
    <img class="second-slide home-image" src="resources/images/home p2.jpg">
     <div class="container">
      <div class="carousel-caption">
        <h1>Elegant Formals!</h1>
        <p>To Suit Your Style and Class</p>
      </div>
    </div>
  </div>
  
   <div class="item">
    <img class="third-slide home-image" src="resources/images/home p3.jpg">
     <div class="container">
      <div class="carousel-caption">
        <h1>Classy Casuals</h1>
        <p>Keep Calm And Wear Sneakers</p>
      </div>
    </div>
  </div>
  
   <div class="item">
    <img class="fourth-slide home-image" src="resources/images/home p4.jpg">
     <div class="container">
      <div class="carousel-caption">
        <h1>Breathe Football</h1>
      </div>
    </div>
  </div>
  
   <div class="item">
    <img class="fifth-slide home-image" src="resources/images/home p5.jpg">
     <div class="container">
      <div class="carousel-caption">
      <h1>Let's Get Outside</h1>
      </div>
    </div>
  </div>
</div>
  
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>    

<%@include file="footer.jsp" %>
</body>
</html>