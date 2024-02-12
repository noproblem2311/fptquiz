<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<fmt:setBundle basename="bundle.bundle" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="instruction.title"/></title>
        <link rel="stylesheet" type="text/css" href="Style/instruction.css">
    </head>
    <%@ include file="/includes/header.jsp" %>
    <body>
        <section>
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="body__header">
                        <h1 class="body__header-title"> ${cInfo.courseName} <fmt:message key="instruction.header"/></h1>
                        <p class="body__header-desc"><fmt:message key="instruction.subheader"/></p>
                    </div>
                    <div class="body__quiz">
                        <div class="body__quiz-img">
                            <img src="${cInfo.courseImg}" alt="Course Image"  />
                        </div>
                        <div class="body__quiz-content">
                            <div class="quiz-item">
                                <div class="quiz-item-title"><fmt:message key="instruction.date"/>:</div>
                                <div class="quiz-item-desc">
                                   <%
                                        java.util.Date currentTime = new java.util.Date();
                                         java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd/MM/yyyy");
                                         String formattedTime = dateFormat.format(currentTime);
                                    %>
                                    <p><%= formattedTime %></p>
                                </div>
                            </div>  
                            <div class="quiz-item">
                                <div class="quiz-item-title"><fmt:message key="instruction.timelimit"/>:</div>
                                <div class="quiz-item-desc">
                                   1 <fmt:message key="instruction.min"/>
                                </div>
                            </div>  
                            <div class="quiz-item">
                                <div class="quiz-item-title"><fmt:message key="instruction.attempt"/>:</div>
                                <div class="quiz-item-desc">
                                   <fmt:message key="instruction.chance"/>
                                </div>
                            </div>  
                            <div class="quiz-item">
                                <div class="quiz-item-title"><fmt:message key="instruction.point"/>:</div>
                                <div class="quiz-item-desc">
                                    100<fmt:message key="instruction.point"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="body__instruct">
                        <div class="body__instruct-title body__header-title"><fmt:message key="instruction.title"/></div>
                        <div class="body__instruct-desc">
                            <fmt:message key="instruction.desc"/>
                        </div>
                        <div class="body__instruct-desc"> <fmt:message key="instruction.desc2"/></div>
                        <div class="body__instruct-desc"><fmt:message key="instruction.desc3"/></div>
                        <a href="createquiz?courseID=${cInfo.courseID}" class="body__submit-btn"><fmt:message key="instruction.btn"/></a>
                    </div>
                </div>
        </section>
    </body>
</html>