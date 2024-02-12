<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="r" class="DAO.TestDAO" scope="request"></jsp:useBean>
<% response.setCharacterEncoding("UTF-8"); %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<fmt:setBundle basename="bundle.bundle" />

<html>
    <head>
        <meta charset="UTF-8">
        <title><fmt:message key="history.title"/></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" type="text/css" href="Style/historyCss.css">
    </head>
    <%@ include file="/includes/header.jsp" %>

    <body>
        <section >
            <div class="view">
                <%@ include file="/includes/sidebar.jsp" %>
                <div class="body">
                    <div class="result-header">
                        <p class="header-tile"><fmt:message key="history.header"/></p>
                        <div class="header-nav">
                            <i class="fa-solid fa-right-from-bracket"></i>
                            <a href="dashboardView.jsp" ><fmt:message key="history.header.btn"/></a>                      
                        </div>        
                    </div>
                    <div class="result-table">
                        <div class="table-header">
                            <div class="table-col">Test ID</div>                           
                            <div style="border-left: 0" class="table-col">Course</div>
                            <div style="border-left: 0" class="table-col">Time</div>
                            <div style="border-left: 0" class="table-col">Corrected</div>
                            <div style="border-left: 0" class="table-col">Point</div>
                            <div style="border-left: 0" class="table-col">Created At</div>
                        </div>
                        <c:forEach items="${records}" var="record">
                            <div class="table-row">
                                <div style="border-top: 0" class="table-col">${record.testID}</div>                           
                                <div style="border-left: 0;border-top: 0" class="table-col">${record.collectionID}</div>
                                <div style="border-left: 0;border-top: 0" class="table-col">${record.finishTime}</div>
                                <div style="border-left: 0;border-top: 0" class="table-col">${record.correctedQuestion}/5</div>
                                <div style="border-left: 0;border-top: 0" class="table-col">${record.point}</div>
                                <div style="border-left: 0;border-top: 0" class="table-col">${record.createdAt}</div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>



