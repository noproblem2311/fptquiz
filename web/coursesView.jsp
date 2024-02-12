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
    <link rel="stylesheet" " type="text/css"  href="Style/courses.css">
    <title>Courses</title>
</head>
<body>
    <section>
        <div class="view">
            <%@ include file="/includes/sidebar.jsp" %>
            <div class="body">
                <div class="body__content">
                    <div class="body__content-tiltle"><fmt:message key="quiz.topic"/></div>
                    <div class="body__content-depcriptions"><fmt:message key="dashboard.cate"/></div>
                </div>
                <div class="body__gallery">
                    <c:forEach items="${c.allCourses}" var="i">
                        <div class="card">
                            <img  src="<c:url value="${i.courseImg}"/>" class="card-img" alt="" />
                            <div class="card-body">
                                <div class="card-title">${i.courseName}</div>
                                <div class="card-info">
                                    ${i.courseInfo}
                                </div>
                                <button class="card-button"><a href="instruction?courseID=${i.courseID}"><fmt:message key="dashboard.enroll"/></a></button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
</body>
</html>