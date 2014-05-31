<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de usu&aacute;rios</title>
</head>
<body>

<c:url value="/usuario/cadastra" var="cadastro"/>
<c:url value="/usuario/altera" var="alteracao"/>
<c:url value="/usuario/remove" var="remocao"/>
<c:url value="/permissao/altera" var="permissao"/>

<p>
<sec:accesscontrollist hasPermission="cadastra_usuario" domainObject="${someObject}">
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar novo usu&aacute;rio
	</button>
</sec:accesscontrollist>
</p>

<table class="bordered">

    <thead>
    <tr>
        <th>#</th>        
        <th>Login</th>
        <th>Nome</th>
        <th>Sobrenome</th>
        <th>E-Mail</th>
        <th>#</th>
    </tr>
    </thead>
    
    <tbody class="content">
    </tbody>

</table>

<c:url value="/usuario/listagem.json" var="lista"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.usuario, function(index, item){
		    var row = $('<tr id=user'+item.id+'>');
		    row.append('<td>'+item.id+'</td>');
		    row.append('<td>'+item.login+'</td>');
		    row.append('<td>'+item.pnome+'</td>');
		    row.append('<td>'+item.unome+'</td>');
		    row.append('<td>'+item.email+'</td>');
		    
		    var col = $('<td>');
		    <sec:accesscontrollist hasPermission="altera_usuario" domainObject="${someObject}">
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${alteracao}/'+item.id+'">Editar</button>');
		    </sec:accesscontrollist>
		    <sec:accesscontrollist hasPermission="remove_usuario" domainObject="${someObject}">
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${remocao}/'+item.id+'">Remover</button>');
		    </sec:accesscontrollist>
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${permissao}/'+item.id+'">Permiss&otilde;es</button>');
		    row.append(col);
		    
		    $('tbody.content').append(row);
		});
	});
});
</script>

</body>
</html>