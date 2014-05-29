<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de Materia Prima</title>
</head>
<body>
  
	  <c:url value="/materia_prima/cadastra" var="cadastraMateriaPrima"/>
	  <form class="form" role="form" action="${cadastraMateriaPrima}" method="post">
	      <p>
	        <label for="nome">Nome</label>
	      	<input type="text" name="nome" class="form-control" placeholder="Nome" autofocus>
	      </p>
	      <p>
	        <label for="descricao">Descri&ccedil;&atilde;o</label>
	      	<textarea rows="25" cols="80" name="descricao" style="vertical-align: top;"> </textarea>
	      </p>
	      <p>
	        <label for="fornecedor">Fornecedor</label>
	      	<input list="lista_fornecedores" name="fornecedor">
	      	<datalist id="lista_fornecedores"></datalist>
	      </p>
	      <p>
	        <label for="quantidade">Quantidade</label>
	      	<input type="number" name="quantidade" class="form-control" pattern="[0-9]{3},[0-9]{2}">
	      </p>
	      <p>
	        <label for="unidade">Unidade</label>
	      	<input type="text" name="unidade" class="form-control">
	      </p>
	      <p>
	        <label for="custo">Pre&ccedil;o por unidade</label>
	      	<input type="number" name="custo" class="form-control" pattern="[0-9]{4},[0-9]{2}">
	      </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Materia Prima cadastrada com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar a materia-prima.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

<c:url value="/fornecedor/listagem.json" var="lista"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.fornecedor, function(index, item){
		    var option = $('<option value="'+item.id+'">'+item.nome+'</option>');
		    $('#lista_fornecedores').append(option);
		});
	});
});
</script>

</body>
</html>