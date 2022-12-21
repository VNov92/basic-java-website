<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:if test="${curUser == null || curUser.role != 2 }">
	<c:redirect url="${header.host }"></c:redirect>
</c:if>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta
	name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"
/>
<title>${param.title }</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/admin.css" />
</head>
<body id="${param.active }">
 <!-- Page content -->
 <div class="container flex-row">
  <nav id="sidebar">
   <h1><a href="${pageContext.request.contextPath }/admin/dashboard.jsp" class="logo">Dashboard</a></h1>
   <ul class="list-unstyled components">
    <li class="" data-active="dashboard">
     <a href="${pageContext.request.contextPath }/admin/dashboard.jsp">Home</a>
    </li>
    <li  data-active="products">
     <a href="${pageContext.request.contextPath }/ProductsController">Products</a>
    </li>
    <li  data-active="options">
     <a href="${pageContext.request.contextPath }/admin/options.jsp">Options</a>
    </li>
   </ul>
  </nav>
  <div id="content">
 <button class="bg-dark openbtn show-medium" >☰ Open Sidebar</button>