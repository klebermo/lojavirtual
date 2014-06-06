<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de promo&ccedil;&atilde;o</title>
</head>
<body>

<c:url value="/promocao/cadastra" var="cadastro"/>
<c:url value="/promocao/altera" var="alteracao"/>
<c:url value="/promocao/remove" var="remocao"/>
<c:url value="/promocao/listagem.json" var="lista"/>

<sec:authorize access="hasPermission(#user, 'cadastra_promocao')">
<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar nova promo&ccedil;&atilde;o
	</button>
</p>
</sec:authorize>

<table class="bordered">

    <thead>
    	<tr>
	    	<th class="col" data-property="#">#</th>
	    	<th class="col" data-property="produto">Produto</th>
	    	<th class="col" data-property="desconto">Desconto</th>
	    	<th class="col" data-property=""></th>
    	</tr>        
    </thead>
    
    <tbody class="content">
    </tbody>
    
    <tfoot>
    	<tr>
    		<sec:authorize access="hasPermission(#user, 'altera_promocao')">
	    		<td class="comando" data-nome="Altera" data-action="${alteracao}"></td>
	    	</sec:authorize>
	    	<sec:authorize access="hasPermission(#user, 'remove_promocao')">
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