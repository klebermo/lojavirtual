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
    <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}/resources/extras/css/zebra_dialog.css"/>" type="text/css">

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
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Profile</a></li>
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
            <li> <a href="#">Overview</a></li>
            <li><a href="#">Produtos</a></li>
            <li><a href="#">Categorias</a></li>
            <li><a href="#">Promo&ccedil;&otilde;es</a></li>
            <li><a href="#">Destaques</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li> <c:url value="/usuario/listagem.htm" var="usuario"/><a href="[${usuario}]">Usu&aacute;rios</a></li>
            <li><a href="#">Configura&ccedil;&otilde;es</a></li>
          </ul>
        </div>
        
       </div>
      </div>
      
      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div id="content" class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title"></h3>
            </div>
            <div class="panel-body">
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
    <script src="<c:out value="${pageContext.request.contextPath}/resources/extras/js/zebra_dialog.js"/>"></script>
    <script src="<c:out value="${pageContext.request.contextPath}/resources/extras/js/jquery.md5.min.js"/>"></script>
    
    <script>
    $(document).ready(function(){
    	$("#content").hide();
    });
    
    function limpa_conteudo() {
    	$("#content").hide();
    	$(".panel-heading").remove();
    	$(".panel-body").remove();
    	$("#content").append('<div class="panel-heading"><h3 class="panel-title"></h3></div>');
    	$("#content").append('<div class="panel-body"></div>');
    	$("#content").show();
    }
    
    $('a').click(function(e){
        var link = $(this).attr('href');
        
        if(link == '#') {
        	e.preventDefault();
        	limpa_conteudo();
        	$("#content").hide();
        }
        else {
            var tam = link.length;
            var primeiraLetra = link.charAt(0);
            var ultimaLetra = link.charAt(tam-1);
            var result = link.substr(1, tam-2);
            
            if(primeiraLetra == '[' && ultimaLetra == ']') {
              e.preventDefault();
              
              $.get(result, function(data){
        		  var $temp  = $('<div/>', {html:data});
        		  var titulo = $temp.find('title').text();
        		  var conteudo = $temp.remove('head').html();
        		  limpa_conteudo();
        		  $(".panel-title").text(titulo);
        		  $(".panel-body").html(conteudo);
        		  $("#content").show();
              });
            }
        }
    });
    </script>
  </body>
</html>
