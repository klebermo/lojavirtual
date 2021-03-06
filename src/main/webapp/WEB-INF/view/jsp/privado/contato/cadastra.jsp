<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de contato</title>
</head>
<body>  
	  <c:url value="/contato/cadastra" var="cadastraContato"/>
	  <form class="form" role="form" action="${cadastraContato}" method="post">
	      <p>
	        <label for="nome">Nome</label>
	      	<input type="text" name="nome" class="form-control" placeholder="Nome" autofocus>
	      </p>
	      <p>
	        <label for="email">E-Mail</label>
	      	<input type="text" name="email" class="form-control" placeholder="E-Mail">
	      </p>
	      <p>
	        <label for="telefone">Telefone</label>
	      	<input type="text" name="telefone" class="form-control valida" pattern="([0-9]{2}) [0-9]{4}-[0-9]{4}">
	      </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="done" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Contato cadastrado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="fail" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar o contato.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>