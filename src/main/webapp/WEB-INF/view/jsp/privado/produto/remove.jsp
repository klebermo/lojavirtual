<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remover produto</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>

<c:url value="/produto/listagem" var="listagem"/>

<c:url value="/produto/remove" var="removeProduto"/>
<form class="form" role="form" action="${removeProduto}" method="post">
<div class="alert alert-warning" id="pergunta">
  <strong>Aten&ccedil;&atilde;o!</strong> Tem certeza que quer remover o produto <c:out value="${produto.nome}"/>?
  <input type="hidden" name="id" value="<c:out value="${produto.id}"/>">
  <button type="submit" class="btn btn-lg btn-link"><span class="glyphicon glyphicon-ok"></span></button>
  <button type="button" class="btn btn-lg btn-link link" data-action="${listagem}"><span class="glyphicon glyphicon-remove"></span></button>
</div>
</form>

      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Usu&aacute;rio excluido com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel excluir o usu&aacute;rio.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>