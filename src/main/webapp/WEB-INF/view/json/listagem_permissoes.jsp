<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<json:object>
	<json:object name="permissoes">
		<c:forEach var="item" items="${lista}">
			<json:property name="${item.id}" value="${item.nome}"/>
		</c:forEach>
	</json:object>
</json:object>