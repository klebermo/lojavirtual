<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
	<json:array name="item" var="item" items="${lista}">
		<json:object>
				<json:property name="id" value="${item.id}"/>
				<json:property name="razao_social" value="${item.razao_social}"/>
				<json:property name="cpf" value="${item.cpf}"/>
				<json:property name="cnpj" value="${item.cnpj}"/>
				<json:property name="website" value="${item.website}"/>
		</json:object>
	</json:array>
</json:object>