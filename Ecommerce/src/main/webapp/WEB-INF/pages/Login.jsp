<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="resources/css/Loginst.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${not empty errmsg }">
<div>
	${errmsg}
</div>
</c:if>

<div class="container">

    <form class="form" action="j_spring_security_check" method="post">       
      <h2>Please Login</h2>
      <input type="text" class="form-control" style="width:300px;" name="j_username" placeholder="Email Address/Username" required="" autofocus="" />
      <br/><br/>
      <input type="password" class="form-control" style="width:300px;" name="j_password" placeholder="Password" required=""/> 
      <br/><br/>     
     
        <input type="checkbox"   value="remember-me" id="rememberMe" name="rememberMe"> Remember me
      
      <button class="btn btn-lg btn-primary btn-block" style="width:300px;" type="submit">Login</button>   
    </form>
  </div>
  <br/><br/><br/><br/>
  <%@include file="footer.jsp" %>
</body>
</html>