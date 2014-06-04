<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Permiss&otilde;es do usu&aacute;rio: ${usuario.login}</title>
</head>
<body>

<c:url value="/permissao/cadastra" var="cadastra"/>
<c:url value="/permissao/altera" var="altera"/>
<c:url value="/permissao/remove" var="remove"/>
<c:url value="/permissao/listagem" var="listagem"/>

<sec:authorize access="hasPermission(#user, 'cadastra_permissao')">
<button type="button" class="btn btn-lg btn-link action" data-action="${cadastra}" data-target="">
	cadastrar novo grupo
</button>
</sec:authorize>

<div class="container">
	<div id="row">
		<div class="col-md-4">
			<div id="workspace"></div>
		</div>
		<div class="col-md-8">
			<div id="output" class="panel panel-warning" style="display: none;">
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
<c:url value="/permissao/permissoes_usuario.json" var="permissoes_usuario"/>
<script>
function load() {
	var url = "${grupos}";
	$.get(url, function(data) {
		var json = jQuery.parseJSON(data);
		$.each(json.grupo, function(index, item){
			var p = $('<p>');
			
			var option = $('<div class="input-group input-group-sm">');
			
			<sec:authorize access="hasPermission(#user, 'altera_permissao')">
				option.append('<span class="input-group-addon"><input type="checkbox" class="checkbox" name="grupo" value="'+item.id+'"></span>');
			</sec:authorize>
			
			option.append('<input type="text" class="form-control" value="'+item.nome+'" readonly="readonly">');
			option.append('<span class="input-group-btn"><button class="btn btn-default action" type="button" data-action="${listagem}" data-target="'+item.id+'"><span class="glyphicon glyphicon-chevron-down"></span></button></span>');
			
			$(p).append(option);
			
			<sec:authorize access="hasPermission(#user, 'remove_permissao')">
				if(item.id > 17) {
					$(p).append('<button type="button" class="btn btn-default action" data-action="${remove}" data-target="'+item.id+'"><span class="glyphicon glyphicon-remove">Remover</span></button>');
				}
			</sec:authorize>
			
			$("#workspace").append(p);
		});
		
		var id = "${usuario.id}";
		url = "${permissoes_usuario}";
		$.ajax({
			type: "GET",
			url: url,
			data: {id: id}
		}).done(function(data){
			var json = jQuery.parseJSON(data);
			$.each(json.grupo, function(index, item) {
				$("#workspace").find('.checkbox').each(function(){
					if($(this).val() == item.id) {
						$(this).attr('checked', 'checked');
					}
				});
			});
		});
		
	});
};

function load_region(pagina, alvo) {
	url = alvo == "" ? pagina : pagina+"/"+alvo;
	$.get(url, function(data){
		var $temp  = $('<div/>', {html:data});
		var titulo = $temp.find('title').text();
		var conteudo = $temp.remove('head').html();
		$("#output-header").text(titulo);
		$("#output-body").html(conteudo);
	});
};

$(document).ready(function() {
	load();
});

$(document).on('click','.checkbox',function(){
	var id_permissao = $(this).val();
	var id_usuario = "${usuario.id}";
	var url = "${altera}";
    $.ajax({
    	type: "POST",
    	url: url,
    	data: {usuario: id_usuario, grupo: id_permissao}
    }).done(function(data){
    	if(data == "yes") {
    		console.log("permissao cadastrada com sucesso!");
    	}
    	else {
    		console.log("erro ao cadastrar a permissao");
    	}
    });
});

var action;
var target;
var url;

$(document).on('click', '.action', function (event) {
	if( $("#output").is(":visible") ) {
		if(action == $(this).data('action')) {
			$("#output-header").empty();
			$("#output-body").empty();
			$("#output").css("display", "none");
		} else {
			$("#output-header").empty();
			$("#output-body").empty();
			action = $(this).data('action');
			target = $(this).data('target');
			load_region(action, target);
			$("#output").css("display", "block");
		}
	} else {
		action = $(this).data('action');
		target = $(this).data('target');
		load_region(action, target);
		$("#output").css("display", "block");
	}
});
</script>

</body>
</html>