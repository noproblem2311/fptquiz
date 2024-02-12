<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="ad" class="DAO.AdminDAO" scope="session"></jsp:useBean>
<% response.setCharacterEncoding("UTF-8"); %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<fmt:setBundle basename="bundle.bundle" />

<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" type="text/css" href="Style/dashboardCss.css">
    </head>
    <%@ include file="/includes/header_admin.jsp" %>
    <body>
        <section >
            <div class="view">
                <%@ include file="/includes/sidebar_admin.jsp" %>
                <div class="body">
                    <div class="body_admin">
                        <h1> Quizz Manager Information </h1>
                        
                        <h3>Total Account : ${ad.totalAccount}</h3>
                        <h3>Total Question : ${ad.totalQuestion}</h3>
                        <h3>Total Course : ${ad.totalCourse}</h3>
                    </div>  
                </div>
            </div>
        </section>
    </body>
</html>



