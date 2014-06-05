<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de categorias</title>
</head>
<body>

<c:url value="/destaque/cadastra" var="cadastro"/>
<c:url value="/destaque/altera" var="alteracao"/>
<c:url value="/destaque/remove" var="remocao"/>
<c:url value="/destaque/listagem.json" var="lista"/>

<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar nova destaque
	</button>
</p>

<table class="bordered">

    <thead>
    	<tr>
	    	<td class="col" data-property="#">#</td>
	    	<td class="col" data-property="categoria">Categoria</td>
	    	<td class="col" data-property="produtos">Quant produtos</td>
	    	<td class="col" data-property=""></td>
    	</tr>        
    </thead>
    
    <tbody class="content">
    </tbody>
    
    <tfoot>
    	<tr>
	    	<td class="comando" data-nome="Altera" data-action="${alteracao}"></td>
	    	<td class="comando" data-nome="Remove" data-action="${remocao}"></td>
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