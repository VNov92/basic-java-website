<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<c:if test="${curUser == null || curUser.role != 2 }">
	<c:redirect url="${header.host }"></c:redirect>
</c:if>  

<c:import url="/admin/header.jsp">
	<c:param name="title" value="Dashboard" />
	<c:param name="active" value="dashboard" />
</c:import>
  
   <!-- Image hero -->
   <div class="hero-image">
    <div class="hero-text">
     <h1>Xin chào ${curUser.name }</h1>
     <div class="flex-row">
     	<a href="<%=request.getContextPath() %>" class="btn">Đến trang chủ</a>
     	<a href="<%=request.getContextPath() %>/logout" class="btn ml-1">Thoát</a>     
     </div>
    </div>
   </div>
   <!-- Home -->
   <div id="main-content">
    <div id="admin-table">
     <table class="table">
      <caption>Các thành viên của đội</caption>
      <thead>
       <tr>
        <th>Email</th>
        <th>Tên</th>
        <th>Cấp bậc</th>
        <th>Số điện thoại</th>
        <th>Địa chỉ</th>
       </tr>
      </thead>
      <tbody>
      <c:forEach var="item" items="${listUser }">
       <tr>
        <td>${item.email }</td>
        <td>${item.name }</td>
        <td><c:choose><c:when test="${item.role == 1 }">Vàng</c:when><c:otherwise>Sắt</c:otherwise></c:choose></td>
        <td>${item.phone }</td>
        <td>${item.address }</td>
       </tr>      
      </c:forEach>      
      </tbody>
     </table>
    </div>
   </div>

<c:import url="/admin/footer.jsp"/>