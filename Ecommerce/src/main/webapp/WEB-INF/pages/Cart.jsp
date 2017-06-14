<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Page</title>
</head>
<body>
<%@include file="navbar.jsp" %>
${msg}
<c:if test="${not empty cartList}"> 
<table class="table table-striped;">
		<tr>
			<th >Product Name:</th>
			<th >Price:</th>
			<th >Date Added:</th>
		</tr>
		<c:forEach items="${cartList}" var="cart">
			<tr>
				<td align="left">${cart.product_name}</td>
				<td align="left">${cart.price}</td>
				<td align="left">${cart.date_added}</td>
				<td >
				<a class="btn btn-primary"href="<c:url value='/cart/delete/${cart.cartid}' />">Remove From Cart</a>
				</td>	
			</tr>
		</c:forEach>
		</table>
		<h2>Total Cost : ${totalAmount}</h2>
	<br>
	<a href="<c:url value='/Checkout/' />"><button type="button" class="btn btn-success">Checkout</button></a>
	<br>
	<br>
	</c:if>
<c:if test="${empty cartList}">
<h2>No items in cart</h2>
</c:if>
<%@include file="footer.jsp" %>
</body>
</html>