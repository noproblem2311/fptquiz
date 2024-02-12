<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="c" class="DAO.CourseDAO" scope="request"></jsp:useBean>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ include file="/includes/header.jsp" %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<fmt:setBundle basename="bundle.bundle" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Required</title>
    <link rel="stylesheet" type="text/css" href="Style/paymentRequired.css">
</head>
<body>
   
    <div class="container">
        <h1>Payment Required</h1>
        <p>To access this feature, you need to make a payment.</p>
        
         <a href="dashboardView.jsp">
        <button  class="btn_back"><fmt:message key="learn.back.home"/></button>
        </a>
        <a href="payment.jsp" ><button  class="btn">Proceed to Payment</button></a>
        
    </div>
</body>
</html>
