<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remover categoria</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>

<c:url value="/categoria/listagem" var="listagem"/>

<c:url value="/categoria/remove" var="removeCategoria"/>
<form class="form" role="form" action="${removeCategoria}" method="post">
<div class="alert alert-warning" id="pergunta">
  <strong>Aten&ccedil;&atilde;o!</strong> Tem certeza que quer remover a Categoria <c:out value="${categoria.nome}"/>?
  <input type="hidden" name="id" value="<c:out value="${categoria.id}"/>">
  <button type="submit" class="btn btn-lg btn-link"><span class="glyphicon glyphicon-ok"></span></button>
  <button type="button" class="btn btn-lg btn-link link" data-action="${listagem}"><span class="glyphicon glyphicon-remove"></span></button>
</div>
</form>

      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Categoria excluida com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel excluir a categoria.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>