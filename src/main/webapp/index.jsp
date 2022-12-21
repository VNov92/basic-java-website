<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="header.jsp">
	<c:param name="title"
		value="YeuDienThoai - Điện thoại di động, phụ kiện chính hãng" />
</c:import>

<sql:setDataSource var="ds" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/ShoppingDB" user="admin1" password="12345678"></sql:setDataSource>
<sql:transaction dataSource="${ds }">
	<sql:query var="results">
		select * from products limit 5
	</sql:query>
</sql:transaction>

<!-- main -->
<div class="container">
	<div class="my-homepage">
		<h1 hidden="hidden">YeuDienThoai - Điện thoại di động, phụ kiện
			chính hãng</h1>
		<div class="block-top flex-row margin-bottom-16">
			<div class="top-menu hide-medium">
				<div class="menu-wrapper my-shadow">
					<div class="menu-tree flex-col">
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
			<div class="top-main-banner ">
				<div class="block-top-banner flex-col my-shadow margin-left-15">
					<div class="my-banner-img ">
						<img src="media/images/khai-truong-mnam-sliding.png"
							alt="banner-1" />
					</div>
					<div class="my-banner-text ">
						<div class="slide flex-row">
							<c:forEach var="item" begin="1" end="5">							
								<div class="flex-row"><p>Banner ${item }</p></div>							
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="top-right-banner margin-left-15 hide-large">
				<div class="flex-col">
					<a href="#" class=" fake-banner my-shadow">
						<img src="https://cdn2.cellphones.com.vn/690x300/https://dashboard.cellphones.com.vn/storage/Fold3.png" alt="dien thoai samsung fold3" />
					</a>
					<a href="#" class=" fake-banner my-shadow">
						<img src="https://cdn2.cellphones.com.vn/690x300/https://dashboard.cellphones.com.vn/storage/iphone-14-right.png" alt ="dien thoai iphone 14" />
					</a>
					<a href="#" class=" fake-banner my-shadow">
						<img src="https://cdn.hoanghamobile.com/i/home/Uploads/2022/11/01/sanphamhot-12-lite-1.jpg" alt="laptop msi" />
					</a>
				</div>
			</div>
		</div>
		<div class="catalogue-block margin-bottom-16 show-small">
			<div class="product-title">
				<h2>Danh mục</h2>
			</div>
			<div class="catalogue flex-row">
				<a href="mobile?brand=apple" class="card my-shadow">
					<img src="https://cdn.hoanghamobile.com/i/cat/Uploads/2022/09/07/logoooooooooooooooo.png"
					alt="apple logo" />
				</a>
				<a href="mobile?brand=samsung" class=" card my-shadow">
					<img src="https://cdn.hoanghamobile.com/i/cat/Uploads/2020/11/30/samsung-logo-transparent.png"
					alt="samsung logo" />
				</a>
				<a href="mobile?brand=xiaomi" class=" card my-shadow">
					<img src="https://cdn.hoanghamobile.com/i/cat/Uploads/2021/05/27/xiaomi-global-logo-rgb-logo-moi.png"
					alt="xiaomi logo" />
				</a>
				<a href="mobile?brand=oppo" class=" card my-shadow">
					<img src="https://cdn.hoanghamobile.com/i/cat/Uploads/2020/09/14/brand%20(3).png"
					alt="oppo logo" />
				</a>
				<a href="mobile?brand=nokia" class=" card my-shadow">
					<img src="https://cdn.hoanghamobile.com/i/cat/Uploads/2020/09/14/brand%20(4).png"
					alt="nokia logo" />
				</a>
			</div>
		</div>
		<div class="my-hotsale margin-bottom-16">
			<div class="hotsale-title">HOT SALE</div>
			<div class="hotsale-content flex-row">
				<c:forEach var="item" items="${results.rows }">
					<div class="card my-shadow">
						<a href="mobile?brand=${item.product_brand }&id=${item.product_id}" class="product-link">
							<div class="product-image"><img src="${item.product_img_source }" alt="${item.product_name }" loading="lazy"/></div>
							<div class="product-name"><h4>${item.product_name }</h4></div>
							<div class="product-price"><h4><fmt:formatNumber type="currency" value="${item.product_price*1000000 }" currencySymbol="đ"/></h4></div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="my-featured-product margin-bottom-16">
			<div class="product-title flex-row">
				<div class="">
					<h2>TRENDING SMARTPHONE</h2>
				</div>
				<div class="control-slide">
					<button class="left">
						&#8249;
					</button>
					<button class="right">
						&#8250;
					</button>
				</div>
			</div>
			<div class="featured-product-content flex-row">
				<c:forEach var="item" items="${results.rows }">
					<div class="card my-shadow">
						<a href="mobile?brand=${item.product_brand }&id=${item.product_id}" class="product-link">
							<div class="product-image"><img src="${item.product_img_source }" alt="${item.product_name }" loading="lazy"/></div>
							<div class="product-name"><h4>${item.product_name }</h4></div>
							<div class="product-price"><h4><fmt:formatNumber type="currency" value="${item.product_price*1000000 }" currencySymbol="đ"/></h4></div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>		
	</div>
</div>

<!-- footer -->
<c:import url="footer.jsp"></c:import>