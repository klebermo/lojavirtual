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

<sec:authorize access="hasPermission(#user, 'cadastra_categoria')">
<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar nova categoria
	</button>
</p>
</sec:authorize>

<table class="bordered">

    <thead>
    	<tr>
	    	<th class="col" data-property="#">#</th>
	    	<th class="col" data-property="nome">Nome</th>
	    	<th class="col" data-property=""></th>
    	</tr>        
    </thead>
    
    <tbody class="content">
    </tbody>
    
    <tfoot>
    	<tr>
    		<sec:authorize access="hasPermission(#user, 'altera_categoria')">
	    		<td class="comando" data-nome="Altera" data-action="${alteracao}"></td>
	    	</sec:authorize>
	    	<sec:authorize access="hasPermission(#user, 'remove_categoria')">
	    		<td class="comando" data-nome="Remove" data-action="${remocao}"></td>
	    	</sec:authorize>
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