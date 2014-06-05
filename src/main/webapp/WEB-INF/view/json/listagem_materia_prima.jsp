<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
	<json:array name="itema" var="item" items="${lista}">
		<json:object>
				<json:property name="id" value="${item.id}"/>
				<json:property name="nome" value="${item.descricao.nome}"/>
				<json:property name="descricao" value="${item.descricao.descricao}"/>
				<json:property name="fornecedor" value="${item.descricao.fornecedor.razao_social}"/>
				<json:property name="quantidade" value="${item.quantidade.quantidade}"/>
				<json:property name="unidade" value="${item.quantidade.unidade}"/>
				<json:property name="custo" value="${item.quantidade.custo}"/>
		</json:object>
	</json:array>
</json:object>
