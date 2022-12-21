<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:if test="${curUser == null || curUser.role != 2 }">
	<c:redirect url="${header.host }"></c:redirect>
</c:if>

<c:import url="/admin/header.jsp">
	<c:param name="title" value="Options page" />
	<c:param name="active" value="options" />
</c:import>

<c:import url="/admin/footer.jsp"></c:import>