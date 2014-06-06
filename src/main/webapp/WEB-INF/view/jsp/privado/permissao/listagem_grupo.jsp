<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Permiss&otilde;es do grupo: ${grupo.nome}</title>
</head>
<body>

<div class="panel panel-default">
  <div class="panel-heading">Permiss&otilde;es do grupo: ${grupo.nome}</div>
  <div class="panel-body">
    <p>...</p>
  </div>

  <ul class="list-group">
  	<c:forEach var="item" items="${grupo.permissao}">
    <li class="list-group-item">${item.nome}</li>
    </c:forEach>
  </ul>
</div>

</body>
</html>