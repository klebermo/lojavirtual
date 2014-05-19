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
	  <h3 class="panel-title">Altera&ccedil;&atilde;o de usu&aacute;rio</h3>
	</div>
	    
    <div class="panel-body">
	    <c:url value="/usuario/altera" var="alteraUsuario"/>
	    <form class="form" role="form" action="${alteraUsuario}" method="post">
	      <p> <input type="text" name="login" class="form-control" value="${usuario.login}" autofocus> </p>
	      <p> <input type="password" name="senha" class="form-control" valuer="${usuario.senha}"> </p>
	      <p> <input type="email" name="email" class="form-control" value="${usuario.email}"> </p>
	      <p> <input type="text" name="pnome" class="form-control" value="${usuario.pnome}"> </p>
	      <p> <input type="text" name="unome" class="form-control" value="${usuario.unome}"> </p>
	      <p> <button type="submit" class="btn btn-primary">Alterar</button> </p>
	     </form>
    </div>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Usu&acute;rio alterado com sucesso.
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel alterar o usu&aacute;rio.
      </div>
      
  </div>
</div>

</body>
</html>