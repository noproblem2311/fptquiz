<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="c" class="DAO.CourseDAO" scope="request"></jsp:useBean>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ include file="/includes/header.jsp" %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<fmt:setBundle basename="bundle.bundle" />
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="Style/learn.css">
    <title>Learn</title>
</head>
<body>
    <section>
        <div class="view">
            <%@ include file="/includes/sidebar.jsp" %>
            <div class="body">
                <div class="body__content">
                    <div class="body__content-tiltle"><fmt:message key="learn.topic"/></div>
                    <div class="body__content-depcriptions"><fmt:message key="learn.cate"/></div>
                </div>
                <div class="body__gallery">
                    <c:forEach items="${c.allCourses}" var="course">
                        <div class="card">
                            <img src="<c:url value="${course.courseImg}"/>" class="card-img" alt="" />
                            <div class="card-body">
                                <div class="card-title">${course.courseName}</div>
                                <div class="card-info">
                                    ${course.courseInfo}
                                </div>
                               <a href="Study?courseID=${course.courseID}"> <button class="card-button"><fmt:message key="learn.start"/></button></a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
   
</body>
</html>
