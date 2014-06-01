<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de produto</title>
</head>
<body>

	  <c:url value="/produto/cadastra.htm" var="cadastraProduto"/>
	  <form class="form" role="form" action="${cadastraProduto}" method="post">
	      <p>
	        <label for="login">Nome</label>
	      	<input type="text" name="nome" class="form-control" placeholder="Nome" autofocus>
	      </p>
		  <p>
		    <label for="unome">Categoria</label>
		  	<select name="categoria" class="form-control">
		  	</select>
		  </p>
	      <p>
	        <label for="descricao" style="display: inline-block; vertical-align: top;">Descri&ccedil;&atilde;o</label>
	      	<textarea rows="10" cols="90" name="descricao"> </textarea>
	      </p>
	      <p>
	      <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Materia-Prima</h3>
            </div>
            <div id="endereco" class="panel-body">
					<table>
					<tr>
						<td>
							<select class="all all_materia_prima" size="10" multiple="multiple">
							</select>
						</td>
						
					<td>
						<p> <button type="button" class="btn btn-lg btn-default" id="for_left"> << </button> </p>
						<p> <button type="button" class="btn btn-lg btn-default" id="for_right"> >> </button> </p>
					</td>
					
						<td>
							<select name="materiaPrima" class="lista lista_materia_prima" size="10" multiple="multiple">
							</select>
						</td>
					</tr>
					</table>
            </div>
	      </div>
	      </p>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
    
      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Produto cadastrado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar o produto.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

<c:url value="/categoria/listagem.json" var="lista"/>
<c:url value="/materia_prima/listagem.json" var="lista_materia_prima"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.categoria, function(index, item){
		    var option = $('<option value="'+item.id+'">'+item.nome+'</option>');
		    $('select[name=categoria]').append(option);
		});
	});
	
	url = "<c:out value="${lista_materia_prima}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.materia_prima, function(index, item){
		    var row = $('<option class="item item_materia_prima" value="'+item.id+'">');
		    row.append('<td>'+item.nome+'</td>');
		    $('.all_materia_prima').append(row);
		});
	});
});

$('#for_right').click(function(e) {
    var selectedOpts = $('.all_materia_prima option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('.lista_materia_prima').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});

$('#for_left').click(function(e) {
    var selectedOpts = $('.lista_materia_prima option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('.all_materia_prima').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});
</script>

</body>
</html>