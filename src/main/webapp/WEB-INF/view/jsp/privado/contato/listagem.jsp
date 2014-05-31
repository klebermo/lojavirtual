<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de categorias</title>
</head>
<body>

<c:url value="/contato/altera" var="alteracao"/>
<c:url value="/contato/remove" var="remocao"/>

<table class="bordered">

    <thead>
    <tr>
        <th>#</th>        
        <th>Nome</th>
        <th>E-Mail</th>
        <th>Telefone</th>
        <th></th>
    </tr>
    </thead>
    
    <tbody class="content">
    </tbody>

</table>

<c:url value="/contato/listagem.json" var="contatos"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${contatos}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.contato, function(index, item){
		    var row = $('<tr>');
		    row.append('<td>'+item.id+'</td>');
		    row.append('<td>'+item.nome+'</td>');
		    row.append('<td>'+item.email+'</td>');
		    row.append('<td>'+item.telefone+'</td>');
		    
		    var col = $('<td>');
		    <sec:accesscontrollist hasPermission="altera_contato" domainObject="${someObject}">
		    col.append('<button type="button" class="btn btn-sm btn-primary popup" data-action="${alteracao}/'+item.id+'">Editar</button>');
		    </sec:accesscontrollist>
		    <sec:accesscontrollist hasPermission="remove_contato" domainObject="${someObject}">
		    col.append('<button type="button" class="btn btn-sm btn-primary popup" data-action="${remocao}/'+item.id+'">Remover</button>');
		    </sec:accesscontrollist>
		    row.append(col);
		    
		    $('tbody.content').append(row);
		});
	});
});
</script>

</body>
</html>