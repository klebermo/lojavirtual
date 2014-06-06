<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastra novo grupo de permiss&otilde;es</title>
</head>
<body>

<c:url value="/permissao/permissoes.json" var="permissao"/>
  
	    <c:url value="/permissao/cadastra" var="cadastraGrupo"/>
	    <form class="form" role="form" action="${cadastraGrupo}" method="post">
      		<p> <input type="text" name="nome" class="form-control" placeholder="Nome" autofocus> </p>
      		
      		<p>
				<div class="row">
			        <div class="col-md-4">
						<select class="form-control all all_permissoes" size="10" multiple="multiple">
						</select>
			        </div>
			        <div class="col-md-4">
						<p> <button type="button" class="btn btn-lg btn-default" id="for_left"> << </button> </p>
						<p> <button type="button" class="btn btn-lg btn-default" id="for_right"> >> </button> </p>
			        </div>
			        <div class="col-md-4">
						<select name="permissoes" class="form-control lista lista_permissoes" size="10" multiple="multiple">
						</select>
			        </div>
				</div>
			</p>
      		
	      	<p> <button type="submit" class="btn btn-primary">Cadastrar</button> </p>
	     </form>
    
      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Permiss&atilde;o cadastrado com sucesso.
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar a permiss&atilde;o.
      </div>

<script>
$(document).ready(function(){
	var url = "${permissao}";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.item, function(index, item) {
			$('.all_permissoes').append('<option class="item item_permissao" value="'+item.id+'">'+item.nome+'</option>');
		});
	});
});

$('#for_right').click(function(e) {
    var selectedOpts = $('.all_permissoes option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('.lista_permissoes').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});

$('#for_left').click(function(e) {
    var selectedOpts = $('.lista_permissoes option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('.all_permissoes').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});
</script>

</body>
</html>