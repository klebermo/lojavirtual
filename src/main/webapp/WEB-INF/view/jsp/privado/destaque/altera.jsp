<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde;o de destaque</title>
</head>
<body>

<c:url value="/destaque/altera" var="alteraDestaque"/>

<div class="panel panel-warning">
	<div class="panel-heading">
	  <h3 class="panel-title">Destaques das p&aacute;ginas de categorias</h3>
	</div>
	<div class="panel-body">
	  <form class="form" role="form" action="${alteraDestaque}" method="post">
	      <p>
	      	<input type="hidden" name="id" value="${destaque.id}">
	      </p>
	      <p>
	      	<input type="hidden" name="categoria" value="${destaque.categoria}">
	      </p>
          <div class="panel panel-warning">
          <c:choose>
          	<c:when test="{destaque.categoria!=''}">
	            <div class="panel-heading">
	              <h3 class="panel-title">Produtos em destaque na p&aacute;gina da categoria <span id="nome"></span></h3>
	            </div>
            </c:when>
            <c:otherwise>
	            <div class="panel-heading">
	              <h3 class="panel-title">Produtos em destaque na p&aacute;gina frontal</h3>
	            </div>
            </c:otherwise>
           </c:choose>
            <div class="panel-body">
					<table>
					<tr>
						<td>
							<select id="all_produtos" size="10" multiple="multiple">
							</select>
						</td>
							
						<td>
							<p> <button type="button" class="btn btn-lg btn-default" id="for_left"> << </button> </p>
							<p> <button type="button" class="btn btn-lg btn-default" id="for_right"> >> </button> </p>
						</td>
						
						<td>
							<select name="produtos" id="lista_produtos" size="10" multiple="multiple">
								<c:forEach var="item" items="${destaque.produtos}">
									<option value="${item.id}">${item.nome}</option>
								</c:forEach>
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
	var id = "${destaque.categoria}";
	
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.categoria, function(index, item){
		    var option = $('<option class="categoria" value="'+item.id+'">'+item.nome+'</option>');
		    $('#lista_categoria').append(option);
		});
	});
	
	if(id=="") {
		url = "${lista_produtos_2}";
		
		var url = "<c:out value="${lista_produtos_2}"/>";
		$.get(url, function(data){
			var json = jQuery.parseJSON( data );
			$.each(json.produto, function(index, item){
			    var option = $('<option class="produto" value="'+item.id+'">'+item.nome+'</option>');
			    $('#all_produtos').append(option);
			});
		});
	}
	else {
		url = "${lista_produtos_1}";
		
		$("#nome").text($(this).text());
		$.ajax({
			type: "GET",
			url: url,
			data: {id: id}
		}).done(function(data){
			var json = jQuery.parseJSON( data );
			$.each(json.produto, function(index, item){
			    var option = $('<option class="produto" value="'+item.id+'">'+item.nome+'</option>');
			    $('#all_produtos').append(option);
			});
		});
	}
});

$('#for_right').click(function(e) {
    var selectedOpts = $('#all_produtos option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('#lista_produtos').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});

$('#for_left').click(function(e) {
    var selectedOpts = $('#lista_produtos option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('#all_produtos').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});
</script>

</body>
</html>