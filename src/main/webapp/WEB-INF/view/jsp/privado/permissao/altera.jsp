<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alterar Permiss&otilde;es do usu&aacute;rio: <c:out value="${usuario.login}"/></title>
</head>
<body>

<c:url value="/usuario/listagem" var="listagem"/>

<c:set var="id_usuario" value="${usuario.id}" />
<c:set var="id_permissao" value="${permissao.id}" />

<c:url value="/permissao/altera" var="alteraPermissao"/>
<form class="form" role="form" action="${alteraPermissao}" method="post">
<div class="alert alert-warning" id="pergunta">

		<c:forEach var="item" items="${usuario.autorizacao}">
		    <c:if test="${item.id == id_permissao}">
		    	<c:set var="possui_permissao" value='1' />
		    </c:if>
	    </c:forEach>
	    <c:choose>
			<c:when test="${possui_permissao == '1'}">
				<input type="hidden" name="possui" value="yes">
				Remover a permiss&atilde;o <strong><c:out value="${permissao.nome}"/></strong> do usu&aacute;rio <strong><c:out value="${usuario.login}"/></strong>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="possui" value="not">
				Conceder a permiss&atilde;o <strong><c:out value="${permissao.nome}"/></strong> ao usu&aacute;rio <strong><c:out value="${usuario.login}"/></strong>
			</c:otherwise>
		</c:choose>
  
  <input type="hidden" name="grupo" value="${id_permissao}">
  <input type="hidden" name="usuario" value="${id_usuario}">
  
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