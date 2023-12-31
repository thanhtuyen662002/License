<%-- 
    Document   : test-exam
    Created on : Sep 29, 2023, 9:26:17 PM
    Author     : emcua
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            a {
                text-decoration: none;
                cursor: pointer;
            }

            .header {
                background: #fefae0;
                transition: all 0.5s ease-out;
            }

            .header .main__navbar .container {
                margin: 0 auto;
            }

            .header .main__navbar .container .logo {
                width: 80px;
                height: auto;
            }

            .header .main__navbar .container .logo img {
                width: 80px;
                height: auto;
            }

            .header .main__navbar .container .logo h3 {
                color: #000;
                margin: 0px;
                font-size: 25px;
            }

            .header .main__navbar .container .menu {
                display: flex;
                align-items: center;
                column-gap: 2.7rem;
            }

            .header .main__navbar .container .menu .menu_items {
                color: black;
            }

            .header .main__navbar .container .menu .btn_login {
                background-color: #d4a373;
                border: 1px solid #d4a373;
                padding: 5px 15px;
                color: white;
                border-radius: 10px;
                transition: all 0.5s ease-out;
            }

            .header .main__navbar .container .menu .menu_items:hover {
                border-bottom: 2px solid #d4a373;
            }

            .header .main__navbar .container .menu .menu_items_active {
                border-bottom: 2px solid #d4a373;
            }

            .header .main__navbar .container .menu .btn_login:hover {
                background-color: #457b9d;
                border: 1px solid #457b9d;
                color: white;
                transition: all 0.5s ease-out;
            }

            /* style chọn thông tin thi */
            .choose-exam-screen {
                background-color: #edede9;
                padding: 20px;
                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
                border-radius: 5px;
                margin: 20px auto;
                max-width: 600px;
            }

            .choose-exam-screen h1 {
                text-align: center;
                color: #333;
            }

            .choose-exam-screen .form-group {
                margin-bottom: 20px;
            }

            .choose-exam-screen label {
                font-weight: bold;
            }

            .choose-exam-screen .btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .choose-exam-screen .btn-start {
                display: block;
                margin: 0 auto;
                text-align: center;
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
            }

            .choose-exam-screen .btn-primary:hover {
                background-color: #0056b3;
            }

            /* style màn hình thi */
            .test-exam-screen {
                background-color: #f5f5f5;
                border-radius: 5px;
                padding: 20px 0px;
                margin: 20px auto;
                max-width: 1024px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            .main-container .question-title {
                font-size: 24px;
                font-weight: bold;
                color: #333;
                margin-bottom: 10px;
            }

            .main-container .question-text {
                font-size: 25px;
                color: #555;
                margin-bottom: 20px;
            }

            .main-container .form-check-label {
                font-size: 16px;
                color: #333;
            }

            .main-container .col-md-8 {
                border-right: 1px solid black;
                padding: 20px;
            }

            .main-container .col-md-8 .question_picture {
                width: 300px;
                height: 300px;

            }

            .main-container .col-md-8 .question-description p {
                margin-bottom: 0;
            }

            .main-container .col-md-8 img {
                width: 100%;
                height: 100%;
                object-fit: contain;
            }

            /* Phần bên phải: Tổng hợp câu hỏi và đồng hồ đếm ngược */
            .main-container .countdown-title {
                font-size: 18px;
                font-weight: bold;
                color: #333;
                margin-bottom: 0;
            }

            .main-container .countdown-timer {
                font-size: 36px;
                font-weight: bold;
                color: #007bff;
            }

            .main-container .summary-title {
                font-size: 18px;
                font-weight: bold;
                color: #333;
                margin-top: 20px;
            }

            .main-container .summary-list {
                list-style-type: none;
                padding: 0;
            }

            .main-container .summary-list li {
                font-size: 16px;
                color: #555;
                border: 1px solid black;
                cursor: pointer;
                width: 70px;
                text-align: center;
                padding: 0px 5px;
                background-color: #fefae0;
                border-radius: 5px;
            }

            .main-container .summary-list li input {
                border: 1px solid black;
            }

            .main-container .summary-answer {
                font-weight: bold;
                color: #007bff;
            }

            .selected-answer {
                background-color: #d4a373 !important;
            }

            /* style info container */
            .extra-container {
                border-top: 1px solid black;
            }

            .extra-container .row {
                padding-top: 20px;
            }

            .extra-container .info-user {
                padding: 0px 30px;
            }

            .extra-container .info-user .avatar {
                width: 150px;
                height: 100%;
            }

            .extra-container .info-user .avatar img {
                width: 100%;
                object-fit: cover;
            }

            /* style kết quả */
            .result-screen {
                background-color: #fff;
                border: 2px solid #007bff;
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                max-width: 400px;
                margin: 0 auto;
                margin-top: 20px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            .result-screen h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }

            .result-screen p {
                font-size: 18px;
                color: #555;
                margin-bottom: 10px;
            }

            .result-screen #resultMessage {
                font-weight: bold;
                color: #007bff;
            }

            .result-screen button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
            }

            .result-screen button:hover {
                background-color: #d4a373;
            }
        </style>
    </head>

    <body>
        <div>
            <c:import url="homeHeader.jsp"/>
        </div>
        <!-- màn hình thi thử -->
        <div class="test-exam-screen">
            <div class="main-container">
                <div class="container">
                    <div class="row">
                        <c:forEach var="x" items="${listQuestions}">
                        <!-- Phần bên trái: Chi tiết câu hỏi -->
                        <div class="col-md-8 d-flex flex-column flex-start">
                            <h3 class="question-text text-danger">Câu 1: ${x.question}</h3>
                            <div class="d-flex question_picture">
                                <img src="https://www.qualityformationsblog.co.uk/wp-content/uploads/2020/05/QCF-1-1--1200x900.jpg"
                                     alt="question picture">
                            </div>
                            <div class="question-description">
                                <p>A. 5</p>
                                <p>B. 3</p>
                                <p>C. 2</p>
                            </div>
                        </div>
                        </c:forEach>

                        <!-- Phần bên phải: Tổng hợp câu hỏi và đồng hồ đếm ngược -->
                        <div class="col-md-4">
                            <div class="countdown d-flex justify-content-center align-items-center gap-2">
                                <h3 class="countdown-title">Đồng hồ đếm ngược: </h3>
                                <div id="timer" class="countdown-timer">20:00</div>
                            </div>
                            <div class="summary d-flex justify-content-center align-items-center py-3">
                                <ul
                                    class="summary-list d-flex justify-content-center align-items-center flex-wrap gap-3 mb-0">
                                    <li>
                                        Câu 1
                                        <div class="d-flex" style="font-size:15px">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="question1"
                                                       id="question1A" value="A">
                                                <label class="form-check-label" for="question1A">
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="question1"
                                                       id="question1B" value="B">
                                                <label class="form-check-label" for="question1B">
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="question1"
                                                       id="question1C" value="C">
                                                <label class="form-check-label" for="question1C">
                                                </label>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- màn hình infor -->
            <div class="extra-container">
                <div class="row">
                    <div class="info-user col-md-8 d-flex flex-row flex-wrap gap-3">
                        <div class="avatar">
                            <img src="https://www.cloud9salon.com/wp-content/uploads/2016/10/avatar.jpg">
                        </div>
                        <div class="detail-info">
                            <p>Họ và tên: </p>
                            <p>Hạng xe: </p>
                            <p>Ngày thi: </p>
                            <p>Trạng thái: </p>
                        </div>
                    </div>
                    <div class="submit-button col-md-4 d-flex justify-content-center">
                        <button class="btn btn-primary" style="height: 50px">Kết thúc</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- màn hình xử lý kết quả -->
        <div class="result-screen d-none">
            <h1>Kết quả</h1>
            <p>Trả lời sai câu hỏi điểm Liệt: <span id="incorrectPoints">0</span></p>
            <p>Số câu trả lời đúng: <span id="correctAnswers">0</span></p>
            <p>Số câu trả lời sai: <span id="incorrectAnswers">0</span></p>
            <p>Số câu chưa trả lời: <span id="unanswered">0</span></p>
            <p id="resultMessage">Kết quả: Không đạt</p>
            <button class="btn review-button">Xem lại bài thi</button>
        </div>


        <!-- code js -->
        <script>
            //xử lý sự kiện đếm giờ 
            const timerElement = document.getElementById('timer');
            let totalTimeInSeconds = 1200;

            function updateTimer() {
                const minutes = Math.floor(totalTimeInSeconds / 60);
                const seconds = totalTimeInSeconds % 60;
                timerElement.textContent = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
                        if (totalTimeInSeconds > 0) {
                            totalTimeInSeconds--;
                        } else {
                            timerElement.textContent = "Hết thời gian";
                        }
                    }

                    setInterval(updateTimer, 1000);

                    //xử lý sự kiện khi chọn đáp án 
                    const summaryItems = document.querySelectorAll('.summary-list li');

                    summaryItems.forEach((item, index) => {
                        item.addEventListener('click', function () {
                            const inputs = item.querySelectorAll('input[type="radio"]');

                            inputs.forEach((input) => {
                                if (input.checked) {
                                    item.classList.add('selected-answer');
                                }
                            });
                        });
                    });

                    //xử lý sự kiện khi kết thúc 
                    const submitButton = document.querySelector('.submit-button');
                    const resultScreen = document.querySelector('.result-screen');

                    submitButton.addEventListener('click', function (e) {
                        resultScreen.classList.remove('d-none');
                        testExamScreen.classList.add('d-none');
                    });

                    //xử lý sự kiện xem lại

                    const reviewButton = document.querySelector('.review-button');
                    reviewButton.addEventListener('click', function (e) {
                        resultScreen.classList.add('d-none');
                        testExamScreen.classList.remove('d-none');
                    });
        </script>

    </body>

</html>