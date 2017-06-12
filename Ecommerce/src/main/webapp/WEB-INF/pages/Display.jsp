<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Display</title>

</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container">
<div>
<div >
<center>
<img src="<c:url value='/resources/images/${pro.image}'/>" height="400px" width="400px" />
</center>
<table class="table table-striped">
<tr>
	<th>Name</th>
	<td>${pro.productname}</td>
</tr>
<tr>
	<th>Available Quantity</th>
	<td>${pro.quantity}</td>
</tr>
<tr>
	<th>Price</th>
	<td>${pro.price}</td>
</tr>

<tr>
	<th>Description</th>
	<td>${pro.description}</td>
</tr>

<tr>
     <c:if test="${empty isUser}">
 	<td><a class="btn btn-info btn-lg" href="<c:url value='/Login' />"> <span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</a></td>
 	</c:if>	
</tr>

<tr>
 	<c:if test="${isUser}">
 	<td><a class="btn btn-info btn-lg" href="<c:url value='/cart/add/${pro.productid}' />"> <span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</a></td>
 	</c:if>	
</tr>

</table>
</div>
</div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>