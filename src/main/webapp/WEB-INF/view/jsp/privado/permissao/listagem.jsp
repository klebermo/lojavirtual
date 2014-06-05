<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Permiss&otilde;es de ${usuario.login}</title>
</head>
<body>

<c:url value="/permissao/cadastra" var="cadastra"/>
<c:url value="/permissao/altera" var="altera"/>
<c:url value="/permissao/remove" var="remove"/>

<c:url value="/permissao/grupos.json" var="grupos"/>
<c:url value="/permissao/permissoes_grupo.json" var="permissoes"/>
<c:url value="/permissao/permissoes_usuario.json" var="permissoes_usuario"/>

<p>
	<button type="button" class="btn btn-lg btn-link action" data-action="${cadastra}" data-target="">
		cadastrar novo grupo
	</button>
</p>



</body>
</html>