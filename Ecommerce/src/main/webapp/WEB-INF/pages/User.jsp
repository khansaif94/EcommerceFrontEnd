<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>RegisterationForm</title>
<style type="text/css">
.errStyle {
	color:red;
	font-style: italic;
	font-weight: bold;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<h1>Registeration Form</h1>

<div style="background: lightgreen;color: blue; font-weight: bold;">
${msg}

</div>

<c:url var="saveUrl" value="saveUser" />
<form:form modelAttribute="user" method="POST" action="${saveUrl}">
 <table>
  <tr>
   <td><form:label path="userid">UserName:</form:label></td>
   <td><form:input path="userid" /></td>
   <td>
    <form:errors path="userid" >
				<p class="errStyle">
						* should have atleast 3 character
				</p>
 	</form:errors>
   </td>
  </tr>
  
  <tr>
   <td><form:label path="password">Password:</form:label></td>
   <td><form:input type="password" path="password"/></td>
   <td></td>
  </tr>
  
  <tr>
   <td><form:label path="address">Address:</form:label></td>
   <td><form:input path="address"/></td>
   <td></td>
  </tr>
   
 </table> 
 	
 <input type="submit" value="register" />

 
 
</form:form>
<%@include file="footer.jsp" %>
</body>
</html>