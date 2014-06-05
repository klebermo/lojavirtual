<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de usu&aacute;rios</title>
</head>
<body>

<c:url value="/usuario/cadastra" var="cadastro"/>
<c:url value="/usuario/altera" var="alteracao"/>
<c:url value="/usuario/remove" var="remocao"/>
<c:url value="/permissao/altera" var="permissao"/>
<c:url value="/usuario/listagem.json" var="lista"/>

<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar novo usu&aacute;rio
	</button>
</p>

<table class="tabela bordered">

    <thead class="header">
    <tr>
        <th>#</th>        
        <th>Login</th>
        <th>Nome</th>
        <th>Sobrenome</th>
        <th>E-Mail</th>
        <th>#</th>
    </tr>
    </thead>
    
    <tbody class="content">
    </tbody>
    
    <tfoot class="actions">
    	<div class="command" data-nome="Altera" data-action="${altera}"></div>
    	<div class="command" data-nome="Remove" data-action="${remove}"></div>
    	<div class="command" data-nome="Permissoes" data-action="${permissao}"></div>
    </tfoot>

</table>

<script>
$(document).ready(function(){
	load_content("${lista}", $('.tabela'));
});
</script>

</body>
</html>