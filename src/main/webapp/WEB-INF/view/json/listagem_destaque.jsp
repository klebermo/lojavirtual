<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
	<json:array name="destaque" var="item" items="${lista}">
		<json:object>
				<json:property name="id" value="${item.id}"/>
				<json:property name="categoria" value="${item.categoria.id}"/>
				<json:property name="num_produtos" value="${item.produtos.size}"/>
		</json:object>
	</json:array>
</json:object>
