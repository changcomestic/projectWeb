<%-- 
    Document   : showHouses
    Created on : Dec 4, 2019, 9:21:03 PM
    Author     : sonho
--%>

<%@page import="java.util.Map"%>
<%@page import="sample.dtos.DetailHouseDTO"%>
<%@page import="sample.daos.TypeDAO"%>
<%@page import="sample.daos.WayDAO"%>
<%@page import="sample.dtos.HouseDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
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
        <%
            List<HouseDTO> listHouse = (List<HouseDTO>) session.getAttribute("LISTHOUSE");
            Map<String, DetailHouseDTO> listDTHouse = (Map<String, DetailHouseDTO>) session.getAttribute("LISTHOUSEDETAIL");
        %>
        <section class="hotel-rooms spad">
            <div class="container">
                <div class="row">
                    <%
                        if (listHouse != null) {
                            for (HouseDTO dtoHouse : listHouse) {
                    %>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-items">
                            <div class="room-img set-bg" data-setbg="">
                                <img src="<%=dtoHouse.getPicHouse()%>" style="width: 100%; height: 100%;"/>
                                <a href="#" class="room-content">
                                    <i class="flaticon-heart"></i>
                                </a>
                            </div>
                            <div class="room-text">
                                <div class="room-details">
                                    <div class="room-title">
                                        <h5><%=dtoHouse.getDescription()%></h5>

                                        <a href="#"><i class="fas fa-road"></i>

                                            <span><%=listDTHouse.get(dtoHouse.getIdHouse()).getWayName()%></span>
                                        </a>
                                        <a href="#" class="large-width">
                                            <i class="fas fa-city"></i>
                                            <span><%=listDTHouse.get(dtoHouse.getIdHouse()).getCityName()%></span>
                                        </a>
                                        <a href="#" class="large-width">
                                            <i class="far fa-building"></i>
                                            <span> <%=listDTHouse.get(dtoHouse.getIdHouse()).getTypeName()%></span>
                                        </a>

                                    </div>
                                </div>
                                <div class="room-features">
                                    <div class="room-info">
                                        <div class="size">
                                            <p>Lot Size</p>
                                            <img src="img/rooms/size.png" alt=""/>
                                            <i class="flaticon-bath"></i>
                                            <span><%=dtoHouse.getFurniture().getLotSize() + ""%></span>
                                        </div>
                                        <div class="beds">
                                            <p>Beds</p>
                                            <img src="img/rooms/bed.png" alt=""/>
                                            <span><%=dtoHouse.getFurniture().getNumBed() + ""%></span>
                                        </div>
                                        <div class="baths">
                                            <p>Baths</p>
                                            <img src="img/rooms/bath.png" alt=""/>
                                            <span><%=dtoHouse.getFurniture().getNumBath() + ""%></span>
                                        </div>
                                        <div class="garage">
                                            <p>Garage</p>
                                            <img src="img/rooms/garage.png" alt=""/>
                                            <span><%=dtoHouse.getFurniture().getNumGarage() + ""%></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="room-price">
                                    <p>For Sale</p>
                                    <span>$<%=dtoHouse.getPrice() + ""%></span>
                                </div>
                                <a href="#" class="site-btn btn-line">View Property</a>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </section>
    </body>
</html>
