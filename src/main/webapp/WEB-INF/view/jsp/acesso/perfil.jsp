<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Perfil de ${usuario.login}</title>
</head>
<body>

<c:url value="/usuario/altera" var="atualizaPerfil"/>

<form class="form" role="form" action="${atualizaPerfil}" method="post">
	<table>
		<tr>
			<td>  <img src="" data-src="holder.js/200x200" class="img-thumbnail" alt="perfil"> </td>
			<td> <h2>perfil de ${usuario.first_name} ${usuario.last_name}</h2> </td>
		</tr>
		<tr>
			<table>
				<tr>
					<td><label for="login">Login</label></td>
					<td><input type="text" name="login" class="form-control" value="${usuario.login}" autofocus></td>
				</tr>
				<tr>
					<td><label for="senha">Senha</label></td>
					<td><input type="password" name="senha" class="form-control" value=""></td>
				</tr>
				<tr>
					<td><label for="pnome">Nome</label></td>
					<td><input type="text" name="pnome" class="form-control" value="${usuario.first_name}"></td>
				</tr>
				<tr>
					<td><label for="unome">Sobrenome</label></td>
					<td><input type="text" name="unome" class="form-control" value="${usuario.last_name}"></td>
				</tr>
				<tr>
					<td><label for="email">E-mail</label></td>
					<td><input type="text" name="email" class="form-control" value="${usuario.email}"></td>
				</tr>
			</table>
		</tr>
	</table>
	<button type="submit" class="btn btn-primary">atualizar perfil</button>
</form>

<div id="yes" class="alert alert-success" style="display: none;">
  <strong>Pronto!</strong> Perfil atualizado com sucesso.
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
</div>

<div id="not" class="alert alert-danger" style="display: none;">
  <strong>Erro!</strong> N&atilde;o foi possivel atualizar o perfil.
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
</div>

</body>
</html>
