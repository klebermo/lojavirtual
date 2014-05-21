<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Permiss&otilde;es do usu&aacute;rio: ${usuario.login}</title>
</head>
<body>

<script>
$(document).ready(function(){
	$("#yes").hide();
	$("#not").hide();
});
</script>

<c:url value="/permissao/grupos.json" var="grupos"/>
<c:url value="/permissao/permissoes_grupo.json" var="permissoes_grupo"/>
<c:url value="/permissao/permissoes_usuario.json" var="permissoes_usuario"/>

<c:url value="/permissao/cadastra.htm" var="cadastra"/>
<c:url value="/permissao/altera.htm" var="altera"/>

<table class="bordered">

    <thead>
    <tr>
        <th>#</th>        
        <th>Grupo</th>
        <th>Permiss&otilde;es</th>
        <th>#</th>
    </tr>
    </thead>
    
    <tbody class="content">
    </tbody>
    
    <tfoot>
    <tr>
    	<td colspan="2">
			<span id="yes" class="ui-icon ui-icon-check"></span>
		</td>
		<td colspan="2">
			<span id="not" class="ui-icon ui-icon-closethick"></span>
    	</td>
    </tr>
    </tfoot>

</table>

<button type="button" class="btn btn-lg btn-link">cadastrar novo grupo</button>

<script>
$(document).ready(function(){
	var url = "${grupos}";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.grupo, function(index, item){
			var row = $('<tr>');
			row.append('<td><input class="checkbox" type="checkbox" name="grupo" value="'+item.id+'"></td>');
			row.append('<td>'+item.nome+'</td>');
			
			var coluna = $('<td>');
			var url = "${permissoes_grupo}";
			var grupo = item.id;
			$.ajax({
				type: "GET",
				url: url,
				data: { id: grupo }
			}).done(function(data){
				var json = jQuery.parseJSON( data );
				var result = $('<ul>');
				$.each(json.permissao, function(index, item) {
					result.append('<li>'+item.nome+'</li>');
				});
				coluna.append(result);
			});
			row.append(coluna);
			
			if(item.id > 17) {
				var col = $('<td>');
				col.append('<button type="button" class="btn btn-sm btn-link" data-action="remove">remove grupo</button>');
				row.append(col);
			}
			else {
				row.append('<td></td>');
			}
			$('tbody.content').append(row);
		});
	});
});

$(document).on('click', '.checkbox', function(event){
	var grupo = $('input[name=grupo]').val();
	var url = "${altera}";
	$.ajax({
		type: "POST",
		url: url,
		data: {id: grupo }
	}).done(function(result){
		$("#"+result).show();
		$("#"+result).fadeOut(3);
	});
});

$(document).on('click', '.btn', function(event){
	var action = "${cadastra}";
    $.get(action, function(data){
		var $temp  = $('<div/>', {html:data});
		var titulo = $temp.find('title').text();
		var conteudo = $temp.remove('head').html();
		limpa_conteudo();
		$(".panel-title").text(titulo);
		$(".panel-body").html(conteudo);
		$("#content").show();
	});
});
</script>
</body>
</html>