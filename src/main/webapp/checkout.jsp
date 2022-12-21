<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="header.jsp">
	<c:param name="title" value="Checkout page" />
</c:import>

<div class="container">
	<div class="cart">	
		<c:choose>
			<c:when test="${cart == null || cart.isEmpty() }">
				<div class="nothing-in-cart">
					<div class="center flex-col">
						<p>Không có sản phẩm nào trong giỏ hàng, vui lòng quay lại.</p>
						<a href="./" class="btn bg-red">Quay lại trang chủ</a>
					</div>
				</div>
			</c:when>
			<c:when test="${cart != null && !cart.isEmpty() }">
				<div class="cart-title flex-row mt-1">
					<p>Thông tin liên hệ của bạn</p>
				</div>
				
				<form action="Checkout" method="post">
				<div class="cart-content mt-1 card my-shadow">
					<div class="error-text"></div>
					<div class="group-input">
						<input type="text" placeholder="Nhập tên của bạn"
							class="form-control" id="customer_name" name="customer_name" value=""/>
						<div class="error-text"></div>
					</div>
					<div class="group-input">
						<input type="text" placeholder="Nhập số điện thoại của bạn"
							class="form-control" id="customer_phone" name="customer_phone" value=""/>
						<div class="error-text"></div>
					</div>
					<div class="">
						<input type="text" placeholder="Nhập địa chỉ nhận hàng của bạn"
							class="form-control" id="customer_address" name="customer_address" value=""/>
						<div class="error-text"></div>
					</div>
				</div>

				<div class="cart-checkout card mt-1">
					<div class="total-money flex-row">
						<p>Thành tiền</p>
						<p><fmt:formatNumber currencySymbol="đ" type="currency" value="${cart.amount*1000000 }"></fmt:formatNumber></p>
					</div>
					<button type="submit" class="btn btn-block bg-red br-25">Đặt hàng</button> <a
						href="${pageContext.request.contextPath }" class="btn btn-block bg-white br-25">Chọn thêm sản
						phẩm khác</a>
				</div>
				</form>
			</c:when>
		</c:choose>
	</div>
</div>

<c:import url="footer.jsp"></c:import>