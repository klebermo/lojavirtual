<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de endere&ccedil;os</title>
</head>
<body>

<c:url value="/endereco/altera" var="alteracao"/>
<c:url value="/endereco/remove" var="remocao"/>
<c:url value="/endereco/listagem.json" var="lista"/>

<table class="bordered">

    <thead>
    	<tr>
	    	<th class="col" data-property="#">#</th>
	    	<th class="col" data-property="logradouro">Logradouro</th>
	    	<th class="col" data-property="numero">Numero</th>
	    	<th class="col" data-property="complemento">Complemento</th>
	    	<th class="col" data-property="bairro">Bairro</th>
	    	<th class="col" data-property="cidade">Cidade</th>
	    	<th class="col" data-property="estado">Estado</th>
	    	<th class="col" data-property="cep">CEP</th>
	    	<th class="col" data-property=""></th>
    	</tr>        
    </thead>
    
    <tbody class="content">
    </tbody>
    
    <tfoot>
    	<tr>
    		<sec:authorize access="hasPermission(#user, 'altera_endereco')">
	    		<td class="comando" data-nome="Altera" data-action="${alteracao}"></td>
	    	</sec:authorize>
	    	<sec:authorize access="hasPermission(#user, 'remove_endereco')">
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