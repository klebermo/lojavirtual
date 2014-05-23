<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde;o de produto</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>
	    
	  <c:url value="/produto/altera.htm" var="alteraProduto"/>
	  <form class="form" role="form" action="${alteraProduto}" method="post">
	      <p>
	      	<input type="hidden" name="id" class="form-control" value="${produto.id}">
	      </p>
	      <p>
	        <label for="login">Nome</label>
	      	<input type="text" name="nome" class="form-control" value="${produto.nome}" autofocus>
	      </p>
		  <p>
		    <label for="unome">Categoria</label>
		  	<select name="unome" class="form-control" id="categoria">
		  	</select>
		  </p>
	      <p>
	        <label for="senha">Descri&ccedil;&atilde;o</label>
	        <textarea rows="25" cols="80" name="descricao"> ${produto.descricao} </textarea>
	      </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Produto alterado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel alterar o produto.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

<c:url value="/categoria/listagem.json" var="lista"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
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