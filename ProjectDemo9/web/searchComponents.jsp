<%-- 
    Document   : searchComponents
    Created on : Dec 4, 2019, 8:54:43 PM
    Author     : sonho
--%>

<%@page import="sample.dtos.TypeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dtos.WayDTO"%>
<%@page import="sample.dtos.CityDTO"%>
<%@page import="java.util.List"%>
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

        <!-- Filter Search Section Begin -->
        <div class="filter-search">
            <div class="container ">
                <div class="row">
                    <div class="col-lg-12">
                        <form class="filter-form" action="MainController">   
                            <input type="hidden" name="action" value="Search"/>
                            <div class="location">
                                <%
                                    List<CityDTO> listCity = (List<CityDTO>) session.getAttribute("LISTCITY");
                                    if (listCity == null) {
                                        request.getRequestDispatcher("MainController?action=Search&priceLower=700000&priceHigher=200000").forward(request, response);
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
                                                String idCity = (String) session.getAttribute("IDCITY");
                                                if (idCity != null) {
                                                    if (x.getIdCity().equalsIgnoreCase(idCity)) {
                                                        out.print("selected");
                                                    }
                                                }
                                            %>    
                                            ><%=x.getNameCity()%>
                                    </option>
                                    <%}%>

                                </select>
                                <!-- <form> -->
                            </div>
                            <%
                                List<WayDTO> listWay = (List<WayDTO>) session.getAttribute("LISTWAY");
                            %>
                            <div class="location">
                                <p>Way</p>
                                <select class="filter-location" name="way" id="city" onchange="this.form.submit();">
                                    <option value="">--Choose a way</option>
                                    <% if (listWay != null) {
                                            for (WayDTO x : listWay) {%>
                                    <option value="<%=x.getIdWay()%>"
                                            <%
                                                String idWay = (String) session.getAttribute("IDWAY");
                                                if (idWay != null) {
                                                    if (x.getIdWay().equalsIgnoreCase(idWay)) {
                                                        out.print("selected");
                                                    }
                                                }
                                            %>
                                            >
                                        <%= x.getWayName()%>
                                    </option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="search-type">
                                <p>Property Type</p>
                                <select class="filter-property" name="type" id="city" onchange="this.form.submit();">
                                    <option value="">--Choose a type</option>
                                    <%
                                        List<TypeDTO> listType = (List<TypeDTO>) session.getAttribute("LISTTYPE");
                                        if (listType != null) {
                                            for (TypeDTO x : listType) {
                                    %>
                                    <option value="<%=x.getTypeID()%>"
                                            <%
                                                String typeId = (String) session.getAttribute("TYPEID");
                                                if (typeId != null) {
                                                    if (typeId.equalsIgnoreCase(x.getTypeID())) {
                                                        out.print("selected");
                                                    }
                                                }
                                            %>
                                            >
                                        <%=x.getTypeName()%>
                                    </option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <%
                                String priceLower = (String) request.getAttribute("PRICELOWER");
                                String priceHigher = (String) request.getAttribute("PRICEHIGHER");
                                if (priceLower == null) {
                                    priceLower = "700000";
                                }
                                if (priceHigher == null) {
                                    priceHigher = "200000";
                                }
                            %>
                            <div class="price-range">
                                <p>Price Lower Than</p>
                                $<input type="number" name="priceLower" size="10" step="10000" min='500000' max="1000000"
                                        value="<%=priceLower%>" style="width: auto;"/>
                            </div>
                            <div class="price-range">
                                <p>Price Higher Than</p>
                                $<input type="number" name="priceHigher" size="10" step="10000" min='100000' max="500000" 
                                        value="<%=priceHigher%>" style="width: 80%;"/>
                            </div>
                            <div class="search-btn">
                                <button type="submit" name="action" value="Search"><i class="flaticon-search"></i>Search</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Filter Search Section End -->
    </body>
</html>
