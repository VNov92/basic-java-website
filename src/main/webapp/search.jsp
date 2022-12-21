<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:import url="header.jsp">
	<c:param name="title"
		value="Kết quả tìm kiếm cho: &quot;${param.s }&quot;" />
</c:import>

<div class="container">
	<div class="title text-center">
		<h1>Tìm thấy ${countResult } cho từ khoá '${param.s }'</h1>
	</div>
	
	<div class="products-list">
		<div class="flex-row">
			<c:forEach var="item" items="${listProduct }">
				<div class="card my-shadow">
					<a href="mobile?brand=${item.brand}&id=${item.id }" class="product-link">
						<div class="product-image"><img src="${item.src }" alt="${item.name }" loading="lazy"/></div>
						<div class="product-name"><h4>${item.name }</h4></div>
						<div class="product-price"><h4><fmt:formatNumber type="currency" value="${item.price*1000000 }" currencySymbol="đ"/></h4></div>
					</a>
				</div>
			</c:forEach>		
		</div>
	</div>
	
	<c:if test="${noOfPages > 1 }">
	<nav>
		<ul class="pagination">
			<li class="page-item <c:if test="${param.page == null || currentPage <=1 }">disabled</c:if>">
		      <a class="page-link" href="${request.requestURI }?s=${param.s }&page=${currentPage-1 }" tabindex="-1">Trước</a>
		    </li>
		    <c:forEach begin="1" end="${noOfPages }" var="i">
			    <li class="page-item <c:if test="${currentPage eq i }">active</c:if>">
			    	<a class="page-link" href="${request.requestURI }?s=${param.s }&page=${i}">${i }</a>
			    </li>		    	
		    </c:forEach>
		    <li class="page-item <c:if test="${currentPage >= noOfPages }">disabled</c:if>">
		      <a class="page-link" href="${request.requestURI }?s=${param.s }&page=${currentPage+1 }">Sau</a>
		    </li>
		</ul>
	</nav>
	</c:if>
</div>

<c:import url="footer.jsp"></c:import>