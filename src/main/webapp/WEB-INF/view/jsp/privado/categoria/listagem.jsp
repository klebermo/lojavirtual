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

<sec:accesscontrollist hasPermission="cadastra_categoria" domainObject="${someObject}">
<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar nova categoria
	</button>
</p>
</sec:accesscontrollist>

<table class="bordered">

    <thead>
    <tr>
        <th>#</th>        
        <th>Nome</th>
        <th></th>
    </tr>
    </thead>
    
    <tbody class="content">
    </tbody>

</table>

<c:url value="/categoria/listagem.json" var="lista"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.categoria, function(index, item){
		    var row = $('<tr>');
		    row.append('<td>'+item.id+'</td>');
		    row.append('<td>'+item.nome+'</td>');
		    
		    var col = $('<td>');
		    <sec:accesscontrollist hasPermission="altera_categoria" domainObject="${someObject}">
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${alteracao}/'+item.id+'">Editar</button>');
		    </sec:accesscontrollist>
		    <sec:accesscontrollist hasPermission="remove_categoria" domainObject="${someObject}">
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${remocao}/'+item.id+'">Remover</button>');
		    </sec:accesscontrollist>
		    row.append(col);
		    
		    $('tbody.content').append(row);
		});
	});
});
</script>

</body>
</html>