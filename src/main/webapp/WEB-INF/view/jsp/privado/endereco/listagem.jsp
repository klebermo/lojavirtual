<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de endere&ccedil;os</title>
</head>
<body>

<c:url value="/endereco/cadastra" var="cadastro"/>
<c:url value="/endereco/altera" var="alteracao"/>
<c:url value="/endereco/remove" var="remocao"/>

<table class="bordered">

    <thead>
    <tr>
        <th>#</th>        
        <th>Logradouro</th>
        <th>Numero</th>
        <th>Complemento</th>
        <th>Bairro</th>
        <th>Cidade</th>
        <th>Estado</th>
        <th>CEP</th>
    </tr>
    </thead>
    
    <tbody class="content">
    </tbody>

</table>

<c:url value="/endereco/listagem.json" var="lista"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.categoria, function(index, item){
		    var row = $('<tr>');
		    row.append('<td>'+item.id+'</td>');
		    row.append('<td>'+item.logradouro+'</td>');
		    row.append('<td>'+item.numero+'</td>');
		    row.append('<td>'+item.complemento+'</td>');
		    row.append('<td>'+item.bairro+'</td>');
		    row.append('<td>'+item.cidade+'</td>');
		    row.append('<td>'+item.estado+'</td>');
		    row.append('<td>'+item.cep+'</td>');		    
		    $('tbody.content').append(row);
		});
	});
});
</script>

</body>
</html>