<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de destaque</title>
</head>
<body>

<c:url value="/destaque/cadastra" var="cadastraDestaque"/>

<div class="panel panel-warning">
	<div class="panel-heading">
	  <h3 class="panel-title">Destaques das p&aacute;ginas de categorias</h3>
	</div>
	<div class="panel-body">
	  <form class="form" role="form" action="${cadastraDestaque}" method="post">
	      <p>
	        <label for="categoria">Categoria</label>
	      	<select name="categoria" class="lista lista_categoria">
	      		<option value="">P&aacute;gina frontal</option>
	      	</select>
	      </p>
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Produtos em destaque na p&aacute;gina da categoria <span id="nome"></span></h3>
            </div>
            <div class="panel-body">
					<table>
					<tr>
						<td>
							<select class="all all_produtos" size="10" multiple="multiple">
							</select>
						</td>
							
						<td>
							<p> <button type="button" class="btn btn-lg btn-default" id="for_left"> << </button> </p>
							<p> <button type="button" class="btn btn-lg btn-default" id="for_right"> >> </button> </p>
						</td>
						
						<td>
							<select name="produtos" class="lista lista_produtos" size="10" multiple="multiple">
							</select>
						</td>
					</tr>
					</table>
            </div>
          </div>
		  <p>
		  	<button type="submit" class="btn btn-lg btn-default">Cadastrar</button>
		  </p>
	  </form>
	</div>
</div>

      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Destaques cadastrados com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar os destaques.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

<c:url value="/categoria/listagem.json" var="lista"/>
<c:url value="/produto/listagem_por_categoria.json" var="lista_produtos_1"/>
<c:url value="/produto/listagem.json" var="lista_produtos_2"/>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.categoria, function(index, item){
		    var option = $('<option class="categoria" value="'+item.id+'">'+item.nome+'</option>');
		    $('.lista_categoria').append(option);
		});
	});
	
	var url = "<c:out value="${lista_produtos_2}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.produto, function(index, item){
		    var option = $('<option class="produto" value="'+item.id+'">'+item.nome+'</option>');
		    $('.all_produtos').append(option);
		});
	});
});

$(document).on('click', '.categoria', function(){
	var id = $(this).val();
	var url;
	
	if(id=="") {
		url = "${lista_produtos_2}";
		$(".all_produtos").empty();
		
		$.get(url, function(data){
			var json = jQuery.parseJSON( data );
			$.each(json.produto, function(index, item){
			    var option = $('<option class="produto" value="'+item.id+'">'+item.nome+'</option>');
			    $('.all_produtos').append(option);
			});
		});
	}
	else {
		url = "${lista_produtos_1}";
		$(".all_produtos").empty();
		$("#nome").text($(this).text());
		
		$.ajax({
			type: "GET",
			url: url,
			data: {id: id}
		}).done(function(data){
			var json = jQuery.parseJSON( data );
			$.each(json.produto, function(index, item){
			    var option = $('<option class="produto" value="'+item.id+'">'+item.nome+'</option>');
			    $('.all_produtos').append(option);
			});
		});
	}
});

$('#for_right').click(function(e) {
    var selectedOpts = $('.all_produtos option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('.lista_produtos').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});

$('#for_left').click(function(e) {
    var selectedOpts = $('.lista_produtos option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('.all_produtos').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});
</script>

</body>
</html>