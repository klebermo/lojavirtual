<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Materia Prima</title>
</head>
<body>

<c:url value="/materia_prima/cadastra" var="cadastro"/>
<c:url value="/materia_prima/altera" var="alteracao"/>
<c:url value="/materia_prima/remove" var="remocao"/>
<c:url value="/materia_prima/listagem.json" var="lista"/>

<sec:authorize access="hasPermission(#user, 'cadastra_materia_prima')">
<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar nova materia prima
	</button>
</p>
</sec:authorize>

<table class="bordered">

    <thead>
    	<tr>
	    	<th class="col" data-property="#">#</th>
	    	<th class="col" data-property="nome">Nome</th>
	    	<th class="col" data-property="fornecedor">Fornecedor</th>
	    	<th class="col" data-property="preco">Pre&ccedil;o</th>
	    	<th class="col" data-property=""></th>
    	</tr>        
    </thead>
    
    <tbody class="content">
    </tbody>
    
    <tfoot>
    	<tr>
	    	<sec:authorize access="hasPermission(#user, 'altera_materia_prima')">
	    		<td class="comando" data-nome="Altera" data-action="${alteracao}"></td>
	    	</sec:authorize>
	    	<sec:authorize access="hasPermission(#user, 'remove_materia_prima')">
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