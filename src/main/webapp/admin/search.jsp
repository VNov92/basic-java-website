<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${curUser == null || curUser.role != 2 }">
	<c:redirect url="${header.host }"></c:redirect>
</c:if>

<c:import url="/admin/header.jsp">
	<c:param name="title"
		value="Kết quả tìm kiếm mã sản phẩm: &quot;${param.s }&quot;" />
</c:import>

<div class="search-box">
	<form method="get" action="Search">
		<div class="flex-row">
			<button type="submit" class="bg-white">
				<svg height="15" aria-hidden="true" focusable="false" role="img"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
									<path fill="currentColor"
						d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path></svg>
			</button>
			<input type="search" name="s" placeholder="Tìm kiếm mã sản phẩm"
				value="${param.s }" required />
		</div>
	</form>
</div>

<div class="title text-center mt-1">
	<h1>Tìm thấy ${countResult } mã sản phẩm '${param.s }'</h1>
</div>

<div class="container-relative mt-1">
	<c:forEach var="item" items="${listProduct }">
		<div class="product-detail card my-shadow center">
			<a href="mobile?brand=${item.brand}&id=${item.id }"
				class="product-link">
				<div class="product-image">
					<img src="${item.src }" alt="${item.name }" loading="lazy" />
				</div>
				<div class="product-name">
					<h4>${item.name }</h4>
				</div>
				<div class="product-price">
					<h4>
						<fmt:formatNumber type="currency" value="${item.price*1000000 }"
							currencySymbol="đ" />
					</h4>
				</div>
			</a>
		</div>
	</c:forEach>
</div>


<c:import url="/admin/footer.jsp"></c:import>