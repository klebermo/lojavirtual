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

<c:url value="/permissao/altera.htm" var="permissoes"/>

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
		    var row = $('<tr id=user'+item.id+'>');
		    row.append('<td>'+item.id+'</td>');
		    row.append('<td>'+item.login+'</td>');
		    row.append('<td>'+item.pnome+'</td>');
		    row.append('<td>'+item.unome+'</td>');
		    row.append('<td>'+item.email+'</td>');
		    
		    var col = $('<td>');
		    col.append('<button type="button" class="btn btn-sm btn-primary" data-action="editar" data-target="'+item.id+'">Editar</button>');
		    col.append('<button type="button" class="btn btn-sm btn-primary" data-action="remover" data-target="'+item.id+'">Remover</button>');
		    col.append('<button type="button" class="btn btn-sm btn-primary" data-action="permissoes" data-target="'+item.id+'">Permiss&otilde;es</button>');
		    row.append(col);
		    
		    $('tbody.content').append(row);
		});
	});
});

$(document).on('click', '.btn', function (event) {
		var action = $(this).data('action');
		var target = $(this).data('target');
		
		if(action == "novo") {
			action = "${novo}";
		    $.get(action, function(data){
				var $temp  = $('<div/>', {html:data});
				var titulo = $temp.find('title').text();
				var conteudo = $temp.remove('head').html();
				limpa_conteudo();
				$(".panel-title").text(titulo);
				$(".panel-body").html(conteudo);
			});
		} else if(action == "editar") {
			$.ajax({
				type: "GET",
				url: "${editar}",
				data: { id: target }
			}).done(function( data ) {
				var $temp  = $('<div/>', {html:data});
				var titulo = $temp.find('title').text();
				var conteudo = $temp.remove('head').html();
				limpa_conteudo();
				$(".panel-title").text(titulo);
				$(".panel-body").html(conteudo);
			});
		} else if(action == "remover") {
			action = "${remover}";
			new $.Zebra_Dialog('<strong>Aten&ccedil;&atilde;o!</strong><br><br>', {
			    'source':  {'ajax': action+"?id="+target},
			    width: 350,
			    'title': 'Remo&ccedil;&atilde;o de usu&aacute;rio',
			    'buttons':  [
			                    {caption: 'Yes', callback: remove_usuario(action, target) },
			                    {caption: 'No' }
			                ]
			});
		} else if(action == "permissoes") {
			$.ajax({
				type: "GET",
				url: "${permissoes}",
				data: { id: target }
			}).done(function( data ) {
				var $temp  = $('<div/>', {html:data});
				var titulo = $temp.find('title').text();
				var conteudo = $temp.remove('head').html();
				limpa_conteudo();
				$(".panel-title").text(titulo);
				$(".panel-body").html(conteudo);
			});
		}
});

function remove_usuario(action, target) {
    $.ajax({
    	type: "POST",
    	url: action,
    	data: {id: target}
	}).done(function(data){
		if(data == "yes") {
			$('#user'+target).remove();
		}
	});
}
</script>

</body>
</html>