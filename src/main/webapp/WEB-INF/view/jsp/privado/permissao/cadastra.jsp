<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastra novo grupo de permiss&otilde;es</title>
</head>
<body>

<script>
$(document).ready(function(){
	$("#yes").hide();
	$("#not").hide();
});
</script>

<c:url value="/permissao/permissoes.json" var="permissoes"/>
  
	    <c:url value="/permissao/cadastra.htm" var="cadastraGrupo"/>
	    <form class="form" role="form" action="${cadastraGrupo}" method="post">
      		<p> <input type="text" name="nome" class="form-control" placeholder="Nome" autofocus> </p>
      		
			<table class="bordered">
			<tr>
				<td>
					<select name="permissoes" id="permissoes" size="10" multiple="multiple">
					</select>
				</td>
				
			<td>
				<p> <button type="button" class="btn btn-lg btn-default" id="for_left"> << </button> </p>
				<p> <button type="button" class="btn btn-lg btn-default" id="for_right"> >> </button> </p>
			</td>
			
				<td>
					<select name="selecao" id="selecao" size="10" multiple="multiple">
					</select>
				</td>
			</tr>
			</table>
      		
	      	<p> <button type="submit" class="btn btn-primary">Cadastrar</button> </p>
	     </form>
    
      <div id="yes" class="alert alert-success">
        <strong>Pronto!</strong> Permiss&atilde;o cadastrado com sucesso.
      </div>
      
      <div id="not" class="alert alert-danger">
        <strong>Erro!</strong> N&atilde;o foi possivel cadastrar a permiss&atilde;o.
      </div>

<script>
$(document).ready(function(){
	var url = "${permissoes}";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.permissao, function(index, item) {
			$('#permissoes').append('<option value="'+item.id+'">'+item.nome+'</option>');
		});
	});
});

$('#for_right').click(function(e) {
    var selectedOpts = $('#permissoes option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('#selecao').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});

$('#for_left').click(function(e) {
    var selectedOpts = $('#selecao option:selected');
    if (selectedOpts.length == 0) {
        e.preventDefault();
    }

    $('#permissoes').append($(selectedOpts).clone());
    $(selectedOpts).remove();
    e.preventDefault();
});

$( ".form" ).submit(function( event ) {
	  event.preventDefault();
	  var $form = $( this ), url = $form.attr( "action" );
	  
	  var selecao_permissoes=[];
		$('#selecao option').each(function(){
			selecao_permissoes.push($(this).val());
		});
	  
	  var nome = $("input[name=nome]").val();
	  
	  $.ajax({
		  type: "POST",
		  url: url,
		  data: { nome: nome, permissoes: selecao_permissoes }
		}).done(function( msg ) {
		    $("#"+msg).show();
		    $(".form").each (function(){
				  this.reset();
			});
		});
});
</script>

</body>
</html>