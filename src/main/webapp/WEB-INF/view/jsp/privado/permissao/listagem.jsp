<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Permiss&otilde;es</title>
</head>
<body>

<div class="panel panel-default">
   <div class="panel-heading">
     <h3 class="panel-title">Permiss&otilde;es</h3>
   </div>
   <div class="panel-body">
   		<ul class="list-group">
   		<c:forEach var="item" items="${permissoes}">
		  <li class="list-group-item"><c:out value="${item.nome}"/></li>
		</c:forEach>
		</ul>
   </div>
</div>

</body>
</html>