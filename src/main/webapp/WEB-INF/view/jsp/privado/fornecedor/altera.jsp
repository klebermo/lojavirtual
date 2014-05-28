<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde;o de fornecedor</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>
  
	  <c:url value="/fornecedor/altera" var="alteraFornecedor"/>
	  <form class="form" role="form" action="${alteraFornecedor}" method="post">
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Dados de identifica&ccedil;o</h3>
            </div>
            <div class="panel-body">
		      <p>
		      	<input type="hidden" name="id" class="form-control" value="${fornecedor.id}">
		      </p>
		      <p>
		        <label for="identificador">Cpf ou Cnpj</label>
		      	<input type="text" name="identificador" class="form-control" autofocus>
		      </p>
		      <p>
		        <label for="nome">Nome</label>
		      	<input type="text" name="nome" class="form-control" value="${fornecedor.nome}">
		      </p>
		      <p>
		        <label for="website">Website</label>
		      	<input type="text" name="website" class="form-control" value="${fornecedor.website}">
		      </p>
            </div>
          </div>
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Endere&ccedil;o</h3>
            </div>
            <div id="endereco" class="panel-body">
            	<div id="cad_endereco"></div>
            	<div id="lista_endereco"></div>
            </div>
          </div>
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Contato</h3>
            </div>
            <div id="contato" class="panel-body">
            	<div id="cad_contato"></div>
            	<div id="lista_contato"></div>
            </div>
          </div>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Categoria cadastrada com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar a categoria.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

<c:url value="/endereco/listagem.json" var="lista_endereco"/>
<c:url value="/contato/listagem.json" var="lista_contato"/>

<script>
function lista_endereco(){
	var url = "<c:out value="${lista_endereco}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.fornecedor, function(index, item){
		    var option = $('<option value="'+item.id+'">'+item.nome+'</option>');
		    $('#lista_endereco').append(option);
		});
	});
};

function lista_contato(){
	var url = "<c:out value="${lista_contato}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.fornecedor, function(index, item){
		    var option = $('<option value="'+item.id+'">'+item.nome+'</option>');
		    $('#lista_contato').append(option);
		});
	});
};
</script>

</body>
</html>