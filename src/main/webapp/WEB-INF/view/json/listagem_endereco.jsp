<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
	<json:array name="endereco" var="item" items="${lista}">
		<json:object>
				<json:property name="id" value="${item.id}"/>
				<json:property name="logradouro" value="${item.logradouro}"/>
				<json:property name="numero" value="${item.numero}"/>
				<json:property name="complemento" value="${item.complemento}"/>
				<json:property name="bairro" value="${item.bairro}"/>
				<json:property name="cidade" value="${item.cidade}"/>
				<json:property name="estado" value="${item.estado}"/>
				<json:property name="cep" value="${item.cep}"/>
		</json:object>
	</json:array>
</json:object>