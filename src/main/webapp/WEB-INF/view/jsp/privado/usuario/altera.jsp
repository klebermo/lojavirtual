<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
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

<div class="col-sm-4">
  <div class="panel panel-warning">
  
	<div class="panel-heading">
	  <h3 class="panel-title">Cadastro de usu&aacute;rio</h3>
	</div>
	    
    <div class="panel-body">
	    <c:url value="/usuario/altera" var="alteraUsuario"/>
	    <form class="form" role="form" action="${alteraUsuario}" method="post">
	      <p> <input type="text" class="form-control" placeholder="Login" autofocus> </p>
	      <p> <input type="password" class="form-control" placeholder="Senha"> </p>
	      <p> <input type="email" class="form-control" placeholder="E-mail"> </p>
	      <p> <button type="submit" class="btn btn-primary">Cadastrar</button> </p>
	     </form>
    </div>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Usu&acute;rio cadastrado com sucesso.
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar o usu&aacute;rio.
      </div>
      
  </div>
</div>

</body>
</html>