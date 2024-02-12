<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${empty cookie.lang}">
        <c:set var="defaultLang" value="vi" />
        <fmt:setLocale value="${defaultLang}" scope="session" />
        <fmt:setBundle basename="bundle.bundle" />
        <c:set var="lang" value="${defaultLang}" scope="session" />

        <% 
            Cookie cookie = new Cookie("lang", "${defaultLang}");
            response.addCookie(cookie);
        %>
    </c:when>
    <c:otherwise>
        <c:set var="lang" value="${cookie.lang.value}" />
        <fmt:setLocale value="${lang}" scope="session" />
        <fmt:setBundle basename="bundle.bundle" />
    </c:otherwise>
</c:choose>




<c:choose>
    <c:when test="${not empty user}">
        <c:redirect url="dashboardView.jsp" />
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="Style/login.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" integrity="sha512-ZnR2wlLbSbr8/c9AgLg3jQPAattCUImNsae6NHYnS9KrIwRdcY9DxFotXhNAKIKbAXlRnujIqUWoXXwqyFOeIQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://www.google.com/recaptcha/enterprise.js?render=6Lcj3bYmAAAAAMZeCQ1yGkMFS68LXwRJ1Z0Z9El8"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="body">
            <div class="container">
                <div class="container__content">
                    <div class="container__content-form">
                        <div class="form-title">
                            <h1 class="title"><fmt:message key="login.tiltle.big"/></h1>
                            <p class="desc"><fmt:message key="login.tiltle.small"/></p>
                        </div>
                        <c:set var="cookie" value="${pageContext.request.cookies}" />
                        <form action="login" method="post" class="form-items">

                            <div class="form-item">
                                <label class="form-item-name"><fmt:message key="login.email"/></label>
                                <input
                                    class="form-item-input"
                                    name="email"
                                    type="email"
                                    placeholder="<fmt:message key="login.email.focus"/>"
                                    value ="${cookie.cEmail.value != null ? cookie.cEmail.value : email }"
                                    />
                            </div>
                            <div class="form-item">
                                <label class="form-item-name"><fmt:message key="login.password"/></label>
                                <input
                                    class="form-item-input"
                                    type="password"
                                    name="password"
                                    placeholder="<fmt:message key="login.password.focus"/>"
                                    id="logPass"
                                    value ="${cookie.cPass.value}"
                                    />
                            </div>
                            <div class="showPass">
                                <input type="checkbox" name="remember" ${cookie.cRemember != null ? "checked" : ""} />
                                <p><fmt:message key="login.remember"/></p>
                            </div>
                            <!--                            <div class="form-checkbox">
                                                            <input class="form-checkbox-input"  type="checkbox" />
                                                            <p class="form-checkbox-desc">Remember my password</p>
                                                        </div>-->
                            <div class="form-log">
                                <input type="submit" value="<fmt:message key="login.tiltle"/>" class="create-btn" onclick="logAlert()"></input>
                                <p class="option"><fmt:message key="login.or"/></p>
                                <a class='log-btn' href="registerView.jsp"><fmt:message key="signup.tiltle"/></a>
                            </div>
                        </form>

                    </div>
                </div>
                <div class="container__img">
                    <div class="container__img-blur"></div>
                    <div class="container__img-desc">
                        <div class="desc-open">“</div>
                        <fmt:message key="login.introduction"/>
                    </div>
                </div>
                <div class="container__back">
                    <i class="container__back-icon fa-solid fa-arrow-left"></i>
                    <a class="container__back-text" href="index.html"><fmt:message key="login.back"/></a>
                </div>
            </div>
        </div>

    </body>
    <script>
        window.onload = function () {
            var status = '${status}';
            var title = '${title}';
            var message = '${message}';

            if (status && title && message) {
                Swal.fire({
                    icon: status,
                    title: title,
                    text: message
                });
            }
        };
        function showPassLog() {
            var x = document.getElementById("logPass");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
</html>


