<%@page import="sample.dtos.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="style/style.css" type="text/css">
    </head>
    <body>


        <!-- Page Preloder -->

        <!-- Header Section Begin -->
        <header class="header-section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="logo">
                            <a href="./index.html">
                                <img src="img/icons/logo-Downtown2.png" alt="" style="height: 80px; width: 240px;">
                            </a>
                        </div>
                        <ul class="main-menu">
                            <li><a href="./index.jsp">Home</a></li>
                            <li><a href="./search.html">Search Results</a></li>
                            <li><a href="./about.jsp">Categories</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                                <%
                                    UserDTO userDTO = (UserDTO) session.getAttribute("USERDTO");
                                %>
                                <%if (userDTO == null) {%>
                            <li><a href="./login.html">Login</a></li>
                                <%} else {%>

                            <li> <a href="./login.html">Hi <c:out value="${sessionScope.USERDTO.userName}"/> !!</a></li>
                                <%}%>

                            
                            <li>

                                <a href="./shopping-cart.html">
                                    <img src="img/icons/bag2.png" alt="" style="height: 25px; width: 25px;">
                                    <span>
                                        <%
                                            String numProduct = (String) session.getAttribute("NUMPRODUCT");
                                        %>
                                        <%if (numProduct != null) {%>
                                        <%=numProduct%>
                                        <%} else {%>
                                        <% numProduct = "0";
                                            session.setAttribute("NUMPRODUCT", numProduct);
                                        %>
                                        <%=numProduct%>
                                        <%}%>
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <div id="mobile-menu-wrap"></div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->
        <!-- Hero Section Begin -->
        <section class="hero-section home-page set-bg" data-setbg="img/bg.jpg">
            <div class="container hero-text text-white">
                <h2>Find your next</h2>
                <h1>dream home</h1>
            </div>
        </section>
    </body>
</html>  