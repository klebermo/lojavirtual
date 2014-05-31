<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de produtos</title>
</head>
<body>

<c:url value="/produto/cadastra" var="cadastro"/>
<c:url value="/produto/altera" var="alteracao"/>
<c:url value="/produto/remove" var="remocao"/>

<sec:accesscontrollist hasPermission="cadastra_produto" domainObject="${someObject}">
<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar novo produto
	</button>
</p>
</sec:accesscontrollist>

<table class="bordered">

    <thead>
    <tr>
        <th>#</th>        
        <th>Nome</th>
        <th>#</th>
    </tr>
    </thead>
    
    <tbody class="content">
    </tbody>

</table>

<c:url value="/produto/listagem.json" var="lista_produto"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista_produto}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.produto, function(index, item){
		    var row = $('<tr id=user'+item.id+'>');
		    row.append('<td>'+item.id+'</td>');
		    row.append('<td>'+item.nome+'</td>');
		    $('tbody.content').append(row);
		    
		    var col = $('<td>');
		    <sec:accesscontrollist hasPermission="altera_produto" domainObject="${someObject}">
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${alteracao}/'+item.id+'">Editar</button>');
		    </sec:accesscontrollist>
		    <sec:accesscontrollist hasPermission="remove_produto" domainObject="${someObject}">
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${remocao}/'+item.id+'">Remover</button>');
		    </sec:accesscontrollist>
		    row.append(col);
		});
	});
});
</script>

</body>
</html>