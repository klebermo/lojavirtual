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
	$("#output").hide();
});
</script>

<c:url value="/permissao/cadastra" var="cadastra"/>
<c:url value="/permissao/remove" var="remove"/>
<c:url value="/permissao/listagem" var="listagem"/>
<button type="button" class="btn btn-lg btn-link action" data-action="${cadastra}" data-target="">cadastrar novo grupo</button>

<div class="container">
	<div id="row">
		<div class="col-md-4">
			<div id="workspace"></div>
		</div>
		<div class="col-md-8">
			<div id="output" class="panel panel-warning">
			  <div class="panel-heading">
			    <h3 id="output-header" class="panel-title"></h3>
			  </div>
			  <div class="panel-body">
			  	<p id="output-body"></p>
			  </div>
			</div>
		</div>
	</div>
</div>

<c:url value="/permissao/grupos.json" var="grupos"/>
<c:url value="/permissao/permissoes_grupo.json" var="permissoes"/>
<script>
$(document).ready(function(){
	var url = "${grupos}";
	$.get(url, function(data) {
		var json = jQuery.parseJSON(data);
		$.each(json.grupo, function(index, item){
			$("#workspace").append('<p><div class="input-group input-group-sm"><span class="input-group-addon"><input type="checkbox" class="checkbox" name="grupo" value="'+item.id+'"></span><input type="text" class="form-control" value="'+item.nome+'" readonly="readonly"><span class="input-group-btn"><button type="button" class="btn btn-default action" data-action="${listagem}" data-target="'+item.id+'"><span class="glyphicon glyphicon-chevron-down"></span></button></span></div>');
			if(item.id > 17) {
				$("#workspace").append('<button type="button" class="btn btn-default action" data-action="${remove}" data-target="'+item.id+'"><span class="glyphicon glyphicon-remove"></span></button></p>');
			} else {
				$("#workspace").append('</p>');
			}
		});
	});
});

$('.checkbox').click(function() {   
    if ($(this).is(':checked')) {
        alert( "desmarcou " + $(this).val() );
    } else {
        alert( "marcou " + $(this).val() );
    }
});

$(document).on('click', '.action', function (event) {
	if( $("#output").is(":visible") ) {
		$("#output-header").empty();
		$("#output-body").empty();
		$("#output").hide();
	} else {
		var action = $(this).data('action');
		var target = $(this).data('target');
		var url;
		
		if(target != "")
			url = action+"/"+target;
		else
			url = action;
		
		$.get(url, function(data){
			var $temp  = $('<div/>', {html:data});
			var titulo = $temp.find('title').text();
			var conteudo = $temp.remove('head').html();
			$("#output-header").text(titulo);
			$("#output-body").html(conteudo);
		});
		$("#output").show();
	}
});
</script>

</body>
</html>