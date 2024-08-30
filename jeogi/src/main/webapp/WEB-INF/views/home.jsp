<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<body>
	<c:set var="path" value="${pageContext.request.contextPath}" />
	<a href="${path}/customer_center/announcement">announcement</a>
	<a href="${path}/customer_center/chatbot">chatbot</a>
	<a href="${path}/customer_center/customer-service">customer-service</a>
	<a href="${path}/customer_center/faq">faq</a>
	<a href="${path}/review/review">review</a>
	<a href="${path}/customer_center/customer_center">customer-center</a>
</body>
</html>