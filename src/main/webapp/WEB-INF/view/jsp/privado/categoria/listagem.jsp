<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de categorias</title>
</head>
<body>

<c:url value="/categoria/cadastra" var="cadastro"/>
<c:url value="/categoria/altera" var="alteracao"/>
<c:url value="/categoria/remove" var="remocao"/>
<c:url value="/categoria/listagem.json" var="lista"/>

<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar nova categoria
	</button>
</p>

<table class="bordered">

    <thead>
    	<tr>
	    	<td class="col" data-property="#">#</td>
	    	<td class="col" data-property="nome">Nome</td>
	    	<td></td>
    	</tr>        
    </thead>
    
    <tbody class="content">
    </tbody>
    
    <tfoot>
    	<tr>
	    	<td class="comando" data-nome="Altera" data-action="${alteracao}"></td>
	    	<td class="comando" data-nome="Remove" data-action="${remocao}"></td>
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