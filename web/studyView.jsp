<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="Style/study.css">
    <title>Study</title>
</head>
  <%@ include file="/includes/header.jsp" %>
<body>
    <section>
        <div class="view">
             <%@ include file="/includes/sidebar.jsp" %>
            <div class="body">
                <c:forEach var="question" items="${question}">
                    <div class="question-container">
                        <div class="question-content">
                            <h3>Question:</h3>
                            <p>${question.questionContent}</p>
                        </div>
                        <div class="correct-answer">
                            <h3>Correct Answer:</h3>
                            <p>${question.correctAnswer}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</body>
</html>
