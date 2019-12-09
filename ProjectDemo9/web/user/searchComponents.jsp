<%-- 
    Document   : searchComponents
    Created on : Dec 4, 2019, 8:54:43 PM
    Author     : sonho
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="sample.utils.DBUtils"%>
<%@page import="java.sql.Connection"%>
<%@page import="sample.dtos.WayDTO"%>
<%@page import="sample.dtos.CityDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

        <!-- Filter Search Section Begin -->
        <div class="filter-search">
            <div class="container ">
                <div class="row">
                    <div class="col-lg-12">
                        <form class="filter-form" action="MainController">           
                            <div class="location">
                                <%
                                    List<CityDTO> listCity = (List<CityDTO>) session.getAttribute("LISTCITY");
                                    if (listCity == null) {%>
                                <%
                                        response.sendRedirect("GetListCityController");
                                        return;
                                    }
                                %>
                                <!--    <form action="MainController"> -->
                                <p>City</p>
                                <select class="filter-location" name="city" id="city" onchange="this.form.submit();">
                                    <option value="">--Choose a city</option>
                                    <%
                                        for (CityDTO x : listCity) {%>
                                    <option value="<%=x.getIdCity()%>"
                                            <%
                                                if (request.getParameter("city") != null) {
                                                    if (x.getIdCity().equalsIgnoreCase(request.getParameter("city"))) {
                                                        out.print("selected");
                                                    }
                                                }
                                            %>    
                                            ><%=x.getNameCity()%></option>
                                    <%}%>
                                    <input type="hidden" name="action" value="GetListWay"/>
                                </select>
                                <!-- <form> -->
                            </div>
                            <%
                                List<WayDTO> listWay = (List<WayDTO>) session.getAttribute("LISTWAY");
                            %>
                            <div class="location">
                                <p>Way</p>
                                <select class="filter-location">
                                    <option value="">--Choose a way</option>
                                    <% if (listWay != null) {
                                            for (WayDTO x : listWay) {%>
                                    <option value="<%=x.getIdWay()%>">
                                        <%= x.getWayName()%>
                                    </option>
                                    <% }%>
                                    <%}%>

                                </select>
                            </div>
                            <div class="search-type">
                                <p>Property Type</p>
                                <select class="filter-property">
                                    <option value="">House</option>
                                    <option value="">Resort</option>
                                    <option value="">Hotel</option>
                                </select>
                            </div>
                            <div class="price-range" >
                                <p>Price Lower Than</p>
                                $<input type="number" name="txtPriceLower" size="10" step="10000" min='500000' max="1000000" value="1000000" style="width: 80%;"/>
                            </div>
                            <div class="price-range">
                                <p>Price Higher Than</p>
                                $<input type="number" name="txtPriceHigher" size="10" step="10000" min='200000' max="500000" value="200000" style="width: 80%;"/>
                            </div>
                            <div class="search-btn">
                                <button type="submit"><i class="flaticon-search"></i>Search</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Filter Search Section End -->
    </body>
</html>
