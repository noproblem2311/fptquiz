<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="c" class="DAO.CourseDAO" scope="request"></jsp:useBean>
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
    <%@ include file="/includes/header.jsp" %>
    <body>
        <section >
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="body__user">
                        <img class="user__data-img" src="assets/avatar.svg" />

                        <div class="user__data-content">
                            <div class="data-info">
                                <div class="data-info-name">${user.fullname==null ?"Hello new player ":user.fullname}</div>
                                <div class="data-info-type">${user.username}</div>
                            </div>
                            <div class="user__data-process">
                                <div class="data-progress-bar"></div>
                            </div>
                            <div class="data-paramenters">
                                <div class="paramenters__item">
                                    <div class="paramenters__item-logo">
                                        <img class="item-img" src="assets/flag.svg" />
                                    </div>
                                    <div class="paramenters__item-container">
                                        <div class="item-point">27</div>
                                        <div class="item-depcripstion">Quizz passed</div>
                                    </div>
                                </div>
                                <div class="paramenters__item">
                                    <div class="paramenters__item-logo">

                                        <img class="item-img" src="assets/clock.svg" />
                                    </div>
                                    <div class="paramenters__item-container">
                                        <div class="item-point">27</div>
                                        <div class="item-depcripstion">Quizz passed</div>
                                    </div>
                                </div>
                                <div class="paramenters__item">
                                    <div class="paramenters__item-logo">
                                        <img class="item-img" src="assets/pass.svg" />
                                    </div>
                                    <div class="paramenters__item-container">
                                        <div class="item-point">27</div>
                                        <div class="item-depcripstion">Quizz passed</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="body__collect">
                        <div class="collect__acheive">
                            <div class="acheive-tiltle"><fmt:message key="dashboard.acheivements"/></div>
                            <div class="acheive-board">
                                <div class="acheive-board-item medals-comback">
                                    <img src="assets/start1.svg" alt="" />
                                    <div>Comeback</div>
                                </div>
                                <div class="acheive-board-item medals-lucky">
                                    <img src="assets/start2.svg" alt="" />
                                    <div>Lucky</div>
                                </div>
                                <div class="acheive-board-item medals-winner">
                                    <link href="Style/dashboardCss.css" rel="stylesheet" type="text/css"/>
                                    <img src="assets/start3.svg" alt="" />
                                    <div>Winner</div>
                                </div>
                            </div>
                        </div>
                        <div class="collect__cate">
                            <div class="cate-content">
                                <div class="cate-content-tiltle"><fmt:message key="dashboard.cate"/></div>
                                <a class="cate-content-view" href="courses"><fmt:message key="dashboard.viewall"/></a>
                            </div>
                            <div class="cate__gallary">
                                <c:forEach items="${c.featuredCourses}" var="i">
                                    <div class="card">
                                        <img src="<c:url value="${i.courseImg}"/>" class="card-img" alt="" />
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
                </div>
            </div>
        </section>
    </body>
</html>



