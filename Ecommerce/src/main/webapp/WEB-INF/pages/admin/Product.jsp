<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Form</title>
<style type="text/css">
.errStyle {
	color:red;
	font-style: italic;
	font-weight: bold;
}
</style>
</head>
<body>

<h1>Product Form</h1>
<c:if test="${not empty msg}">
<div style="background: lightgreen;color: blue; font-weight: bold;">
${msg}

</div>
</c:if>
<c:if test="${not isEdit}">
<c:url var="saveUrl" value="/admin/saveProduct" />
</c:if>
<c:if test="${isEdit}">
<c:url var="saveUrl" value="/admin/editProduct" />
</c:if>

<form:form modelAttribute="product" method="POST" action="${saveUrl}">
 <table>
  <tr>
   <td><form:label path="productid">ProductId:</form:label></td>
   <td><form:input path="productid" /></td>
   <td></td>
  </tr>
  
  <tr>
   <td><form:label path="productname">ProductName:</form:label></td>
   <td><form:input path="productname"/></td>
   <td> 
   			<form:errors path="productname" >
				<p class="errStyle">
						* should have atleast 3 character
				</p>
 			</form:errors>
   </td>
  </tr>
 
  <tr>
   <td><form:label path="price">Product Price:</form:label></td>
   <td><form:input path="price"/></td>
   <td></td>
  </tr>
   
   <tr>
   <td><form:label path="quantity">Quantity:</form:label></td>
   <td><form:input path="quantity"/></td>
   <td></td>
  </tr>
  
  <form:select path="categoryid" >
  <c:forEach items="${categoryList}" var="cat">
  	<form:option value="${cat.categoryid}" >${cat.categoryname}</form:option>
  </c:forEach>
  </form:select>
  
  <form:select path="supplierid" >
  <c:forEach items="${supplierList}" var="sup">
  	<form:option value="${sup.supplierid}" >${pro.suppliername}</form:option>
  </c:forEach>
  </form:select>
   
 </table> 
 <c:if test="${not isEdit}">
 <input type="submit" value="Save" />
 </c:if>
 <c:if test="${isEdit}">
 <input type="submit" value="Edit" />
 </c:if>
 
</form:form>

<table border="1">
<tr>
		<th>ID</th>
		<th>NAME</th>
		<th>PRICE</th>
		<th>QTY</th>
</tr>
<c:forEach var="pro"  items="${productList}">
<tr>
	<td>${pro.productid}</td>
	<td>${pro.productname}</td>
	<td>${pro.price}</td>
	<td>${pro.quantity}</td>
	<td><a href="<c:url value='/admin/editProduct/${pro.productid}' />" >Edit</a>
	<td><a href="<c:url value='/admin/deleteProduct/${pro.productid}' />">Delete</a>
</tr>

</c:forEach>
</table>
</body>
</html>