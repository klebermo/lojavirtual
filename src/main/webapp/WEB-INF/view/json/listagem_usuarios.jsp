<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
<json:array name="usuario" var="item" items="${lista}">
	  <json:object>
	     <json:property name="id" value="${item.id}"/>
	     <json:property name="login" value="${item.login}"/>
	     <json:property name="pnome" value="${item.first_name}"/>
	     <json:property name="unome" value="${item.last_name}"/>
	     <json:property name="email" value="${item.email}"/>
	  </json:object>
</json:array>
</json:object>
