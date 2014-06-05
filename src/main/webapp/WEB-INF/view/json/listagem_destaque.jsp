<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
	<json:array name="item" var="item" items="${lista}">
		<json:object>
				<json:property name="id" value="${item.id}"/>
				<json:property name="categoria" value="${item.categoria}"/>
				<json:array name="produtos" var="item" items="${destaque.produtos}">
					<json:property name="id" value="${item.id}"/>					
				</json:array>
		</json:object>
	</json:array>
</json:object>
