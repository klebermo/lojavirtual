<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Altera&ccedil;&atilde; de destaque</title>
</head>
<body>

<c:url value="/destaque/altera" var="alteraDestaque"/>

      <div id="yes" class="alert alert-success" style="display: none;">
        <strong>Pronto!</strong> Destaque alterado com sucesso.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>
      
      <div id="not" class="alert alert-danger" style="display: none;">
        <strong>Erro!</strong> N&atilde;o foi possivel alterar o destaque.
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      </div>

<div class="panel panel-warning">
	<div class="panel-heading">
		<c:choose>
		    <c:when test="${destaque.categoria == ''}">
		       <h3 class="panel-title">Produtos em destaque na p&aacute;gina frontal</h3>
		    </c:when>
		    <c:otherwise>
		        <h3 class="panel-title">Produtos em destaque na p&aacute;gina da categoria</h3>
		    </c:otherwise>
		</c:choose>
	</div>
	<div class="panel-body">
	  <form class="form" role="form" action="${cadastraDestaque}" method="post">
	      <p>
	      	<input type="hidden" name="id" value="${destaque.id}">
	      </p>
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Produtos em destaque na p&aacute;gina frontal</h3>
            </div>
            <div class="panel-body">
					<table>
					<tr>
						<td>
							<select id="all_produtos" size="10" multiple="multiple">
							</select>
						</td>
							
						<td>
							<p> <button type="button" class="btn btn-lg btn-default" id="for_left_1"> << </button> </p>
							<p> <button type="button" class="btn btn-lg btn-default" id="for_right_1"> >> </button> </p>
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

<c:url value="/produto/listagem_por_categoria.json" var="lista_produtos"/>

<script>
$(document).ready(function(){	
	var url = "<c:out value="${lista_produtos}"/>";
	var categoria = "${destaque.categoria}";
	$.ajax({
		type: "GET",
		url: url,
		data: {id: categoria}
	}).done(function(){
		var json = jQuery.parseJSON( data );
		$.each(json.produto, function(index, item){
		    var option = $('<option class="produto" value="'+item.id+'">'+item.nome+'</option>');
		    $('#all_produtos').append(option);
		});
	});
});
</script>

</body>
</html>