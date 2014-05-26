<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde; de contato</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>
  
	  <c:url value="/contato/altera" var="alteraContato"/>
	  <form class="form" role="form" action="${alteraCategoria}" method="post">
	      <p>
	      	<input type="hidden" name="id" class="form-control" value="${contato.id}" autofocus>
	      </p>
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
	      	<input type="text" name="telefone" class="form-control" placeholder="(XX) XXXX-XXXX" pattern="([0-9]{2}) [0-9]{4}-[0-9]{4}">
	      </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Alterar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Contato alterado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel alterar o contato.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>