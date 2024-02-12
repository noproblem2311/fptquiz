<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% response.setCharacterEncoding("UTF-8"); %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<fmt:setBundle basename="bundle.bundle" />
<html>
    <head>
        <meta charset="UTF-8">
        <title><fmt:message key="result.title"/></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" type="text/css" href="Style/result.css">
        
    </head>
    <%@ include file="/includes/header.jsp" %>
    <body>
        <section >
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="result-header">
                        <p class="header-tile"><fmt:message key="result.header"/></p>
                        <div class="header-nav">
                            <i class="fa-solid fa-right-from-bracket"></i>
                            <a href="dashboardView.jsp" ><fmt:message key="result.header.btn"/></a>                      
                        </div>        
                    </div>
                    <div class="result-table">
                        <div class="table-header">
                            <div class="table-col"><fmt:message key="result.testID"/></div>                           
                            <div style="border-left: 0" class="table-col"><fmt:message key="result.userName"/></div>
                            <div style="border-left: 0" class="table-col"><fmt:message key="result.course"/></div>
                            <div style="border-left: 0" class="table-col"><fmt:message key="result.time"/></div>
                            <div style="border-left: 0" class="table-col"><fmt:message key="result.corrected"/></div>
                            <div style="border-left: 0" class="table-col"><fmt:message key="result.point"/></div>
                            <div style="border-left: 0" class="table-col"><fmt:message key="result.createdAt"/></div>
                        </div>
                        <div class="table-row">
                            <div style="border-top: 0" class="table-col">${test.testID}</div>                           
                            <div style="border-left: 0;border-top: 0" class="table-col">${user.username}</div>
                            <div style="border-left: 0;border-top: 0" class="table-col">${test.collectionID}</div>
                            <div style="border-left: 0;border-top: 0" class="table-col">${test.finishTime}</div>
                            <div style="border-left: 0;border-top: 0" class="table-col">${test.correctedQuestion}</div>
                            <div style="border-left: 0;border-top: 0" class="table-col">${test.point}</div>
                            <div style="border-left: 0;border-top: 0" class="table-col">${test.createdAt}</div>
                        </div>
                    </div>
                    <div class="review-header">
                        <fmt:message key="review.title"/>
                    </div>
                    <div class="review">
                        <c:forEach items="${question}" var="ques" varStatus="status">
                            <div class="review-item">
                                <div class="review-no">
                                    <p><fmt:message key="review.question"/>
                                        <span>${status.index + 1}</span></p>
                                    <div class="question-status">
                                        <c:choose>
                                            <c:when test="${userchoice[status.index] == ques.getCorrectAnswer()}">
                                                <fmt:message key="review.status.correct"/>
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:message key="review.status.incorrect"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="question-mark"> 
                                        <c:choose>
                                            <c:when test="${userchoice[status.index ] == ques.getCorrectAnswer()}">
                                                <fmt:message key="review.mark.full"/>
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:message key="review.mark.none"/>
                                            </c:otherwise>
                                        </c:choose></div>
                                </div>
                                <div class="review-content">
                                    <div class="review-question">
                                        <div class="question-content">${ques.getQuestionContent()}</div>
                                        <div class="question-ans"> 
                                            <!--userchoice-->
                                           <fmt:message key="review.choice"/>: <span>${userchoice[status.index] != null ? userchoice[status.index]:"No answer"}</span>
                                            <c:choose>
                                                <c:when test="${userchoice[status.index] == ques.getCorrectAnswer()}">
                                                    <i class="fa-solid fa-check true"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="fa-solid fa-xmark false"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="review-ans">
                                        <div class="review-ans-title"><fmt:message key="review.msg"/>:</div>
                                        <div>
                                            ${ques.getCorrectAnswer()}</div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <a class="btn" href="history"><fmt:message key="review.navigate"/></a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>



