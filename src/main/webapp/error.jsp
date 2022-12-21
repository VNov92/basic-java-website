<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="header.jsp">
	<c:param name="title"
		value="Error pages" />
</c:import>

<div class="container">
<div>
${err }
</div>
</div>

<c:import url="footer.jsp"></c:import>