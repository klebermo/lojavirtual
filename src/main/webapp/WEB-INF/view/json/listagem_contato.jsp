<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
	<json:array name="item" var="item" items="${lista}">
		<json:object>
				<json:property name="id" value="${item.id}"/>
				<json:property name="nome" value="${item.nome}"/>
				<json:property name="email" value="${item.email}"/>
				<json:property name="telefone" value="${item.telefone}"/>
		</json:object>
	</json:array>
</json:object>