<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde;o de usu&aacute;rio</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>
	    
	  <c:url value="/usuario/altera.htm" var="alteraUsuario"/>
	  <form class="form" role="form" action="${alteraUsuario}" method="post">
	      <p>
	      	<input type="hidden" name="id" class="form-control" value="${usuario.id}" autofocus>
	      </p>
	      <p>
	        <label for="login">Login</label>
	      	<input type="text" name="login" class="form-control" value="${usuario.login}" autofocus>
	      </p>
	      <p>
	        <label for="senha">Senha</label>
	      	<input type="password" class="form-control" onchange="md5()">
	      	<input type="hidden" name="senha" class="form-control">
	      </p>
		  <p>
		    <label for="email">E-mail</label>
		  	<input type="email" name="email" class="form-control" value="${usuario.email}">
		  </p>
		  <p>
		    <label for="pnome">Nome</label>
		  	<input type="text" name="pnome" class="form-control" value="${usuario.first_name}">
		  </p>
		  <p>
		    <label for="unome">Sobrenome</label>
		  	<input type="text" name="unome" class="form-control" value="${usuario.last_name}">
		  </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Usu&aacute;rio alterado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel alterar o usu&aacute;rio.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>