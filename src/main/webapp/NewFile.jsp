<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p><%= new Date() %></p>

<p>${test }</p>

<jsp:useBean id="user1" class="beans.TestBean" scope="page"></jsp:useBean>
<jsp:setProperty name="user1" property="firstName" value="A" />
<jsp:setProperty name="user1" property="lastName" value="Nguyen" />

<p>${user1.lastName } ${user1.firstName }</p>


</body>
</html>