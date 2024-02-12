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
        <title>Support</title>
        <link rel="stylesheet" type="text/css"  href="Style/support.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    </head>
    <style>
        .sticky {
            position: sticky;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 9999;
        }
    </style>

    <body>
        <div class="sticky">
            <%@ include file="/includes/header.jsp" %>
        </div>
        <section >
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="chatbox-wrapper">
                        <div class="message-box">
                            <div class="chat response">
                                <img src="img/chatbot.png">
                                <span>Hello there! <br> 
                                    How can I help you today.
                                </span>
                            </div>
                        </div>
                        <div class="messagebar">
                            <div class="bar-wrapper">
                                <input type="text" placeholder="Enter your message...">
                                <button>
                                    <span class="material-symbols-rounded">
                                        send
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </section>
        <script src="support/support.js"></script>
    </body>
</html>
