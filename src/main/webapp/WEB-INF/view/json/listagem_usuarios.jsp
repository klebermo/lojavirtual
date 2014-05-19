<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<json:object>

  <c:forEach var="item" items="${lista}">
	  <json:object name="usuario">
	 	 <json:property name="id" value="${item.id}"/>
	     <json:property name="login" value="${item.login}"/>
	     <json:property name="pnome" value="${item.first_nome}"/>
	     <json:property name="unome" value="${item.last_name}"/>
	     <json:property name="email" value="${item.email}"/>
	  </json:object>
  </c:forEach>

</json:object>
