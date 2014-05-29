<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remover contato</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#done").hide();
	$("#fail").hide();
});
</script>

<c:url value="/contato/listagem" var="listagem"/>

<c:url value="/contato/remove" var="removeContato"/>
<form class="form" role="form" action="${removeContato}" method="post">
<div class="alert alert-warning" id="pergunta">
  <strong>Aten&ccedil;&atilde;o!</strong> Tem certeza que quer remover o conatato: <c:out value="${contato.nome}"/>?
  <input type="hidden" name="id" value="<c:out value="${contato.id}"/>">
  <button type="submit" class="btn btn-lg btn-link"><span class="glyphicon glyphicon-ok"></span></button>
  <button type="button" class="btn btn-lg btn-link link" data-action="${listagem}"><span class="glyphicon glyphicon-remove"></span></button>
</div>
</form>

      <div id="done" class="alert alert-success">
        <strong>Pronto!</strong> Contato excluido com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="fail" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel excluir a contato.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>