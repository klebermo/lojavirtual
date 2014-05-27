<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remover permiss&atilde;o</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>

<c:url value="/usuario/listagem" var="listagem"/>

<c:url value="/permissao/remove" var="removePermissao"/>
<form class="form" role="form" action="${removePermissao}" method="post">
<div class="alert alert-warning" id="pergunta">
  <strong>Aten&ccedil;&atilde;o!</strong> Tem certeza que quer remover a permiss&atilde;o <c:out value="${permissao.nome}"/>?
  <input type="hidden" name="id" value="<c:out value="${permissao.id}"/>">
  <button type="submit" class="btn btn-lg btn-link"><span class="glyphicon glyphicon-ok"></span></button>
  <button type="button" class="btn btn-lg btn-link link" data-action="${listagem}"><span class="glyphicon glyphicon-remove"></span></button>
</div>
</form>

      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Permiss&atilde;o excluida com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel excluir a permiss&atilde;o.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

<script>
// Attach a submit handler to the form
$( ".form" ).submit(function( event ) {
 
  // Stop form from submitting normally
  event.preventDefault();
 
  // Get some values from elements on the page:
  var $form = $( this ),
    id_permissao = $('input[name=id]').val(),
    url = $form.attr( "action" );
 
  // Send the data using post
  var posting = $.post( url, { id: id_permissao } );
 
  // Put the results in a div
  posting.done(function( data ) {
	  $("#pergunta").remove();
	  $("#"+data).show();
  });
});
</script>

</body>
</html>