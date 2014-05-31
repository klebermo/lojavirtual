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

<sec:accesscontrollist hasPermission="cadastra_destaque" domainObject="${someObject}">
<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar nova destaque
	</button>
</p>
</sec:accesscontrollist>

<table class="bordered">

    <thead>
    <tr>
        <th>#</th>        
        <th>Categoria</th>
        <th>Quant produtos</th>
        <th></th>
    </tr>
    </thead>
    
    <tbody class="content">
    </tbody>

</table>

<c:url value="/destaque/listagem.json" var="lista"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.destaque, function(index, item){
		    var row = $('<tr>');
		    row.append('<td>'+item.id+'</td>');
		    row.append('<td>'+item.categoria+'</td>');
		    
		    var counter = 0;
		    $.each(item.produtos, function(index, item2){
		    	counter++;
		    });
		    row.append('<td>'+counter+'</td>');
		    
		    var col = $('<td>');
		    <sec:accesscontrollist hasPermission="altera_destaque" domainObject="${someObject}">
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${alteracao}/'+item.id+'">Editar</button>');
		    </sec:accesscontrollist>
		    <sec:accesscontrollist hasPermission="remove_destaque" domainObject="${someObject}">
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