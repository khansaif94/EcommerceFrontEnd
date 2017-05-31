<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>CategoryForm</title>
<style type="text/css">
.errStyle {
	color:red;
	font-style: italic;
	font-weight: bold;
}
</style>
</head>
<body>
<%@include file="..\navbar.jsp" %>
<h1>Category Form</h1>
<c:if test="${not empty msg}">
<div style="background: lightgreen;color: blue; font-weight: bold;">
${msg}

</div>
</c:if>
<c:if test="${not isEdit}">
<c:url var="saveUrl" value="/admin/saveCategory" />
</c:if>
<c:if test="${isEdit}">
<c:url var="saveUrl" value="/admin/editCategory" />
</c:if>

<form:form modelAttribute="category" method="POST" action="${saveUrl}">
 <table>
  <tr>
   <td><form:label path="categoryid">CategoryId:</form:label></td>
   <td><form:input path="categoryid" /></td>
   <td></td>
  </tr>
  
  <tr>
   <td><form:label path="categoryname">CategoryName:</form:label></td>
   <td><form:input path="categoryname"/></td>
   <td> 
   			<form:errors path="categoryname" >
				<p class="errStyle">
						* should have atleast 3 character
				</p>
 			</form:errors>
   </td>
  </tr>
 
  <tr>
   <td><form:label path="category_description">CategoryDescription:</form:label></td>
   <td><form:input path="category_description"/></td>
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
		<th>Description</th>
</tr>
<c:forEach var="cat"  items="${categoryList}">
<tr>
	<td>${cat.categoryid}</td>
	<td>${cat.categoryname}</td>
	<td>${cat.category_description}</td>
	<td><a href="<c:url value='/admin/editCategory/${cat.categoryid}' />" >Edit</a>
	<td><a href="<c:url value='/admin/deleteCategory/${cat.categoryid}' />">Delete</a>
</tr>

</c:forEach>
</table>
<%@include file="..\footer.jsp" %>
</body>
</html>