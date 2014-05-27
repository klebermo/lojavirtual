<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de produto</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>
  
	  <c:url value="/produto/cadastra.htm" var="cadastraProduto"/>
	  <form class="form" role="form" action="${cadastraProduto}" method="post">
	      <p>
	        <label for="login">Nome</label>
	      	<input type="text" name="nome" class="form-control" placeholder="Nome" autofocus>
	      </p>
		  <p>
		    <label for="unome">Categoria</label>
		  	<select name="categoria" class="form-control" id="categoria">
		  	</select>
		  </p>
	      <p>
	        <label for="descricao">Descri&ccedil;&atilde;o</label>
	      	<textarea rows="25" cols="80" name="descricao"> </textarea>
	      </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Produto cadastrado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar o produto.
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