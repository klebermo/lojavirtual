<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde; de categoria</title>
</head>
<body>
  
	  <c:url value="/categoria/altera" var="alteraCategoria"/>
	  <form class="form" role="form" action="${alteraCategoria}" method="post">
	      <p>
	      	<input type="hidden" name="id" class="form-control" value="${categoria.id}">
	      </p>
	      <p>
	        <label for="nome">Nome</label>
	      	<input type="text" name="nome" class="form-control" value="${categoria.nome}" autofocus>
	      </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Categoria alterada com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel alterar a categoria.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>