
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
</head>
<body>
<%@include file="..\navbar.jsp" %>
&nbsp;
<a href="<c:url value='/Product'/>"  class="btn btn-info">MANAGE PRODUCT</a> &nbsp;
<a href="<c:url value='/Category'/>" class="btn btn-info">MANAGE CATEGORY</a>&nbsp;
<a href="<c:url value='/Supplier'/>" class="btn btn-info">MANAGE SUPPLIER</a>;

<br/><br/><br/><br/><br/><br/><br/><br/>
<%@include file="..\footer.jsp" %>
</body>
</html>