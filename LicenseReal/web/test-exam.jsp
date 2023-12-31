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

        <!-- màn hình chọn thông tin thi thử -->
        <div class="choose-exam-screen">
            <div class="container">
                <h1>Bắt đầu thi thử trắc nghiệm</h1>
                <form action="testExamServlet" method="POST">
                    <div class="form-group">
                        <label for="fullname">Họ và tên:</label>
                        <input type="text" id="fullname" class="form-control" name="name" required="">
                    </div>
                    <div class="form-group">
                        <label for="license">Hạng xe thi:</label>
                        <select id="license" class="form-select" name="option" required="">
                            <option selected disabled>Mở lựa chọn</option>
                            <option value="B2">Ô tô hạng B2 - số sàn</option>
<!--                            <option value="B2-manual">Ô tô hạng B1 - số sàn</option>
                            <option value="B1-automatic">Ô tô hạng B1 - số tự động</option>
                            <option value="C">Ô tô hạng C</option>
                            <option value="A2">Xe máy hạng A1</option>
                            <option value="A2">Xe máy hạng A2</option>
                            <option value="D">Nâng hạng D</option>
                            <option value="E">Nâng hạng E</option>
                            <option value="FC">Nâng hạng F C</option>-->
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exam">Chọn đề thi:</label>
                        <select id="exam" class="form-select" name="topic" required="">
                            <option selected disabled>Mở lựa chọn</option>
                            <option value="0">Chọn đề ngẫu nhiên</option>
                            <c:forEach var="x" items="${topicID}">
                                <option value="${x.topicID}">Đề thi số ${x.topicID}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-start">Bắt đầu thi</button>
                </form>

            </div>
        </div>
    </body>

</html>