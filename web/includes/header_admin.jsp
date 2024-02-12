<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <c:set var="lang" value="${cookie.lang.value}" />
    <fmt:setLocale value="${lang}" scope="session" />
    <fmt:setBundle basename="bundle.bundle" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="Style/header.css" />
        <title>JSP Page</title>
        <script>
            function toggleSettingsPopup() {
                var popup = document.getElementById("settingsPopup");
                popup.classList.toggle("show");
            }
            function exitToggleSettingsPopup() {
                var popup = document.getElementById("settingsPopup");
                popup.classList.remove("show");
            }
        </script>
        <script src="js/showJs.js"></script>
    </head>
    <body>
        <div class="main">
            <div class="main-container">
                <header class="header">
                    <a class="header-title" href="home">
                        <h1 class="header-title">FPT Quiz</h1>
                    </a>

                
                    <div class="header-user" id="user-nav">
                        <div class="user-box">
                            <img class="header-user-img" src="../img.jpg" alt="">
                            <div class="header-user-name">${user.username}</div>
                        </div>
                        <div class="hearder-toggle" onclick="toggleHeaderInfo()">
                            <div class="toggle-line"></div>
                        </div>
                        <div id="header-info" class="header-info">
                            <div class="info-item">
                                <i class="fa-solid fa-gear info-icon"></i>
                                <a class="info-link" onclick="toggleSettingsPopup()"><fmt:message key="nav.menu.setting"/></a>
                            </div>
                            <div class="info-item">
                                <i class="fa-solid fa-arrow-right-from-bracket info-icon"></i>
                                <a class="info-link" href="logout"><fmt:message key="nav.menu.logout"/></a>
                            </div>
                        </div>
                    </div>
                </header>
                <form class="form" action="language" method="post" id="settingsPopup">
                    <input type="hidden" name="servletPath" value="${pageContext.request.servletPath}">
                    <section  class="popup">
                        <div class="setting">
                            <div class="setting-header">
                                <i class="fa-solid fa-gear setting-icon"></i>
                                <p class="setting-title"><fmt:message key="nav.menu.setting"/></p>
                            </div>
                            <div class ="setting-exit" onclick="exitToggleSettingsPopup()">
                                <i style="font-size: 36px; cursor: pointer;" class="fa-solid fa-xmark"></i>
                            </div>
                        </div>
                        <div class="setting-body">
                            <div class="setting-item">
                                <div style="border: none" class="setting-header">
                                    <i style="color: #503a3a; font-size: 24px" class="fa-solid fa-language setting-icon"></i>
                                    <p class="setting-item-title"><fmt:message key="setting.language"/></p>
                                </div>
                                <div class="setting-item-chose">
                                    <div class="radio-inputs">
                                        <label>
                                            <input class="radio-input" type="radio" name="engine" value="jp" ${cookie.lang.value == "jp" ? "checked" : ""} />
                                            <span class="radio-tile">
                                                <span class="radio-icon">
                                                    <span class="radio-icon">
                                                        <img src="https://flagsworld.org/img/cflags/japan-flag.png?fbclid=IwAR06ky9Dm1OkdvFgZS5-Uo5VgDSCbHcu9s1EUuYIbleNtarRyeEnQLrVHTQ" alt="japanese" />
                                                    </span>
                                                </span>
                                                <span class="radio-label">日本語</span>
                                            </span>
                                        </label>
                                        <label>
                                            <input ${cookie.lang.value == "en" ? "checked" : ""} class="radio-input" type="radio" name="engine" value="en" />
                                            <span class="radio-tile">
                                                <span class="radio-icon">
                                                    <span class="radio-icon">
                                                        <img src="https://flagsworld.org/img/cflags/japan-flag.png?fbclid=IwAR06ky9Dm1OkdvFgZS5-Uo5VgDSCbHcu9s1EUuYIbleNtarRyeEnQLrVHTQ" alt="English" />
                                                    </span>
                                                </span>
                                                <span class="radio-label">English</span>
                                            </span>
                                        </label>
                                        <label>
                                            <input class="radio-input" type="radio" name="engine" value="vi" ${cookie.lang.value == "vi" ? "checked" : ""} />
                                            <span class="radio-tile">
                                                <span class="radio-icon">
                                                    <img src="https://flagsworld.org/img/cflags/japan-flag.png?fbclid=IwAR06ky9Dm1OkdvFgZS5-Uo5VgDSCbHcu9s1EUuYIbleNtarRyeEnQLrVHTQ" alt="Tiếng Việt" />
                                                </span>
                                                <span class="radio-label">Tiếng Việt</span>
                                            </span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="submit-form">
                                <input class="setting-btn" type="submit" value="<fmt:message key="setting.save"/>" />
                            </div>
                        </div>
                    </section>
                </form>
            </div>
        </div>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
                                // Lấy phần tử input bằng cách sử dụng CSS selector
                                var inputElement = document.querySelector('.header-search .search-input');

// Lắng nghe sự kiện nhập liệu
                                inputElement.addEventListener('input', function (event) {
                                    var inputValue = event.target.value;
                                    $.ajax({
                                        url: "/QuizletFPT/search",
                                        type: "post", //send it through get method
                                        data: {
                                            key: inputValue

                                        },
                                        success: function (data) {

                                        },
                                        error: function (xhr) {
                                            //Do Something to handle error
                                        }
                                    });

                                });


    </script>
</html>

