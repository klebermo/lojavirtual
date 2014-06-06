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
<c:url value="/permissao/listagem_grupo" var="permissoes"/>

<c:set var="id_usuario" value="${usuario.id}" />

<sec:authorize access="hasPermission(#user, 'cadastra_permissao')">
<p>
	<button type="button" class="btn btn-lg btn-link popup" data-action="${cadastra}" data-target="popup_window_permissao">
		cadastrar novo grupo
	</button>
</p>
</sec:authorize>

<c:forEach var="item" items="${grupos}">
	<div class="row">
		<div class="col-lg-6">
			<div class="input-group">
				<span class="input-group-addon">
					<c:forEach var="item2" items="${usuario.autorizacao}">
						    <c:if test="${item2.id == item.id}">
						       <span class="glyphicon glyphicon-ok-circle"></span>
						    </c:if>
					</c:forEach>
				</span>
				<input type="text" class="form-control" value="${item.nome}">
				<span class="input-group-btn">
					<button class="btn btn-default action" data-action="${permissoes}/${item.id}" data-target="view-${item.id}" type="button"><span class="glyphicon glyphicon-chevron-down"></span></button>
				</span>
			</div>
		</div>
		<sec:authorize access="hasPermission(#user, 'altera_permissao')">
		<div class="col-lg-3">
			<button class="btn btn-default link" data-action="${altera}/${id_usuario}/${item.id}" type="button"><span class="glyphicon glyphicon-refresh"></span></button>
		</div>
		</sec:authorize>
		<sec:authorize access="hasPermission(#user, 'remove_permissao')">
		<div class="col-lg-3">
			<c:if test="${item.id > 17}"><button class="btn btn-default link" data-action="${remove}/${item.id}" type="button"><span class="glyphicon glyphicon-trash"></span></button></c:if>
		</div>
		</sec:authorize>
	</div>
	<div class="row" id="view-${item.id}" style="display: none;">
	</div>
</c:forEach>

<div id="popup_window_permissao">
	<div class="dialog" title="Basic dialog"> <p> <span id="text"></span> </p> </div>
</div>

</body>
</html>