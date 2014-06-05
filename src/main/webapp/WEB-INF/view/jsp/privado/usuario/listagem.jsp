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

<table class="bordered">

    <thead>
    	<tr>
	    	<td class="col" data-property="#">#</td>
	    	<td class="col" data-property="login">Login</td>
	    	<td class="col" data-property="pnome">Nome</td>
	    	<td class="col" data-property="unome">Sobrenome</td>
	    	<td class="col" data-property="email">E-mail</td>
	    	<td class="col" data-property=""></td>
    	</tr>        
    </thead>
    
    <tbody class="content">
    </tbody>
    
    <tfoot>
    	<tr>
	    	<td class="comando" data-nome="Altera" data-action="${alteracao}"></td>
	    	<td class="comando" data-nome="Remove" data-action="${remocao}"></td>
	    	<td class="comando" data-nome="Permiss&otilde;es" data-action="${permissao}"></td>
	    	<td></td>
	    	<td></td>
	    	<td></td>
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