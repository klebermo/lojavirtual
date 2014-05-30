<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remover endere&ccedil;o</title>
</head>
<body>

<c:url value="/endereco/listagem" var="listagem"/>

<c:url value="/endereco/remove" var="removeEndereco"/>
<form class="form" role="form" action="${removeEndereco}" method="post">
<div class="alert alert-warning" id="pergunta">
  <strong>Aten&ccedil;&atilde;o!</strong> Tem certeza que quer remover o endere&ccedil;o <c:out value="${endereco.logradouro}"/>, <c:out value="${endereco.numero}"/>, B. <c:out value="${endereco.bairro}"/> ?
  <input type="hidden" name="id" value="<c:out value="${endereco.id}"/>">
  <button type="submit" class="btn btn-lg btn-link"><span class="glyphicon glyphicon-ok"></span></button>
  <button type="button" class="btn btn-lg btn-link link" data-action="${listagem}"><span class="glyphicon glyphicon-remove"></span></button>
</div>
</form>

      <div id="done" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Endere&ccedil;o excluido com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="fail" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel excluir o endere&ccedil;o.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>