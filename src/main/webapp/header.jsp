<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>${param.title }</title>
<link rel="stylesheet" href="css/mystyle.css" />
</head>
<body>
	<header class="header fixed-top">
		<div class="block-header container">
			<nav class="navbar">
				<a href="." class="navbar-logo"> <img
					src="media/logo/design_4161130.png" alt="logo website" width="60"
					height="60" />
				</a>
				<div class="header-menu-btn btn-menu flex-row hide-small">
					<svg height="20" width="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 26.99 26.99"><defs><style>.cls-1 {
                    fill: none;
                    stroke: #fff;
                    stroke-linecap: round;
                    stroke-linejoin: round;
                    stroke-width: 1.8px;
                  }</style></defs> <g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1"><line x1="7.06" y1="7.52" x2="19.92" y2="7.52" class="cls-1"></line> <line x1="7.06" y1="13.49" x2="19.92" y2="13.49" class="cls-1"></line> <line x1="7.06" y1="19.47" x2="11.95" y2="19.47" class="cls-1"></line> <rect x="0.9" y="0.9" width="25.19" height="25.19" rx="4.71" class="cls-1"></rect></g></g></svg>
					<span>Danh mục</span>
				</div>
				<div class="header-menu">
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

				<div>
					<form id="header-search" method="get" action="search">
						<div class="flex-row br-25">
							<button type="submit" class="bg-white">
								<svg height="20" width="20" aria-hidden="true" focusable="false"
									role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
									<path fill="currentColor"
										d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path></svg>
							</button>
							<input type="search" name="s" placeholder="Hôm nay bạn cần tìm gì?" value="${param.s }"  required/>
						</div>
					</form>

				</div>
				<a href="cart.jsp" class="btn-menu flex-row" id="header-cart">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28.95 35.07" width="20" height="20"><defs><style>.cls-1 {
                    fill: none;
                    stroke: #fff;
                    stroke-linecap: round;
                    stroke-linejoin: round;
                    stroke-width: 1.8px;
                  }</style></defs> <g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1"><path d="M10,10.54V5.35A4.44,4.44,0,0,1,14.47.9h0a4.45,4.45,0,0,1,4.45,4.45v5.19" class="cls-1"></path> <path d="M23.47,34.17h-18A4.58,4.58,0,0,1,.91,29.24L2.5,8.78A1.44,1.44,0,0,1,3.94,7.46H25a1.43,1.43,0,0,1,1.43,1.32L28,29.24A4.57,4.57,0,0,1,23.47,34.17Z" class="cls-1"></path></g></g></svg>
					<span>Giỏ hàng</span>
				</a>
				
				<c:if test="${curUser == null }">
				<a href="login" class="btn-menu flex-row" id="header-login">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 560 560" width="20"><defs><style>#icon-smember .cls-1 {
                fill: none;
                stroke: #fff;
                stroke-width: 30px;
              }</style></defs><g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1"><circle cx="280" cy="280" r="265" class="cls-1"></circle> <circle cx="280" cy="210" r="115" class="cls-1"></circle> <path d="M86.82,461.4C124.71,354.71,241.91,298.93,348.6,336.82A205,205,0,0,1,473.18,461.4" class="cls-1"></path></g></g></svg>
					<span>Đăng nhập</span>				
				</a>
				</c:if>
				
				<c:if test="${curUser != null}">
				<button class="flex-row btn-menu" id="header-user">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 560 560" width="20"><defs><style>#icon-smember .cls-1 {
	                fill: none;
	                stroke: #fff;
	                stroke-width: 30px;
	              }</style></defs>  <g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1"><circle cx="280" cy="280" r="265" class="cls-1"></circle> <circle cx="280" cy="210" r="115" class="cls-1"></circle> <path d="M86.82,461.4C124.71,354.71,241.91,298.93,348.6,336.82A205,205,0,0,1,473.18,461.4" class="cls-1"></path></g></g></svg>
					<span>${curUser.name }</span>
				</button>
				</c:if>

				<!-- Member -->
				<div id="option-member">
					<div class="popup-wrapper">
						<div class="popup-content flex-row">
						<c:if test="${curUser != null && curUser.role == 2 }">
							<a href="admin/dashboard.jsp" class="btn bg-white ml-1">Đến dashboard</a>
						</c:if>
							<a href="logout" class="btn bg-white ml-1">Thoát tài khoản</a>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</header>

	<div class="overlay"></div>
	<div class="clear-header"></div>