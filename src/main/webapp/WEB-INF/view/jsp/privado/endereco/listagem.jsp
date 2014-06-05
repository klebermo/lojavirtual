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
	    	<td class="col" data-property="#">#</td>
	    	<td class="col" data-property="logradouro">Logradouro</td>
	    	<td class="col" data-property="numero">Numero</td>
	    	<td class="col" data-property="complemento">Complemento</td>
	    	<td class="col" data-property="bairro">Bairro</td>
	    	<td class="col" data-property="cidade">Cidade</td>
	    	<td class="col" data-property="estado">Estado</td>
	    	<td class="col" data-property="cep">CEP</td>
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
	    	<td></td>
	    	<td></td>
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