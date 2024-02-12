<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ include file="/includes/header.jsp" %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<fmt:setBundle basename="bundle.bundle" />
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="quiz.title"/></title>
        <link rel="stylesheet" type="text/css" href="Style/quiz.css">
    </head>
    <body>
        <section>
            <div style="position: relative;" class="view">
                <div  class="body">
                    <div class="body__header">
                        <h1 class="body__header-title">${cInfo.courseName} <fmt:message key="quiz.title"/>!</h1>
                        <p class="body__header-desc"><fmt:message key="quiz.desc"/></p>
                    </div>
                    <c:set var="page" value="${requestScope.page}" />
                    <form action="quiz" method="GET">
                        <div style="position: absolute ; right: -1%; top: 60px; max-width: 280px; width: 100%; padding: 40px 20px; ; box-shadow: 0px 0px 16px 0px rgba(194, 198, 204, 0.60);
                             " class="pagination">
                            <div class="timer">
                                <p class="time" id="timer">""</p>
                            </div>
                            <div style="display: flex; gap: 10px; flex-wrap:wrap; margin-bottom: 30px" class="page">
                                <c:forEach var="i" begin="${1}" end="${requestScope.num}">
                                    <input id ="prePageId" type="hidden" name="prePage" value="${page}">
                                    <button id="button" style="font-size: 16px; width: 50px; height: 50px; font-weight: 600" class="${i==page?"active":""}" type="submit" name="page" value="${i}">${i}</button>
                                </c:forEach>
                            </div>
                            <button class="submit-quiz" onclick="endQuizz()"><fmt:message key="quiz.btn"/></button>
                        </div>
                        <c:forEach var="question" items="${data}">
                            <div class="body__quiz">
                                <div class="body__quiz-content">
                                    <div class="quiz-item">
                                        <div class="quiz-item-title"><fmt:message key="quiz.question"/> ${requestScope.page}/${requestScope.num}</div>
                                        <div class="quiz-item-desc">${question.questionContent}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="body__ans">
                                <div class="body__ans-title"><fmt:message key="quiz.instruct"/></div>
                                <div class="body__ans-choose">
                                    <c:forEach var="answer" items="${question.answersList}" varStatus="loop">
                                        <div class="ans-item">
                                            <input type="radio" name="answer_${loop.count}" value="${answer}" ${sessionScope.ans[page-1] == answer ?"checked" : "" }  />${answer}  <br />
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </form>
                </div>
            </div>
        </section>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
                                const ansItems = document.querySelectorAll('.ans-item');
                                ansItems.forEach(item => {
                                    item.addEventListener('click', () => {
                                        const isSelected = item.classList.contains('selected');
                                        ansItems.forEach(item => {
                                            item.classList.remove('selected');
                                            item.querySelector('input[type="radio"]').checked = false;
                                        });
                                        if (!isSelected) {
                                            item.classList.add('selected');
                                            item.querySelector('input[type="radio"]').checked = true;
                                        }
                                    });
                                });
                                window.onload = function () {
                                    const radioButtons = document.querySelectorAll('input[type="radio"]');

                                    radioButtons.forEach(function (radioButton) {
                                        if (radioButton.checked) {
                                            const ansItem = radioButton.parentNode;
                                            ansItem.classList.add('selected');
                                        }
                                    });
                                };
                                var startTime = parseInt(getCookie("startTime"));
                                var quizTime =  parseInt(getCookie("quizTime"));
                                var elapsedTime;
                    
                                function updateTimer() {
                                    var currentTime = Math.floor(Date.now() / 1000);
                                    elapsedTime = currentTime - startTime;
                                    var remainingTime = quizTime - elapsedTime;

                                    if (remainingTime <= 0) {
                                        clearInterval(timerInterval);
                                        setCookie("startTime", -1);
                                        endQuizz();
                                    } else {
                                        var minutes = Math.floor(remainingTime / 60);
                                        var seconds = remainingTime % 60;

                                        var displayMinutes = minutes < 10 ? "0" + minutes : minutes;
                                        var displaySeconds = seconds < 10 ? "0" + seconds : seconds;

                                        document.getElementById("timer").textContent =
                                                displayMinutes + ":" + displaySeconds;
                                    }
                                }

                                function getCookie(name) {
                                    var cookieArr = document.cookie.split(";");

                                    for (var i = 0; i < cookieArr.length; i++) {
                                        var cookiePair = cookieArr[i].split("=");

                                        if (name === cookiePair[0].trim()) {
                                            return decodeURIComponent(cookiePair[1]);
                                        }
                                    }

                                    return null;
                                }

                                function setCookie(name, value) {
                                    var now = new Date();
                                    now.setFullYear(now.getFullYear() + 1);
                                    var cookieString =
                                            encodeURIComponent(name) +
                                            "=" +
                                            encodeURIComponent(value) +
                                            ";expires=" +
                                            now.toUTCString() +
                                            ";path=/";
                                    document.cookie = cookieString;
                                }

                                function deleteCookie(name) {
                                    document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                                }
                                updateTimer();
                                var timerInterval = setInterval(updateTimer, 1000);

                                function endQuizz()
                                {
                                    localStorage.removeItem("startTime");

                                    $.ajax({
                                        url: "/QuizletFPT/quiz?status=end&",
                                        type: "post", //send it through get method
                                        data: {
                                            time: elapsedTime,
                                            key: getSelectedAnswer(),
                                            page: getPage()

                                        },
                                        success: function (data) {
                                            window.location.replace("resultquiz");
                                        },
                                        error: function (xhr) {
                                            //Do Something to handle error
                                        }
                                    });

                                }

                                function getSelectedAnswer() {
                                    var answerOptions = document.querySelectorAll('.body__ans-choose input[type="radio"]');
                                    var selectedAnswer = "";

                                    for (var i = 0; i < answerOptions.length; i++) {
                                        if (answerOptions[i].checked) {
                                            selectedAnswer = answerOptions[i].value;
                                            break;
                                        }
                                    }

                                    return selectedAnswer;
                                }

                                function getPage()
                                {
                                    var prePageInput = document.getElementById("prePageId");
                                    return prePageInput.value;

                                }


    </script>

    <style>
        .selected {
            background-color: #00FF00;
        }

    </style>


</html>