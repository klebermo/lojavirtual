<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
	<json:array name="promocao" var="item" items="${lista}">
		<json:object>
				<json:property name="id" value="${item.id}"/>
				<json:property name="promocao" value="${item.nome}"/>
				<json:property name="desconto" value="${item.desconto}"/>
		</json:object>
	</json:array>
</json:object>