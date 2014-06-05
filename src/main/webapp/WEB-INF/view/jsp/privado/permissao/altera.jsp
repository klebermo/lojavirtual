<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alterar Permiss&otilde;es do usu&aacute;rio: ${usuario.login}</title>
</head>
<body>

<c:url value="/usuario/listagem" var="listagem"/>

<c:url value="/permissao/remove" var="alteraPermissao"/>
<form class="form" role="form" action="${alteraPermissao}" method="post">
<div class="alert alert-warning" id="pergunta">

	<c:choose>
		<c:forEach var="item" items="${usuario.autorizacao}">
	    <c:when test="${item.id == ${permissao.id}">
	       Remover a permiss&atilde;o <strong>${permissao.nome}</strong> do usu&aacute;rio <strong>${item.login}</strong>
	    </c:when>
	    </c:forEach>
	    <c:otherwise>
	        Conceder a permiss&atilde;o <strong>${permissao.nome}</strong> ao usu&aacute;rio <strong>${item.login}</strong>
	    </c:otherwise>
	</c:choose>
  
  <input type="hidden" name="grupo" value="${permissao.id}">
  <input type="hidden" name="usuario" value="${usuario.id}">
  
  <button type="submit" class="btn btn-lg btn-link"><span class="glyphicon glyphicon-ok"></span></button>
  <button type="button" class="btn btn-lg btn-link link" data-action="${listagem}"><span class="glyphicon glyphicon-remove"></span></button>
</div>
</form>

      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Altera&ccedil;&atilde;o efetuada com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel efetuar a altera&ccedil;&atilde;o.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

</body>
</html>