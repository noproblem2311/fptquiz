<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty sessionScope.exam}">
    <script>
        history.go(-1);
    </script>
</c:if>
<html>
    <c:set var="lang" value="${cookie.lang.value}" />
    <fmt:setLocale value="${lang}" scope="session" />
    <fmt:setBundle basename="bundle.bundle" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="Style/sidebar.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <aside class="sidebar">
            <div class="sidebar__item">
                <i class=" sidebar__item-icon fa-solid fa-database"></i>
                <a href="home" class="sidebar__item-list"><fmt:message key="nav.left.dashboard"/></a>
            </div>
            <div class="sidebar__item">
                <i class=" sidebar__item-icon fa-solid fa-gamepad"></i>
                <a href="courses" class="sidebar__item-list"><fmt:message key="nav.left.quiz"/></a>
            </div>
         
            <div class="sidebar__item">
                         <i class=" sidebar__item-icon fa-solid fa-book-open"></i>
                         <a href="Learn" class="sidebar__item-list">Learn</a>
            </div>
            
            <div class="sidebar__item">
                <i class="sidebar__item-icon fa-solid fa-clock-rotate-left"></i>
                <a href="history" class="sidebar__item-list"><fmt:message key="nav.left.history"/></a>
            </div>
            
            <div class="sidebar__item">
                <i class=" sidebar__item-icon fa-solid fa-headset"></i>
                <a href="support.jsp" class="sidebar__item-list"><fmt:message key="nav.left.support"/></a>
            </div>
            <div class="sidebar__item">
                <i class=" sidebar__item-icon fa-solid fa-bell"></i>
                <a href="#" class="sidebar__item-list"><fmt:message key="nav.left.notification"/></a>
            </div>         
        </aside>
    </body>
</html>
