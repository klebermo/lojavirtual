<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de usu&aacute;rio</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>
  
	  <c:url value="/usuario/cadastra.htm" var="cadastraUsuario"/>
	  <form class="form" role="form" action="${cadastraUsuario}" method="post">
	      <p>
	        <label for="login">Login</label>
	      	<input type="text" name="login" class="form-control" placeholder="Login" autofocus>
	      </p>
	      <p>
	        <label for="senha">Senha</label>
	      	<input type="password" name="senha" class="form-control" placeholder="Senha">
	      </p>
		  <p>
		    <label for="email">E-mail</label>
		  	<input type="email" name="email" class="form-control" placeholder="E-mail">
		  </p>
		  <p>
		    <label for="pnome">Nome</label>
		  	<input type="text" name="pnome" class="form-control" placeholder="Nome">
		  </p>
		  <p>
		    <label for="unome">Sobrenome</label>
		  	<input type="text" name="unome" class="form-control" placeholder="Sobrenome">
		  </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Usu&aacute;rio cadastrado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar o usu&aacute;rio.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

<script>
// Attach a submit handler to the form
$( ".form" ).submit(function( event ) {
 
  // Stop form from submitting normally
  event.preventDefault();
 
  // Get some values from elements on the page:
  var $form = $( this ),
    login = $form.find( "input[name='login']" ).val(),
    senha = $form.find( "input[name='senha']" ).val(),
    email = $form.find( "input[name='email']" ).val(),
    pnome = $form.find( "input[name='pnome']" ).val(),
    unome = $form.find( "input[name='unome']" ).val(),
    url = $form.attr( "action" );
 
  // Send the data using post
  var posting = $.post( url, { login: login, senha: $.md5(senha), email: email, pnome: pnome, unome: unome } );
 
  // Put the results in a div
  posting.done(function( data ) {
	  $("#"+data).show();
	  $(".form").each(function(){
		  $(this).reset();
	  });
  });
});
</script>

</body>
</html>