<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de usu&aacute;rios</title>
</head>
<body>

<c:url value="/usuario/listagem.json" var="lista"/>

<c:url value="/usuario/cadastra.htm" var="novo"/>
<c:url value="/usuario/altera.htm" var="editar"/>
<c:url value="/usuario/remove.htm" var="remover"/>

<c:url value="/permissao/listagem.htm" var="permissoes"/>

<p>
	<button type="button" class="btn btn-sm btn-link" data-action="novo">
		cadastrar novo usu&aacute;rio
	</button>
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

<script>

$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.usuario, function(index, item){
		    var row = $('<tr>');
		    row.append('<td>'+item.login+'</td>');
		    row.append('<td>'+item.pnome+'</td>');
		    row.append('<td>'+item.unome+'</td>');
		    row.append('<td>'+item.email+'</td>');
		    
		    var col = $('<td>');
		    col.append('<button type="button" class="btn btn-sm btn-primary" data-action="editar" data-target="'+item.id+'">Editar</button>');
		    col.append('<button type="button" class="btn btn-sm btn-primary" data-action="remover" data-target="'+item.id+'">Remover</button>');
		    col.append('<button type="button" class="btn btn-sm btn-primary" data-action="permissoes" data-target="'+item.id+'">Permiss&otilde;es</button>');
		    row.append(col);
		    
		    row.append('<td></td>');
		    
		    $('tbody.content').append(row);
		});
	});
});

$(".btn").on("click", function(){
	var action = $(this).data('action');
	var target = $(this).data('target');
	
	switch(action) {
		case "editar":
			$.ajax({
				type: "GET",
				url: "${editar}",
				data: { id: target }
			}).done(function( data ) {
				var $temp  = $('<div/>', {html:data});
				var titulo = $temp.find('title').text();
				var conteudo = $temp.remove('head').html();
				$(".panel-title").empty();
				$(".panel-title").text(titulo);
				$(".panel-body").empty();
				$(".panel-body").html(conteudo);
				$("#content").show();
			});
			break;
		case "remover":
			new $.Zebra_Dialog('<strong>Tem certeza que quer excluir o usu&aacute;rio:</strong><br><br>', {
			    'source':  {'ajax': '${remover}'},
			    width: 350,
			    'title': 'Aviso de remo&ccedil;&atilde;o de usu&aacute;rio'
			});
			break;
		case "permissoes":
			$.ajax({
				type: "GET",
				url: "${permissoes}",
				data: { id: target }
			}).done(function( data ) {
				var $temp  = $('<div/>', {html:data});
				var titulo = $temp.find('title').text();
				var conteudo = $temp.remove('head').html();
				$(".panel-title").empty();
				$(".panel-title").text(titulo);
				$(".panel-body").empty();
				$(".panel-body").html(conteudo);
				$("#content").show();
			});
			break;
		case "novo":
			action = "${novo}";
		    $.get(action, function(data){
				var $temp  = $('<div/>', {html:data});
				var titulo = $temp.find('title').text();
				var conteudo = $temp.remove('head').html();
				$(".panel-title").empty();
				$(".panel-title").text(titulo);
				$(".panel-body").empty();
				$(".panel-body").html(conteudo);
				$("#content").show();
			});
			break;
		default:
			$.Zebra_Dialog('A&ccedil;&atilde;o inv&aacute;lida', {
				    'type':     'information',
				    'title':    'Erro'
			});
			break;
	}
	
});
</script>

</body>
</html>