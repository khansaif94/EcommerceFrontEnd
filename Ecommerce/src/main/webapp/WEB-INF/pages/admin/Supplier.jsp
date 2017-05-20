<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SupplierForm</title>

<style type="text/css">
.errStyle {
	color:red;
	font-style: italic;
	font-weight: bold;
}
</style>
</head>
<body>

<h1>Supplier Form</h1>
<c:if test="${not empty msg}">
<div style="background: lightgreen;color: blue; font-weight: bold;">
${msg}

</div>
</c:if>
<c:if test="${not isEdit}">
<c:url var="saveUrl" value="/admin/saveSupplier" />
</c:if>
<c:if test="${isEdit}">
<c:url var="saveUrl" value="/admin/editSupplier" />
</c:if>

<form:form modelAttribute="supplier" method="POST" action="${saveUrl}">
 <table>
  <tr>
   <td><form:label path="supplierid">SupplierId:</form:label></td>
   <td><form:input path="supplierid" /></td>
   <td></td>
  </tr>
  
  <tr>
   <td><form:label path="suppliername">SupplierName:</form:label></td>
   <td><form:input path="suppliername"/></td>
   <td> 
   			<form:errors path="suppliername" >
				<p class="errStyle">
						* should have atleast 3 character
				</p>
 			</form:errors>
   </td>
  </tr>
 
  <tr>
   <td><form:label path="supplieradd">SupplierAddress:</form:label></td>
   <td><form:input path="supplieradd"/></td>
   <td></td>
  </tr>
   
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
		<th>ADDRESS</th>
</tr>
<c:forEach var="sup"  items="${supplierList}">
<tr>
	<td>${sup.supplierid}</td>
	<td>${sup.suppliername}</td>
	<td>${sup.supplieradd}</td>
	<td><a href="<c:url value='/admin/editSupplier/${sup.supplierid}' />" >Edit</a>
	<td><a href="<c:url value='/admin/deleteSupplier/${sup.supplierid}' />">Delete</a>
</tr>

</c:forEach>
</table>


</body>
</html>