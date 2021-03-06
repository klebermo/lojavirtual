<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remover permiss&atilde;o ${permissao.nome}</title>
</head>
<body>

<c:url value="/usuario/listagem" var="listagem"/>

<c:url value="/permissao/remove" var="removePermissao"/>
<form class="form" role="form" action="${removePermissao}" method="post">
<div class="alert alert-warning" id="pergunta">

	Tem certeza que quer excluir o grupo de permiss&otilde;es <strong><c:out value="${permissao.nome}"/></strong>?
  
  <input type="hidden" name="id" value="<c:out value="${permissao.id}"/>">
  
  <button type="submit" class="btn btn-lg btn-link"><span class="glyphicon glyphicon-ok"></span></button>
  <button type="button" class="btn btn-lg btn-link link" data-action="${listagem}"><span class="glyphicon glyphicon-remove"></span></button>
</div>
</form>

      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Permiss&atilde;o excluida com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel excluir a permiss&atilde;o.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>