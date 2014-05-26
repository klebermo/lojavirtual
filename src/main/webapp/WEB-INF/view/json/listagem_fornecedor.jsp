<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
	<json:array name="fornecedor" var="item" items="${lista}">
		<json:object>
				<json:property name="id" value="${item.id}"/>
				<json:property name="nome" value="${item.nome}"/>
				<json:property name="website" value="${item.website}"/>
		</json:object>
	</json:array>
</json:object>