<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard Template for Bootstrap</title>

    <!-- Jquery core CSS -->
    <link href="<c:out value="${pageContext.request.contextPath}/resources/jquery/css/ui-lightness/jquery-ui-1.10.4.custom.min.css"/>" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="<c:out value="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:out value="${pageContext.request.contextPath}/resources/extras/css/dashboard.css"/>" rel="stylesheet">

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
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li> <c:url value="/logout" var="logoutUrl"/> <a href="${logoutUrl}">Logout</a> </li>
            <li><a href="#"><c:out value="${pageContext.request.remoteUser}"/></a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row">
      
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview</a></li>
            <li><a href="#">Produtos</a></li>
            <li><a href="#">Categorias</a></li>
            <li><a href="#">P&aacute;ginas</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="#">Promo&ccedil;&otilde;es</a></li>
            <li><a href="#">Destaques</a></li>
            <li><a href="#">Combos</a></li>
            <li><a href="#">Parceiros</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="#">Usu&aacute;rios</a></li>
            <li><a href="#">Temas</a></li>
            <li><a href="#">Configura&ccedil;&otilde;es</a></li>
          </ul>
        </div>
        
       </div>
      </div>
      
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:out value="${pageContext.request.contextPath}/resources/jquery/js/jquery-2.1.0.min.js"/>"></script>
    <script src="<c:out value="${pageContext.request.contextPath}/resources/jquery/js/jquery-ui-1.10.4.min.js"/>"></script>
    <script src="<c:out value="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<c:out value="${pageContext.request.contextPath}/resources/extra/js/docs.min.js"/>"></script>
  </body>
</html>
