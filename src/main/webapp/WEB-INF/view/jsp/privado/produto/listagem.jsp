<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
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
<c:url value="/categoria/cadastra" var="categoria"/>

<p>
	<button type="button" class="btn btn-sm btn-link link" data-action="${cadastro}">
		cadastrar novo produto
	</button>
</p>

<table class="bordered">

    <caption>
    	<div style="text-align: left;">
	    	<button type="button" class="btn btn-sm btn-link link">10</button>
	    	<button type="button" class="btn btn-sm btn-link link">20</button>
	    	<button type="button" class="btn btn-sm btn-link link">30</button>
    	</div>
    	<div style="text-align: right;">
    		Filtro:<select name="categoria" id="categoria"></select>
    	</div>
   	</caption>
    
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
<c:url value="/categoria/listagem.json" var="lista_categoria"/>

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
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${alteracao}/'+item.id+'">Editar</button>');
		    col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="${remocao}/'+item.id+'">Remover</button>');
		    row.append(col);
		});
	});
	var url = "<c:out value="${lista_categoria}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.categoria, function(index, item){
		    var option = $('<option value="'+item.id+'">'+item.nome+'</option>');
		    $('#categoria').append(option);
		});
	});
});
</script>

</body>
</html>