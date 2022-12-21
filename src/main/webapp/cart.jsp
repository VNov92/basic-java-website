<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="header.jsp">
	<c:param name="title" value="Cart page" />
</c:import>

<%! HttpSession session;%>
<%
	session = request.getSession(true);
	if(session == null){
		
	}
%>

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
					<p>Giỏ hàng</p>
				</div>

				<div class="cart-content">
					<c:forEach var="item" items="${cart.items }">
					<div class="box-box">
						<div class="cart-item flex-row card my-shadow mt-1">
							<div class="cart-item-img">
								<img src="${item.src }" alt="${item.name }" />
							</div>
							<div class="cart-item-detail">
								<p class="product-title">${item.name }</p>
								<p class="product-price">
									<fmt:formatNumber currencySymbol="đ" type="currency"
										value="${item.price*1000000 }" />
								</p>
								<div class="flex-row">
									<p>Chọn số lượng: </p>
									<input type="text" readonly="readonly" value="${item.number }"/>
								</div>
							</div>
						</div>
						<a href="cart?action=delete&id=${item.id }" class="delete-item">
							<svg data-v-39dc3aec="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" class="svg-inline--fa fa-times"><path data-v-39dc3aec="" fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z" class=""></path></svg>
						</a>
					</div>
					</c:forEach>

				</div>

				<div class="cart-checkout card mt-1">
					<div class="total-money flex-row">
						<p>Thành tiền</p>
						<p><fmt:formatNumber currencySymbol="đ" type="currency" value="${cart.amount*1000000 }"></fmt:formatNumber></p>
					</div>
					<a href="${pageContext.request.contextPath }/checkout.jsp" class="btn btn-block bg-red br-25">Đặt hàng</a> <a
						href="./" class="btn btn-block bg-white br-25">Chọn thêm sản
						phẩm khác</a>
				</div>
			</c:when>
		</c:choose>
	</div>
</div>

<c:import url="footer.jsp"></c:import>