<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="header.jsp">
	<c:param name="title" value="${title }" />
</c:import>

<div class="container">
	<div class="block-banner flex-row">
		<div>
			<img
				src="https://cdn2.cellphones.com.vn/595x/https://dashboard.cellphones.com.vn/storage/cate-flip-th11.jpg"
				alt="dien thoai samsung" loading="lazy" />
		</div>
		<div>
			<img
				src="https://cdn2.cellphones.com.vn/595x/https://dashboard.cellphones.com.vn/storage/cate-bf-ip-13.png"
				alt="dien thoai iphone gia tot black friday" loading="lazy" />
		</div>
	</div>

	<div id="brands-menu-btn" class="btn-menu bg-red flex-row show-small mt-1">
		<svg height="20" width="20" xmlns="http://www.w3.org/2000/svg"
			viewBox="0 0 26.99 26.99">
			<defs>
			<style>
				.cls-1 {
					fill: none;
					stroke: #fff;
					stroke-linecap: round;
					stroke-linejoin: round;
					stroke-width: 1.8px;
				}
				</style></defs> <g id="Layer_2" data-name="Layer 2">
							<g id="Layer_1-2" data-name="Layer 1">
							<line x1="7.06" y1="7.52" x2="19.92" y2="7.52" class="cls-1"></line> <line
								x1="7.06" y1="13.49" x2="19.92" y2="13.49" class="cls-1"></line> <line
								x1="7.06" y1="19.47" x2="11.95" y2="19.47" class="cls-1"></line> <rect
								x="0.9" y="0.9" width="25.19" height="25.19" rx="4.71" class="cls-1"></rect></g></g></svg>
		<span>Danh mục</span>
	</div>
	<div id="brands-menu">
		<div class="menu-wrapper my-shadow">
			<div class="menu-tree br-25">
				<a href="mobile?brand=apple" class="menu-link"> Apple </a> <a
					href="mobile?brand=samsung" class="menu-link"> Samsung </a> <a
					href="mobile?brand=oppo" class="menu-link"> Oppo </a> <a
					href="mobile?brand=xiaomi" class="menu-link"> Xiaomi </a> <a
					href="mobile?brand=nokia" class="menu-link"> Nokia </a> <a
					href="javascript: void(0)" class="menu-link">
					<div class="flex-row">
						<div>Phụ kiện</div>
						<div>
							<svg height="15" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 320 512">
											<path
									d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"></path></svg>
						</div>

					</div>
				</a>
			</div>
		</div>
	</div>

	<div class="products-list">
		<h1 class="title">
			<c:out value="${title }" />
		</h1>
		<div class="flex-row">
			<c:forEach var="item" items="${list }">
				<div class="card my-shadow">
					<a href="?brand=${item.brand}&id=${item.id }" class="product-link">
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
</div>


<c:import url="footer.jsp"></c:import>