
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="header.jsp">
	<c:param name="title" value="Confirmation page" />
</c:import>

<!-- main -->
<div class="modal-content center">
	<h1>Order Submitted Successfully!</h1>
	<p>Thank you for your order. Your order confirmation number is: <b>${cart.orderID }</b></p>
	<p>Please use this number when calling to check on your order.</p>
</div>

<!-- footer -->
<%@ include file="footer.jsp"%>
<script src="js/member.js"></script>