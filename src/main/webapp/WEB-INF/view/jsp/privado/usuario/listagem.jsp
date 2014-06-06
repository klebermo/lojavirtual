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
<c:url value="/permissao/listagem" var="permissao"/>
<c:url value="/usuario/listagem.json" var="lista"/>

<sec:authorize access="hasPermission(#user, 'cadastra_usuario')">
<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar novo usu&aacute;rio
	</button>
</p>
</sec:authorize>

<table class="bordered">

    <thead>
    	<tr>
	    	<th class="col" data-property="#">#</th>
	    	<th class="col" data-property="login">Login</th>
	    	<th class="col" data-property="pnome">Nome</th>
	    	<th class="col" data-property="unome">Sobrenome</th>
	    	<th class="col" data-property="email">E-mail</th>
	    	<th class="col" data-property=""></th>
    	</tr>        
    </thead>
    
    <tbody class="content">
    </tbody>
    
    <tfoot>
    	<tr>
    		<sec:authorize access="hasPermission(#user, 'altera_usuario')">
	    		<td class="comando" data-nome="Altera" data-action="${alteracao}"></td>
	    	</sec:authorize>
	    	<sec:authorize access="hasPermission(#user, 'remove_usuario')">
	    		<td class="comando" data-nome="Remove" data-action="${remocao}"></td>
	    	</sec:authorize>
	    	<td class="comando" data-nome="Permiss&otilde;es" data-action="${permissao}"></td>
    	</tr>
    </tfoot>

</table>

<script>
$(document).ready(function(){
	load_content("${lista}", $('table.bordered'));
});
</script>

</body>
</html>