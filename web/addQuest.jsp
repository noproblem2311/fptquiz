<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="cate" class="DAO.CourseDAO" scope="session"/>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title><fmt:message key="add.ques.title"/></title>
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
                            <h1 class="title"><fmt:message key="add.ques.title"/></h1>
                        </div>
                        <form style="margin-bottom: 40px; display: flex; flex-direction: column; gap: 20px;" action="addquest" method="post" class="form-group" onsubmit="return validateForm()">
                            <div style="width: 100%">
                                <p style="font-size: 20px; font-weight: 600"><fmt:message key="add.ques.course"/></p>
                                <select style="font-size: 18px;" name="cate">                                  
                                    <c:forEach items="${cate.allCourses}" var="i">
                                        <option style="font-size: 16px;" value="${i.courseID}">${i.courseName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div style="width: 100%">
                                <p style="font-size: 20px; font-weight: 600"><fmt:message key="add.ques.diff"/></p>
                                <select style="font-size:18px;" name="difficuilt">   
                                    <option style="font-size: 16px;" value="1">1</option>
                                    <option style="font-size: 16px;"  value="2">2</option>
                                    <option style="font-size: 16px;" value="3">3</option>
                                </select>
                            </div>
                            <div style="width: 100%">
                                <p style="font-size: 20px; font-weight: 600"><fmt:message key="add.ques.ques"/>:</p>
                                <input style="width: 100%; padding: 5px 10px; font-size: 16px" type="text" name="question" value="" placeholder="Please input your question..." />
                                <span id="question-error" class="error-message"></span>
                            </div>
                            <div style="width: 100%">
                                <p style="font-size: 20px; font-weight: 600"><fmt:message key="add.ques.ans1"/>:</p>
                                <input style="width: 100%; padding: 5px 10px; font-size: 16px" type="text" name="ans1" placeholder="Enter select answer" />
                                <span id="ans1-error" class="error-message"></span>
                            </div>
                            <div style="width: 100%">
                                <p style="font-size: 20px; font-weight: 600"><fmt:message key="add.ques.ans2"/>:</p>
                                <input  style="width: 100%; padding: 5px 10px; font-size: 16px" type="text" name="ans2" placeholder="Enter select answer" />             
                                <span id="ans2-error" class="error-message"></span>
                            </div>
                            <div style="width: 100%">
                                <p style="font-size: 20px; font-weight: 600"><fmt:message key="add.ques.ans3"/>:</p>
                                <input  style="width: 100%; padding: 5px 10px; font-size: 16px" type="text" name="ans3" placeholder="Enter select answer" />
                                <span id="ans3-error" class="error-message"></span>
                            </div>
                             <div style="width: 100%">
                                <p style="font-size: 20px; font-weight: 600"><fmt:message key="add.ques.correct"/>:</p>
                               <input style="width: 100%; padding: 5px 10px; font-size: 16px" type="text" name="key" placeholder="Enter right answer" />
                            <span id="key-error" class="error-message"></span>
                            </div>  
                            <div class="button-group">
                                <button class="button" type="submit"><fmt:message key="profile.save"/></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <script>
            function validateForm() {
                // Xóa các thông báo lỗi trước đó
                var errorMessages = document.getElementsByClassName('error-message');
                for (var i = 0; i < errorMessages.length; i++) {
                    errorMessages[i].textContent = '';
                }

                var questionInput = document.getElementsByName('question')[0];
                var ans1Input = document.getElementsByName('ans1')[0];
                var ans2Input = document.getElementsByName('ans2')[0];
                var ans3Input = document.getElementsByName('ans3')[0];
                var keyInput = document.getElementsByName('key')[0];

                var isValid = true;

                if (questionInput.value.trim() === '') {
                    document.getElementById('question-error').textContent = 'Please input your question.';
                    isValid = false;
                }

                if (ans1Input.value.trim() === '') {
                    document.getElementById('ans1-error').textContent = 'Please enter select answer.';
                    isValid = false;
                }

                if (ans2Input.value.trim() === '') {
                    document.getElementById('ans2-error').textContent = 'Please enter select answer.';
                    isValid = false;
                }

                if (ans3Input.value.trim() === '') {
                    document.getElementById('ans3-error').textContent = 'Please enter select answer.';
                    isValid = false;
                }

                if (keyInput.value.trim() === '') {
                    document.getElementById('key-error').textContent = 'Please enter right answer.';
                    isValid = false;
                }

                return isValid;
            }
        </script>
    </body>
</html>
