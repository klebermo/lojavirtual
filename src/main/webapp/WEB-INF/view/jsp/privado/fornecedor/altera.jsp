<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde;o de fornecedor</title>
</head>
<body>

<c:url value="/endereco/cadastra" var="cadastro_endereco"/>
<c:url value="/contato/cadastra" var="cadastro_contato"/>
  
	  <c:url value="/fornecedor/altera" var="alteraFornecedor"/>
	  <form class="form" role="form" action="${alteraFornecedor}" method="post">
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Dados de identifica&ccedil;&atilde;o</h3>
            </div>
            <div class="panel-body">
		      <p>
		      	<input type="hidden" name="id" class="form-control" value="${fornecedor.id}" >
		      </p>
            	<p>
				    <div class="input-group">
					      <div class="input-group-btn">

						        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Identificador <span class="caret"></span></button>

						        <ul class="dropdown-menu">
						          <li><a href="#">Cpf</a></li>
						          <li><a href="#">Cnpj</a></li>
						        </ul>
						        
					      </div><!-- /btn-group -->
					      
					      <c:if test="${fornecedor.cpf != null}">
					      <input type="text" name="identificador" class="form-control" value="${fornecedor.cpf}" >
					      </c:if>
					      
					      <c:if test="${fornecedor.cnpj != null}">
					      <input type="text" name="identificador" class="form-control" value="${fornecedor.cnpj}" >
					      </c:if>
				    </div><!-- /input-group -->
			    </p>
		      <p>
		        <label for="nome">Nome</label>
		      	<input type="text" name="nome" class="form-control" value="${fornecedor.razao_social}" >
		      </p>
		      <p>
		        <label for="website">Website</label>
		      	<input type="text" name="website" class="form-control" value="${fornecedor.website}">
		      </p>
            </div>
           </div>
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Endere&ccedil;o</h3>
            </div>
            <div id="endereco" class="panel-body">
				<p>
					<button type="button" class="btn btn-sm btn-link popup" data-action="${cadastro_endereco}" data-target="popup_window_endereco" data-function="lista_endereco()">
						cadastrar novo endere&ccedil;o
					</button>
				</p>
					<table>
					<tr>
						<td>
							<select class="all all_enderecos" size="10" multiple="multiple">
							</select>
						</td>
						
					<td>
						<p> <button type="button" class="btn btn-lg btn-default" id="for_left_1"> << </button> </p>
						<p> <button type="button" class="btn btn-lg btn-default" id="for_right_1"> >> </button> </p>
					</td>
					
						<td>
							<select name="endereco" class="lista lista_enderecos" size="10" multiple="multiple">
								<c:forEach var="item" items="${fornecedor.endereco}">
									<option value="${item.id}">${item.logradouro}${item.numero}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					</table>
            </div>
          </div>
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Contato</h3>
            </div>
            <div id="contato" class="panel-body">
				<p>
					<button type="button" class="btn btn-sm btn-link popup" data-action="${cadastro_contato}" data-target="popup_windows_contato" data-function="lista_contato()">
						cadastrar novo contato
					</button>
				</p>
            	<div>
					<table>
					<tr>
						<td>
							<select class="all all_contatos" size="10" multiple="multiple">
							</select>
						</td>
						
					<td>
						<p> <button type="button" class="btn btn-lg btn-default" id="for_left_2"> << </button> </p>
						<p> <button type="button" class="btn btn-lg btn-default" id="for_right_2"> >> </button> </p>
					</td>
					
						<td>
							<select name="contato" class="lista lista_contatos" size="10" multiple="multiple">
								<c:forEach var="item" items="${fornecedor.contato}">
									<option value="${item.id}">${item.nome}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					</table>
            	</div>
            </div>
          </div>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Fornecedor cadastrado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar o fornecedor.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
<div id="popup_window_endereco">
	<div class="dialog" title="Basic dialog"> <p> <span id="text"></span> </p> </div>
</div>

<div id="popup_window_contato">
	<div class="dialog" title="Basic dialog"> <p> <span id="text"></span> </p> </div>
</div>

<c:url value="/endereco/listagem.json" var="lista_endereco"/>
<c:url value="/contato/listagem.json" var="lista_contato"/>

<script>
$(document).ready(function(){
	lista_endereco();
	lista_contato();
});

function lista_endereco(){
	var url = "<c:out value="${lista_endereco}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.endereco, function(index, item){
		    var row = $('<option class="item item_endereco" value="'+item.id+'">');
		    row.append('<td>'+item.logradouro+'</td>');
		    row.append('<td>'+item.numero+'</td>');
		    $('.all_enderecos').append(row);
		});
	});
};

function lista_contato(){
	var url = "<c:out value="${lista_contato}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.endereco, function(index, item){
		    var row = $('<option class="item item_endereco" value="'+item.id+'">');
		    row.append('<td>'+item.nome+'</td>');
		    $('.all_contatos').append(row);
		});
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

$('#for_right_1').click(function(e) {
    var selectedOpts = $('.all_enderecos option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('.lista_enderecos').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});

$('#for_left_1').click(function(e) {
    var selectedOpts = $('.lista_enderecos option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('.all_enderecos').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});

$('#for_right_2').click(function(e) {
    var selectedOpts = $('.all_contatos option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('.lista_contatos').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});

$('#for_left_2').click(function(e) {
    var selectedOpts = $('.lista_contatos option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('.all_contatos').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});
</script>

</body>
</html>