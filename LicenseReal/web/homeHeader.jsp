<%-- 
    Document   : homeHeader
    Created on : 30-09-2023, 00:53:53
    Author     : HP Pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header class="header">
            <div class="main__navbar">
                <div class="container mx-auto d-flex align-items-center gap-1 justify-content-between">
                    <div class="logo">
                        <a to="/#" class="d-flex align-items-center gap-2">
                            <img src="https://cdn-icons-png.flaticon.com/512/6556/6556219.png" alt="Logo" class="w-8 h-8" />
                            <h3 class="text-xl font-bold uppercase">DaoTaoLaiXe</h3>
                        </a>
                    </div>

                    <div class="menu">
                        <a class="menu_items menu_items_active" href="home.jsp">Home</a>
                        <a class="menu_items" to="/#">Hỗ trợ</a>
                        <a class="menu_items" to="/#">Thông tin lý thuyết</a>
                        <a class="menu_items" to="/#">Lịch thi</a>
                        <a class="menu_items" href="MainController?action=testExamServlet">Thi thử trắc nghiệm</a>
                        <a class="btn_login" href="login.jsp">Log in</a>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
