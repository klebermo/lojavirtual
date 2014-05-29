<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde;o de Materia Prima</title>
</head>
<body>
  
	  <c:url value="/materia_prima/altera" var="alteraMateriaPrima"/>
	  <form class="form" role="form" action="${alteraMateriaPrima}" method="post">
	      <p>
	        <label for="nome">Nome</label>
	      	<input type="text" name="nome" class="form-control" value="${descricao.nome}" autofocus>
	      </p>
	      <p>
	        <label for="descricao">Descri&ccedil;&atilde;o</label>
	      	<textarea rows="25" cols="80" name="descricao" value="${descricao.descricao}"> </textarea>
	      </p>
	      <p>
	        <label for="fornecedor">Fornecedor</label>
	      	<input list="lista_fornecedores" name="fornecedor" value="${descricao.fornecedor.nome}">
	      	<datalist id="lista_fornecedores"></datalist>
	      </p>
	      <p>
	        <label for="quantidade">Quantidade</label>
	      	<input type="number" name="quantidade" class="form-control" value="${quantidade.quantidade}">
	      </p>
	      <p>
	        <label for="unidade">Unidade</label>
	      	<input type="text" name="unidade" class="form-control" value="${quantidade.unidade}">
	      </p>
	      <p>
	        <label for="custo">Pre&ccedil;o por unidade</label>
	      	<input type="number" name="custo" class="form-control" value="${quantidade.custo}">
	      </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Materia Prima alterada com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel alterar a materia-prima.
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