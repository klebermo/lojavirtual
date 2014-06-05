<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Permiss&otilde;es de ${usuario.login}</title>
</head>
<body>

<c:url value="/permissao/cadastra" var="cadastra"/>
<c:url value="/permissao/altera" var="altera"/>
<c:url value="/permissao/remove" var="remove"/>
<c:url value="/permissao/listagem" var="listagem"/>

<c:url value="/permissao/grupos.json" var="grupos"/>
<c:url value="/permissao/permissoes_grupo.json" var="permissoes"/>

<p>
	<button type="button" class="btn btn-lg btn-link action" data-action="${cadastra}" data-target="">
		cadastrar novo grupo
	</button>
</p>

<div class="row">
  <div class="col-md-3">
  	<div class="row">
	  	<div class="col-lg-6">
	  		<div class="input-group">
	  			<span class="input-group-addon">
	  				<input class="checkbox" type="checkbox">
	  			</span>
	  			<input type="text" class="form-control" value="">
	  			<span class="input-group-btn">
	  				<button class="btn btn-default action" data-action="${permissoes}/${usuario.id}" data-target="workspace" type="button"><span class="glyphicon glyphicon-chevron-down"></span></button>
	  			</span>
	  		</div>
	  		<c:if test="${item.id > 17}">
	  		<button class="btn btn-default action" data-action="${remove}/${usuario.id}/${item.id}" data-target="workspace" type="button"><span class="glyphicon glyphicon-trash"></span></button>
	  		</c:if>
	  		<button class="btn btn-default action" data-action="${altera}/${uuario.id}/${item.id}" data-target="workspace" type="button"><span class="glyphicon glyphicon-refresh"></span></button>
	  	</div>
  	</div>
  </div>
  <div class="col-md-6" style="display: none;">
  	<div id="workspace" class="panel panel-primary">
  		<div id="titulo" class="panel-heading">
  		</div>
  		<div id="conteudo" class="panel-body">
  		</div>
  	</div>
  </div>
</div>

</body>
</html>