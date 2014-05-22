<%@ include file="/WEB-INF/view/include.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard</title>

    <!-- Jquery core CSS -->
    <link href="<c:out value="${pageContext.request.contextPath}/resources/jquery/css/ui-lightness/jquery-ui-1.10.4.custom.min.css"/>" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="<c:out value="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:out value="${pageContext.request.contextPath}/resources/extras/css/dashboard.css"/>" rel="stylesheet">
    <link href="<c:out value="${pageContext.request.contextPath}/resources/extras/css/table.css"/>" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">lojavirtual</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li> <c:url value="/privado/blank" var="blank"/><a class="pagina" href="${blank}">Dashboard</a></li>
        <li> <c:url value="/privado/perfil" var="perfil"/><a class="pagina" href="#">Profile</a></li>
        <li> <c:url value="/logout" var="logoutUrl"/> <a href="${logoutUrl}">Logout</a> </li>
        <li><a href="#"><c:out value="${pageContext.request.remoteUser}"/></a></li>
      </ul>
    </div>
  </div>
</div>

<div class="container-fluid">
  <div class="row">
  
    <div class="col-sm-3 col-md-2 sidebar">
      <ul class="nav nav-sidebar">
        <li><a class="link" href="${blank}">Overview</a></li>
        <li> <c:url value="/produto/listagem" var="produto"/><a class="pagina" href="${produto}">Produtos</a></li>
        <li> <c:url value="/categoria/listagem" var="categoria"/><a class="pagina" href="${categoria}">Categorias</a></li>
        <li> <c:url value="/promocao/listagem" var="promocao"/><a class="pagina" href="${promocao}">Promo&ccedil;&otilde;es</a></li>
        <li> <c:url value="/destaque/listagem" var="destaque"/><a class="pagina" href="${destaque}">Destaques</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li> <c:url value="/usuario/listagem" var="usuario"/><a class="pagina" href="${usuario}">Usu&aacute;rios</a></li>
        <li> <c:url value="/configuracao/listagem" var="config"/><a href="${config}">Configura&ccedil;&otilde;es</a></li>
      </ul>
    </div>
    
  </div>
</div>
    
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div id="content" class="panel panel-warning">
      <div class="panel-heading">
        <h3 id="titulo" class="panel-title"></h3>
      </div>
      <div id="conteudo" class="panel-body">
      </div>
    </div>
</div>
          
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<c:out value="${pageContext.request.contextPath}/resources/jquery/js/jquery-2.1.0.min.js"/>"></script>
<script src="<c:out value="${pageContext.request.contextPath}/resources/jquery/js/jquery-ui-1.10.4.custom.min.js"/>"></script>
<script src="<c:out value="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:out value="${pageContext.request.contextPath}/resources/extras/js/docs.min.js"/>"></script>
<script src="<c:out value="${pageContext.request.contextPath}/resources/extras/js/jquery.md5.min.js"/>"></script>

<script>
$(document).ready(function(){
	$("#content").hide();
});

function open(url) {
	$.ajax({
		type: "GET",
		url: url
	}).done(function( data ) {
		var $temp  = $('<div/>', {html:data});
		var titulo = $temp.find('title').text();
		var conteudo = $temp.remove('head').html();
		$("#titulo").empty();
		$("#conteudo").empty();
		$("#titulo").text(titulo);
		$("#conteudo").html(conteudo);
		$("#content").show();
	});
}
  
$(document).on('click', '.link', function (event) {
	event.preventDefault();
	var action = $(this).data('action');
	open(action);
});

$(document).on('click', '.pagina', function(event){
	event.preventDefault();
    var link = $(this).attr('href');
    open(link);
});
</script>

</body>
</html>
