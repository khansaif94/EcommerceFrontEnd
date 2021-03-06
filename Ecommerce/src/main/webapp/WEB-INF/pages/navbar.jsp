<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse-example" aria-expanded="false">
    <span class="sr-only">toggle navigation</span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
      
    </button>
    
      <a class="navbar-brand" href="#">SHOES N SHINE</a>
    </div>
    <div class="collapse navbar-collapse" id="collapse=-example">
    <ul class="nav navbar-nav">
      <li class="active"><a href="/Ecommerce">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Shoes Category <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <c:forEach var="category" items="${categoryList}">
          <li><a href="<c:url value='/ProductByCategory/${category.categoryid}' /> ">${category.categoryname}</a></li>
         </c:forEach>
        
        </ul>
      </li>
      <li><a href="<c:url value='/Aboutus'/> ">About Us</a></li>
      <li><a href="<c:url value='/Contactus'/> ">Contact Us</a></li>
      <li><a href="<c:url value='/Product'/> ">All Product</a></li>
    </ul>
    
   <form class="navbar-form navbar-left">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" size="7">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
    
    <c:if test="${empty loggedInUser}"> 
    <ul class="nav navbar-nav navbar-right">
     <li><a href="<c:url value='/User'/>"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
     <li><a href="<c:url value='/Login'/>"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
    </c:if>
    <c:if test="${not empty loggedInUser}"> 
    <ul class="nav navbar-nav navbar-right">
    <c:if test="${isAdmin}">
   <li><a href="<c:url value='/AdminHome'/>">Admin</a></li>
   </c:if>
   <c:if test="${isUser}">
   
   <a href="<c:url value='/Cart'/>" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
        </a>
    </c:if>
   <li><font size="3" color="white">WELCOME ${loggedInUser}</font></li>
     <li><a href="<c:url value='/j_spring_securitylogout'/>"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
    </c:if>
  </div>
  </div>
</nav>

