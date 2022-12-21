
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${curUser != null }">
<c:redirect url="${header.host }" />
</c:if>

<c:import url="header.jsp">
	<c:param name="title" value="Login page" />
</c:import>

<%
Cookie[] cookies = request.getCookies();
String emailVal = "", passwordVal = "", rememberVal = "";

if(cookies != null) {
	for(Cookie cookie: cookies){
		if (cookie.getName().equals("cookEmail")){
			emailVal = cookie.getValue();
		}
		if (cookie.getName().equals("cookPassword")){
			passwordVal = cookie.getValue();
		}
		if (cookie.getName().equals("cookRemember")){
			rememberVal = cookie.getValue();
		}
	}
}
if (request.getParameter("email") != null){
	emailVal = request.getParameter("email");
	passwordVal = "";
	rememberVal = "";
}

%>
<!-- main -->
<div class="container">
<div class="modal-content center my-shadow">
	<div class="modal-header">
		<h2 class="modal-title">Đăng nhập</h2>
	</div>
	<div class="modal-body">
		<form id="account" method="post" action="login">
			<input type="hidden" name="action" value="login" />
			<div class="error-text">${message }</div>
			<div class="group-input">
				<input type="text" placeholder="Nhập email của bạn"
					class="form-control" id="email" name="email" value="<%= emailVal %>"/>
				<div class="error-text"></div>
			</div>
			<div class="group-input">
				<input type="password" placeholder="Nhập mật khẩu"
					class="form-control" id="password" name="password" value="<%=passwordVal %>"/>
				<div class="error-text"></div>
			</div>
			<button type="submit" class="btn btn-block bg-red group-input" id="btn-submit">ĐĂNG
				NHẬP</button>
			<div class="remember">
				<label>
					<input type="checkbox" name="remember" value="1" <%= "1".equals(rememberVal) ? "checked=\"checked\"" : "" %> />Nhớ tài khoản
				</label>
			</div>
		</form>
	</div>
	<p class="modal-devider-text">
		<span>Hoặc</span>
	</p>
	<div class="modal-footer">
		<span style="color:#777;">Bạn chưa có tài khoản? </span><a href="register">Đăng ký ngay</a>
	</div>
</div>
</div>

<!-- footer -->
<%@ include file="footer.jsp"%>
<script src="js/member.js"></script>