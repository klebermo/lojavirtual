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

<c:url value="/permissao/cadastra" var="cadastra"/>
<button type="button" class="btn btn-lg btn-link link" data-action="${cadastra}">cadastrar novo grupo</button>

<c:url value="/permissao/grupos.json" var="grupos"/>
<c:url value="/permissao/permissoes_grupo.json" var="permissoes"/>
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
			var url = "${permissoes}";
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
				col.append('<button type="button" class="btn btn-sm btn-link" data-action="" data-target="">remover</button>');
				row.append(col);
			}
			else {
				row.append('<td></td>');
			}
			$('tbody.content').append(row);
		});
	});
});
</script>
</body>
</html>