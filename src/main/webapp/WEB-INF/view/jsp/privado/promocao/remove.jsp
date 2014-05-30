<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remover promo&ccedil;&atilde;o</title>
</head>
<body>

<c:url value="/promocao/listagem" var="listagem"/>

<c:url value="/promocao/remove" var="removePromocao"/>
<form class="form" role="form" action="${removePromocao}" method="post">
<div class="alert alert-warning" id="pergunta">
  <strong>Aten&ccedil;&atilde;o!</strong> Tem certeza que quer remover a promo&ccedil;&atilde;o para o produto <c:out value="${promocao.produto.nome}"/>?
  <input type="hidden" name="id" value="<c:out value="${promocao.id}"/>">
  <button type="submit" class="btn btn-lg btn-link"><span class="glyphicon glyphicon-ok"></span></button>
  <button type="button" class="btn btn-lg btn-link link" data-action="${listagem}"><span class="glyphicon glyphicon-remove"></span></button>
</div>
</form>

      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Promo&ccedil;&atilde;o excluida com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel excluir a promo&ccedil;&atilde;o.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>