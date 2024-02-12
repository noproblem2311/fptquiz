<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <title>Create account</title>
        <link rel="stylesheet" href="Style/register.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty user}">
                <c:redirect url="dashboardView.jsp" />
            </c:when>
            <c:otherwise>
                <!-- Hiển thị trang đăng nhập -->
                ...
            </c:otherwise>
        </c:choose>
        <div class="body">
            <div class="container">
                <div class="container__content">
                    <div class="container__content-form">
                        <div class="form-title">
                            <h1 class="title">Create Account</h1>
                            <p class="desc">with your email address</p>
                        </div>
                        <form action="register" method="post" class="form-items">
                            <div class="form-item">
                                <label class="form-item-name">Username*</label>
                                <input
                                    class="form-item-input"
                                    type="text"
                                    name="username"
                                    placeholder="Enter your name..."
                                    />
                            </div>
                            <div class="form-item">
                                <label class="form-item-name">Email*</label>
                                <input
                                    class="form-item-input"
                                    type="email"
                                    name="email"
                                    placeholder="Enter your email..."
                                    />
                            </div>
                            <div class="form-item">
                                <label class="form-item-name">Password*</label>
                                <input
                                    class="form-item-input"
                                    type="password"
                                    name="password"
                                    placeholder="Enter your password..."
                                    id="regPass"
                                    />
                            </div>
                            <div class="showPass">
                                <input type="checkbox" onclick="showPassReg()"/>
                                <p>Show Password</p>
                            </div>
                            <div class="form-log">
                                <input type="submit" value="Create new account" class="create-btn" onclick="showAlert()" > </input>
                                <p class="option">Or</p>
                                <a class='log-btn' href="loginView.jsp">Log In</a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="container__img">
                    <div class="container__img-blur"></div>
                    <div class="container__img-desc">
                        <div class="desc-open">“</div>
                        Those people who develop the ability to continuously acquire new and
                        better forms of knowledge that they can apply to their work and to
                        their lives will be the movers and shakers in our society for the
                        indefinite future
                    </div>
                </div>
                <div class="container__back">
                    <i class="container__back-icon fa-solid fa-arrow-left"></i>
                    <a class="container__back-text" onclick="javascript:history.go(-1)" >Back</a>
                </div>
            </div>
        </div>
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
                ;
            };
            function showPassReg() {
                var x = document.getElementById("regPass");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>
    </body>
</html>
