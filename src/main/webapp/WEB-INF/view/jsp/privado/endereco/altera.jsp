<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde; de endere&ccedil;o</title>
</head>
<body>
  
	  <c:url value="/endereco/altera" var="alteraEndereco"/>
	  <form class="form" role="form" action="${alteraEndereco}" method="post">
	      <p>
	      	<input type="hidden" name="id" class="form-control">
	      </p>
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
    
      <div id="done" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Endere&ccedil;o alterado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="fail" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel alterar o endere&ccedil;o.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>