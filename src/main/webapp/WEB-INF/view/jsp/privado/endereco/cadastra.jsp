<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de endereco</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>
  
	  <c:url value="/endereco/cadastra" var="cadastraEndereco"/>
	  <form class="form" role="form" action="${cadastraEndereco}" method="post">
	      <p>
	        <label for="logradouro">Logradouro</label>
	      	<input type="text" name="logradouro" class="form-control" placeholder="Logradouro" autofocus>
	      </p>
	      <p>
	        <label for="numero">N&uacute;mero</label>
	      	<input type="text" name="numero" class="form-control">
	      </p>
	      <p>
	        <label for="complemento">Complemento</label>
	      	<input type="text" name="complemento" class="form-control" placeholder="Complemento">
	      </p>
	      <p>
	        <label for="Bairro">Bairro</label>
	      	<input type="text" name="bairro" class="form-control" placeholder="Bairro">
	      </p>
	      <p>
	        <label for="cidade">Cidade</label>
	      	<input type="text" name="cidade" class="form-control" placeholder="Cidade">
	      </p>
	      <p>
	        <label for="estado">Estado</label>
	      	<input type="text" name="estado" class="form-control" placeholder="Estado">
	      </p>
	      <p>
	        <label for="cep">CEP</label>
	      	<input type="text" name="cep" class="form-control" placeholder="XX.XXX-XXX" pattern="[0-9]{2}.[0-9]{3}-[0-9]{3}">
	      </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Endere&ccedil;o cadastrado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar o endere&ccedil;o.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>