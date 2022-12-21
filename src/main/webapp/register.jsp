
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${curUser != null }">
<c:redirect url="${header.host }" />
</c:if>

<c:import url="header.jsp">
	<c:param name="title" value="Register page" />
</c:import>

<!-- main -->
<div class="container">
<div class="modal-content center my-shadow">
	<div class="modal-header">
		<h2 class="modal-title">Đăng ký tài khoản</h2>
	</div>
	<div class="modal-body">
		<form id="account" method="post" action="register">
			<input type="hidden" name="action" value="register" />
			<div class="error-text">${message }</div>
			
			<div class="group-input">
				<input type="text" placeholder="Nhập tên của bạn"
					class="form-control" id="name" name="name" value="${name }"/>
				<div class="error-text"></div>
			</div>
			<div class="group-input">
				<input type="text" placeholder="Nhập email của bạn"
					class="form-control" id="email" name="email" value="${email }"/>
				<div class="error-text"></div>
			</div>
			<div class="group-input">
				<input type="password" placeholder="Nhập mật khẩu"
					class="form-control" id="password" name="password" />
				<div class="error-text"></div>
			</div>
			<div class="group-input">
				<input type="password" placeholder="Nhập lại mật khẩu"
					class="form-control" id="confirm-password" name="confirmPassword" />
				<div class="error-text"></div>
			</div>
			<button type="submit" class="btn btn-block bg-red" id="btn-submit">ĐĂNG
				KÝ</button>
		</form>
	</div>
	<p class="modal-devider-text">
		<span>Hoặc</span>
	</p>
	<div class="modal-footer">
		<span style="color:#777;">Bạn đã có tài khoản? </span><a href="login">Đăng nhập ngay</a>
	</div>
</div>
</div>

<!-- footer -->
<%@ include file="footer.jsp"%>
<script src="js/member.js"></script>