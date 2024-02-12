<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="add.course.title"/></title>
    <link rel="stylesheet" type="text/css" href="Style/profilecss.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <%@ include file="/includes/header_admin.jsp" %>
    <section>
        <div class="view">
            <%@ include file="/includes/sidebar_admin.jsp" %>
            <div class="body">
                <div class="container">
                     <div class="form-header">
                            <h1 class="title"><fmt:message key="add.course.title"/></h1>
                        </div>
                    <form style="margin-bottom: 40px;" action="addcourse" method="post" class="form-group" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label class="label" for="cate-name"><fmt:message key="add.course.name"/></label>
                            <input class="input" type="text" id="full-name" name="catename">
                            <span id="catename-error" class="error-message"></span>
                        </div>
                        <div class="form-group">
                            <label class="label" for="cate-info"><fmt:message key="add.course.info"/></label>
                            <input class="input" type="text" id="user-name" name="cateinfo">
                            <span id="cateinfo-error" class="error-message"></span>
                        </div>
                        <div class="form-group">
                            <label class="label" for="cate-img"><fmt:message key="add.course.img"/></label>
                            <input class="input" type="text" id="img" name="cateimg">
                            <span id="cateimg-error" class="error-message"></span>
                        </div>
                        <div class="button-group">
                            <button class="button" type="submit"><fmt:message key="add.course.submit"/></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <script>
        function validateForm() {
            var errorMessages = document.getElementsByClassName('error-message');
            for (var i = 0; i < errorMessages.length; i++) {
                errorMessages[i].textContent = '';
            }
            
            var catenameInput = document.getElementById('full-name');
            var cateinfoInput = document.getElementById('user-name');
            var cateimgInput = document.getElementById('img');
            var isValid = true;
            
            if (catenameInput.value.trim() === '') {
                document.getElementById('catename-error').textContent = 'Please input course name.';
                isValid = false;
            }
            
            if (cateinfoInput.value.trim() === '') {
                document.getElementById('cateinfo-error').textContent = 'Please input course infor.';
                isValid = false;
            }
            
            if (cateimgInput.value.trim() === '') {
                document.getElementById('cateimg-error').textContent ='Please input course img url .';
                isValid = false;
            }
            
            return isValid;
        }
    </script>
</body>
</html>
