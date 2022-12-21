<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:import url="header.jsp">
	<c:param name="title"
		value="${product.name }" />
</c:import>

<%!
  HttpSession session;
%>

<%
  session = request.getSession(true);
  String url = "";
  if (session == null) {
    out.print("\nSession is null!<p>");
  }
  if(session != null){
	url = request.getContextPath() + "/cart?action=add&id=" + request.getParameter("id") ; 
    url = response.encodeURL(url);
  }

%>

<div class="container">
	<div class="title">
		<h1>${product.name }</h1>
	</div>
	
	<hr />
	
	<div class="product-detail flex-row">
		<div class="product-detail_img">
			<img src="${product.src }" alt="${product.name }" />
		</div>
		
		<div class="product-detail_content">
			<h2><fmt:formatNumber currencySymbol="VNĐ" type="currency" value="${product.price*1000000 }" /></h2>
			<pre>${product.des }</pre>
			<a href="<%=url %>" class="btn btn-buy">Add to cart</a>
		</div>
	</div>
</div>

<c:import url="footer.jsp"></c:import>