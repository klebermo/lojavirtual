<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de usu&aacute;rios</title>
<style>
table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%;    
}

.bordered {
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;         
}

.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 10px;
    text-align: left;    
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
}

.bordered td:first-child, .bordered th:first-child {
    border-left: none;
}

.bordered th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;
}

.bordered th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.bordered th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}



/*----------------------*/

.zebra td, .zebra th {
    padding: 10px;
    border-bottom: 1px solid #f2f2f2;    
}

.zebra tbody tr:nth-child(even) {
    background: #f5f5f5;
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
}

.zebra th {
    text-align: left;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
    border-bottom: 1px solid #ccc;
    background-color: #eee;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5), to(#eee));
    background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);
    background-image:    -moz-linear-gradient(top, #f5f5f5, #eee);
    background-image:     -ms-linear-gradient(top, #f5f5f5, #eee);
    background-image:      -o-linear-gradient(top, #f5f5f5, #eee); 
    background-image:         linear-gradient(top, #f5f5f5, #eee);
}

.zebra th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;  
}

.zebra th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.zebra th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.zebra tfoot td {
    border-bottom: 0;
    border-top: 1px solid #fff;
    background-color: #f1f1f1;  
}

.zebra tfoot td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.zebra tfoot td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}

.zebra tfoot td:only-child{
    -moz-border-radius: 0 0 6px 6px;
    -webkit-border-radius: 0 0 6px 6px
    border-radius: 0 0 6px 6px
}
</style>
</head>
<body>

<c:url value="/usuario/usuarios.json" var="lista"/>
<c:url value="/usuario/cadastra.htm" var="novo"/>
<c:url value="/usuario/altera.htm" var="editar"/>
<c:url value="/usuario/remove.htm" var="remover"/>
<c:url value="/usuario/permissoes.json" var="permissoes"/>
<c:url value="/usuario/permissoes.htm" var="grupos"/>

<table class="bordered">
	<caption> <button type="button" class="btn btn-sm btn-primary" data-action="${novo}" data-target="">Novo</button> </caption>

    <thead>
    <tr>
        <th>#</th>        
        <th>Login</th>
        <th>Nome</th>
        <th>Sobrenome</th>
        <th>E-Mail</th>
        <th>#</th>
    </tr>
    </thead>
    
    <tfoot>
    <tr>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    </tr>
    </tfoot>
    
    <tbody class="content">
    <tr>
        <td></td>        
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td> <button type="button" class="btn btn-sm btn-primary" data-action="${editar}" data-target="${item.id}">Editar</button> <button type="button" class="btn btn-sm btn-primary" data-action="${remover}" data-target="${item.id}">Remover</button> <button type="button" class="btn btn-sm btn-primary" data-action="${grupos}" data-target="${item.id}">Permiss&otilde;es</button> </td>
    </tr>
    </tbody>

</table>

<script>
$(document).ready(function(){
	var url = "<c:out value="${lista}"/>";
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		for(var item in json.usuario) {
			var row = $('<tr>');
			row.append('<td>'+json.usuario[item].login+'</td>');
			row.append('<td>'+json.usuario[item].pnome+'</td>');
			row.append('<td>'+json.usuario[item].unome+'</td>');
			row.append('<td>'+json.usuario[item].email+'</td>');
			row.append('<td> <button type="button" class="btn btn-sm btn-primary" data-action="'+${editar}+'" data-target="'+json.usuario[item].id+'">Editar</button> <button type="button" class="btn btn-sm btn-primary" data-action="'+${remover}+'" data-target="'+json.usuario[item].id+'">Remover</button> <button type="button" class="btn btn-sm btn-primary" data-action="'+${grupos}+'" data-target="'+json.usuario[item].id+'">Permiss&otilde;es</button> </td>');
			$('tbody.content').append(row);
		}
	});
});

$(".btn").on("click", function(){
	var action = $(this).data('action');
	var target = $(this).data('target');
	alert("action="+action+",target="+target);
	
	if(target != "") {
		action = action + "?id=" + target;
	}
	
    $.get(action, function(data){
		var $temp  = $('<div/>', {html:data});
		var titulo = $temp.find('title').text();
		var conteudo = $temp.remove('head').html();
		$(".panel-title").empty();
		$(".panel-title").text(titulo);
		$(".panel-body").empty();
		$(".panel-body").html(conteudo);
		$("#content").show();
	});
});
</script>

</body>
</html>