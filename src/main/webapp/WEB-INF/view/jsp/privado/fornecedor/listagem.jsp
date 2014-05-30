<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de fornecedores</title>
</head>
<body>

<c:url value="/fornecedor/cadastra" var="cadastro"/>
<c:url value="/fornecedor/altera" var="alteracao"/>
<c:url value="/fornecedor/remove" var="remocao"/>


<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar novo fornecedor
	</button>
</p>

<table class="bordered">

    <thead>
    <tr>
        <th>#</th>        
        <th>Nome</th>
        <th>Cpf / Cnpj</th>
        <th>Website</th>
        <th></th>
    </tr>
    </thead>
    
    <tbody class="content">
    </tbody>

</table>

<c:url value="/fornecedor/listagem.json" var="lista"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.fornecedor, function(index, item){
		    var row = $('<tr>');
		    row.append('<td>'+item.id+'</td>');
		    row.append('<td>'+item.razao_social+'</td>');
		    
		    if(item.cpf == "")
		    	row.append('<td>'+item.cnpj+'</td>');
		    else
		    	row.append('<td>'+item.cpf+'</td>');
		    
		    row.append('<td>'+item.website+'</td>');
		    
		    var col = $('<td>');
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${alteracao}/'+item.id+'">Editar</button>');
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${remocao}/'+item.id+'">Remover</button>');
		    row.append(col);
		    
		    $('tbody.content').append(row);
		});
	});
});
</script>

</body>
</html>