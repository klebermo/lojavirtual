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
			</div><!-- /.col-lg-6 -->
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
              <h3 class="panel-title">Endere&ccedil;o</h3><c:url value="/endereco/cadastra" var="cadastra_endereco"/><a class="popup" data-target="cad_endereco" data-function="lista_endereco()" href="${cadastra_endereco}">Novo</a>
            </div>
            <div id="endereco" class="panel-body">
            	<div id="lista_endereco">
            		<select name="endereco" id="select_endereco" size="5"></select>
            	</div>
            	<div id="cad_endereco" class="dialog" title="Basic dialog">
            		<p> <span id="text"></span> </p>
            	</div>
            </div>
          </div>
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Contato</h3><c:url value="/contato/cadastra" var="cadastra_contato"/><a class="popup" data-target="cad_contato" data-function="lista_contato()" href="${cadastra_contato}">Novo</a>
            </div>
            <div id="contato" class="panel-body">
            	<div id="lista_contato">
            		<select name="contato" id="select_contato" size="5"></select>
            	</div>
            	<div id="cad_contato" class="dialog" title="Basic dialog">
            		<p> <span id="text"></span> </p>
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

<c:url value="/endereco/altera" var="altera_endereco"/>
<c:url value="/contato/altera" var="altera_contato"/>

<script>
function lista_endereco(){
	var url = "<c:out value="${lista_endereco}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.fornecedor, function(index, item){
		    var option = $('<option class="item_endereco" value="'+item.id+'">'+item.nome+'</option>');
		    $('#select_endereco').append(option);
		});
	});
};

function lista_contato(){
	var url = "<c:out value="${lista_contato}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.fornecedor, function(index, item){
		    var option = $('<option class="item_contato" value="'+item.id+'">'+item.nome+'</option>');
		    $('#select_contato').append(option);
		});
	});
};

$(document).on("click", ".item_endereco", function(e){
	var id = $(this).val();
	var url = "${altera_endereco}/" + id;
	var div = $("#cad_endereco");
	open_dialog(url, div, lista_endreco());
});

$(document).on("click", ".item_contato", function(e){
	var id = $(this).val();
	var url = "${altera_contato}/" + id;
	var div = $("#cad_contato");
	open_dialog(url, div, lista_contato());
});

$(".dropdown-menu li a").click(function(){
    var value = $(this).text();

    var pattern = value == 'Cnpj' ? '[0-9]{2}.[0-9]{3}.[0-9]{3}/[0-9]{4}-[0-9]{2}' : '[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}';
    var placeholder = value == 'Cnpj' ? 'XX.XXX.XXX/XXXX-XX' : 'XXX.XXX.XXX-XX';
    $('.dropdown-toggle').text(value);
    $('[name="identificador"]').attr('pattern', pattern);
    $('[name="identificador"]').attr('placedholder', placeholder);
});
</script>

</body>
</html>