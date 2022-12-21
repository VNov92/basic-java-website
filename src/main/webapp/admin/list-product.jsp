<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:if test="${curUser == null || curUser.role != 2 }">
	<c:redirect url="${header.host }"></c:redirect>
</c:if>

<c:import url="/admin/header.jsp">
	<c:param name="title" value="Products page" />
	<c:param name="active" value="products" />
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


<div class="products-list">
	<h1 class="title">
		Hiển thị ${perpage } trong số ${count } sản phẩm
	</h1>
	<div class="flex-row">
		<c:forEach var="item" items="${list }">
			<div class="card my-shadow">
				<a href="${pageContext.request.contextPath }/mobile?brand=${item.brand}&id=${item.id }" class="product-link">
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
</div>

<c:if test="${noOfPages > 1 }">
	<nav>
		<ul class="pagination">
			<li
				class="page-item <c:if test="${param.page == null || currentPage <=1 }">disabled</c:if>">
				<a class="page-link"
				href="${request.requestURI }?brand=${param.brand }&page=${currentPage-1 }"
				tabindex="-1">Trước</a>
			</li>
			<c:forEach begin="1" end="${noOfPages }" var="i">
				<li
					class="page-item <c:if test="${currentPage eq i }">active</c:if>">
					<a class="page-link"
					href="${request.requestURI }?brand=${param.brand }&page=${i}">${i }</a>
				</li>
			</c:forEach>
			<li
				class="page-item <c:if test="${currentPage >= noOfPages }">disabled</c:if>">
				<a class="page-link"
				href="${request.requestURI }?brand=${param.brand }&page=${currentPage+1 }">Sau</a>
			</li>
		</ul>
	</nav>
</c:if>


<c:import url="/admin/footer.jsp" />