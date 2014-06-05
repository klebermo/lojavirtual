<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>Signin Template for Bootstrap</title>

<link href="${pageContext.servletContext.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/resources/extras/css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <c:url value="/login" var="loginUrl"/>
      <form class="form-signin" role="form" method="post" action="${loginUrl}">
        <h2 class="form-signin-heading">Credenciais</h2>
        <input type="text" class="form-control" name="login" placeholder="Login" required autofocus>
        <input type="password" class="form-control" name="senha" placeholder="Senha" required>
        <label class="checkbox">
          <input type="checkbox" value="lembrete"> Lembrar meus dados
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
      </form>
      
      <c:if test="${erro eq 'login'}">
      <div class="alert alert-danger">
        <strong>Erro!</strong> Credenciais inv&aacute;lidas.
      </div>
      </c:if>
      
      <c:if test="${erro eq 'no_permit'}">
      <div class="alert alert-danger">
        <strong>Erro!</strong> Acesso n&atilde;o autorizado.
      </div>
      </c:if>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
