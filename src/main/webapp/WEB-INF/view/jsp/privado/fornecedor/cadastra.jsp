<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de fornecedor</title>
</head>
<body>

<script>
$( document ).ready(function() {
	$("#yes").hide();
	$("#not").hide();
});
</script>

<c:url value="/endereco/cadastra" var="cadastro_endereco"/>
<c:url value="/contato/cadastra" var="cadastro_contato"/>
  
	  <c:url value="/fornecedor/cadastra" var="cadastraFornecedor"/>
	  <form class="form" role="form" action="${cadastraFornecedor}" method="post">
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Dados de identifica&ccedil;&atilde;o</h3>
            </div>
            <div class="panel-body">
            	<p>
				    <div class="input-group">
					      <div class="input-group-btn">

						        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Identificador <span class="caret"></span></button>

						        <ul class="dropdown-menu">
						          <li><a href="#">Cpf</a></li>
						          <li><a href="#">Cnpj</a></li>
						        </ul>
						        
					      </div><!-- /btn-group -->
					      
					      <input type="text" name="identificador" class="form-control">
				    </div><!-- /input-group -->
			    </p>
		      <p>
		        <label for="nome">Nome</label>
		      	<input type="text" name="nome" class="form-control" placeholder="Nome">
		      </p>
		      <p>
		        <label for="website">Website</label>
		      	<input type="text" name="website" class="form-control" placeholder="website">
		      </p>
            </div>
           </div>
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Endere&ccedil;o</h3>
            </div>
            <div id="endereco" class="panel-body">
				<p>
					<button type="button" class="btn btn-sm btn-link popup" data-action="${cadastro_endereco}" data-target="cad_endereco" data-function="lista_endereco()">
						cadastrar novo endere&ccedil;o
					</button>
				</p>
            	<div id="lista_endereco"></div>
            	<div id="cad_endereco">
            		<div class="dialog" title="Basic dialog"> <p> <span id="text"></span> </p> </div>
            	</div>
            </div>
          </div>
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Contato</h3>
            </div>
            <div id="contato" class="panel-body">
				<p>
					<button type="button" class="btn btn-sm btn-link popup" data-action="${cadastro_contato}" data-target="cad_contato" data-function="lista_contato()">
						cadastrar novo contato
					</button>
				</p>
            	<div id="lista_contato"></div>
            	<div id="cad_contato">
            		<div class="dialog" title="Basic dialog"> <p> <span id="text"></span> </p> </div>
            	</div>
            </div>
          </div>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Fornecedor cadastrado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar o fornecedor.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

<c:url value="/fornecedor/endereco.json" var="lista_endereco"/>
<c:url value="/fornecedor/contato.json" var="lista_contato"/>

<script>
function lista_endereco(){
	var url = "${lista_endereco}";
	$.get( url, function( data ) {
		  $( "#lista_endereco" ).html( data );
	});
};

function lista_contato(){
	var url = "${lista_contato}";
	$.get( url, function( data ) {
		  $( "#lista_contato" ).html( data );
	});
};

$(".dropdown-menu li a").click(function(){
    var value = $(this).text();

    var pattern = value == 'Cnpj' ? '[0-9]{2}.[0-9]{3}.[0-9]{3}/[0-9]{4}-[0-9]{2}' : '[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}';
    var placeholder = value == 'Cnpj' ? 'XX.XXX.XXX/XXXX-XX' : 'XXX.XXX.XXX-XX';
    $('.dropdown-toggle').text(value);
    $('[name="identificador"]').attr('pattern', pattern);
    $('[name="identificador"]').attr('placeholder', placeholder);
});
</script>

</body>
</html>