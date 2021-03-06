<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde;o de promo&ccedil;&atilde;o</title>
</head>
<body>
  
	  <c:url value="/promocao/altera" var="alteraPromocao"/>
	  <form class="form" role="form" action="${cadastraPromocao}" method="post">
	      <table>
	      	<tr>
		      	<td>
			        <label for="categoria">Categoria</label>
			        <select size="10" multiple="multiple" class="lista lista_categoria"></select>
		        </td>
		      	<td>
			        <label for="produto">Produto</label>
			        <select size="10" multiple="multiple" class="lista lista_produto"></select>
		        </td>
		      	<td id="entrada">
		      		<p>
		      			<input type="hidden" name="id" class="form-control" value="${promocao.id}">
				        <input type="hidden" name="produto" class="form-control" value="${promocao.produto.id}">
			        </p>
		      		<p>
				        <label for="desconto">Desconto</label>
				        <input type="text" name="desconto" class="form-control" value="${promocao.desconto}">
			        </p>
		        </td>
	        </tr>
	      </table>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Promo&ccedil;&atilde;o cadastrada com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar a promo&ccedil;&atilde;o.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

<c:url value="/categoria/listagem.json" var="lista_categoria"/>
<c:url value="/produto/listagem_por_categoria.json" var="lista_produto"/>

<script>

$(document).ready(function(){
	var id_produto = "${promocao.produto.id}";
	var id_categoria = "${promocao.produto.categoria.id}";
	
	var url = "<c:out value="${lista_categoria}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.categoria, function(index, item){
			var option;
			if(item.id == id_categoria)
		    	option = $('<option class="categoria" selected="selected" value="'+item.id+'">'+item.nome+'</option>');
			else
				option = $('<option class="categoria" value="'+item.id+'">'+item.nome+'</option>');
		    $('.lista_categoria').append(option);
		});
	});
	
	$.ajax({
		type: "GET",
		url: url,
		data: {id: id_categoria}
	}).done(function(){
		var json = jQuery.parseJSON( data );
		$.each(json.produto, function(index, item){
			var option;
			if(item.id == id_produto)
		    	option = $('<option class="produto" selected="selected" value="'+item.id+'">'+item.nome+'</option>');
			else
				option = $('<option class="produto" value="'+item.id+'">'+item.nome+'</option>');
		    $('.lista_produto').append(option);
		});
	});
});

$(document).on('click', '.categoria', function(){
	var url = "<c:out value="${lista_produto}"/>";
	var id = $(this).val();
	$.ajax({
		type: "GET",
		url: url,
		data: {id: id}
	}).done(function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.produto, function(index, item){
		    var option = $('<option class="produto" value="'+item.id+'">'+item.nome+'</option>');
		    $('.lista_produto').append(option);
		});
	});
});

$(document).on('click', '.produto', function(){
	if($("#entrada").is("visible")) {
		$("#entrada").css("display", "none");
		var id = $(this).val();
		$("input[name=produto]").val(id);
		$("#entrada").css("display", "block");
	}
	else {
		$("#entrada").css("display", "block");
		var id = $(this).val();
		$("input[name=produto]").val(id);
	}
});
</script>

</body>
</html>