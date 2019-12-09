<%-- 
    Document   : showHouses
    Created on : Dec 4, 2019, 9:21:03 PM
    Author     : sonho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            String urlPic = "img/rooms/1.jpg";
        %>
        <section class="hotel-rooms spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="room-items">
                            <div class="room-img set-bg" data-setbg="img/rooms/1.jpg">
                                <img src="<%=urlPic%>" style="width: 100%; height: 100%;"/>
                                <a href="#" class="room-content">
                                    <i class="flaticon-heart"></i>
                                </a>
                            </div>
                            <div class="room-text">
                                <div class="room-details">
                                    <div class="room-title">
                                        <h5>Country Style House with beautiful garden and terrace</h5>
                                        <a href="#"><i class="flaticon-placeholder"></i> <span>Location</span></a>
                                        <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                Map</span></a>
                                    </div>
                                </div>
                                <div class="room-features">
                                    <div class="room-info">
                                        <div class="size">
                                            <p>Lot Size</p>
                                            <img src="img/rooms/size.png" alt="">
                                            <i class="flaticon-bath"></i>
                                            <span>2561 sqft</span>
                                        </div>
                                        <div class="beds">
                                            <p>Beds</p>
                                            <img src="img/rooms/bed.png" alt="">
                                            <span>9</span>
                                        </div>
                                        <div class="baths">
                                            <p>Baths</p>
                                            <img src="img/rooms/bath.png" alt="">
                                            <span>2</span>
                                        </div>
                                        <div class="garage">
                                            <p>Garage</p>
                                            <img src="img/rooms/garage.png" alt="">
                                            <span>1</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="room-price">
                                    <p>For Sale</p>
                                    <span>$345,000</span>
                                </div>
                                <a href="#" class="site-btn btn-line">View Property</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-items">
                            <div class="room-img set-bg" data-setbg="img/rooms/2.jpg">
                                <img src="img/rooms/2.jpg" style="width: 100%; height: 100%;"/>
                                <a href="#" class="room-content">
                                    <i class="flaticon-heart"></i>
                                </a>
                            </div>
                            <div class="room-text">
                                <div class="room-details">
                                    <div class="room-title">
                                        <h5>Country Style House with beautiful garden and terrace</h5>
                                        <a href="#"><i class="flaticon-placeholder"></i> <span>Location</span></a>
                                        <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                Map</span></a>
                                    </div>
                                </div>
                                <div class="room-features">
                                    <div class="room-info">
                                        <div class="size">
                                            <p>Lot Size</p>
                                            <img src="img/rooms/size.png" alt="">
                                            <i class="flaticon-bath"></i>
                                            <span>2561 sqft</span>
                                        </div>
                                        <div class="beds">
                                            <p>Beds</p>
                                            <img src="img/rooms/bed.png" alt="">
                                            <span>9</span>
                                        </div>
                                        <div class="baths">
                                            <p>Baths</p>
                                            <img src="img/rooms/bath.png" alt="">
                                            <span>2</span>
                                        </div>
                                        <div class="garage">
                                            <p>Garage</p>
                                            <img src="img/rooms/garage.png" alt="">
                                            <span>1</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="room-price">
                                    <p>For Sale</p>
                                    <span>$345,000</span>
                                </div>
                                <a href="#" class="site-btn btn-line">View Property</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-items">
                            <div class="room-img set-bg" data-setbg="img/rooms/3.jpg">
                                <img src="img/rooms/3.jpg" style="width: 100%; height: 100%;"/>
                                <a href="#" class="room-content">
                                    <i class="flaticon-heart"></i>
                                </a>
                            </div>
                            <div class="room-text">
                                <div class="room-details">
                                    <div class="room-title">
                                        <h5>Country Style House with beautiful garden and terrace</h5>
                                        <a href="#"><i class="flaticon-placeholder"></i> <span>Location</span></a>
                                        <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                Map</span></a>
                                    </div>
                                </div>
                                <div class="room-features">
                                    <div class="room-info">
                                        <div class="size">
                                            <p>Lot Size</p>
                                            <img src="img/rooms/size.png" alt="">
                                            <i class="flaticon-bath"></i>
                                            <span>2561 sqft</span>
                                        </div>
                                        <div class="beds">
                                            <p>Beds</p>
                                            <img src="img/rooms/bed.png" alt="">
                                            <span>9</span>
                                        </div>
                                        <div class="baths">
                                            <p>Baths</p>
                                            <img src="img/rooms/bath.png" alt="">
                                            <span>2</span>
                                        </div>
                                        <div class="garage">
                                            <p>Garage</p>
                                            <img src="img/rooms/garage.png" alt="">
                                            <span>1</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="room-price">
                                    <p>For Sale</p>
                                    <span>$345,000</span>
                                </div>
                                <a href="#" class="site-btn btn-line">View Property</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-items">
                            <div class="room-img set-bg" data-setbg="img/rooms/4.jpg">
                                <img src="img/rooms/4.jpg" style="width: 100%; height: 100%;"/>
                                <a href="#" class="room-content">
                                    <i class="flaticon-heart"></i>
                                </a>
                            </div>
                            <div class="room-text">
                                <div class="room-details">
                                    <div class="room-title">
                                        <h5>Country Style House with beautiful garden and terrace</h5>
                                        <a href="#"><i class="flaticon-placeholder"></i> <span>Location</span></a>
                                        <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                Map</span></a>
                                    </div>
                                </div>
                                <div class="room-features">
                                    <div class="room-info">
                                        <div class="size">
                                            <p>Lot Size</p>
                                            <img src="img/rooms/size.png" alt="">
                                            <i class="flaticon-bath"></i>
                                            <span>2561 sqft</span>
                                        </div>
                                        <div class="beds">
                                            <p>Beds</p>
                                            <img src="img/rooms/bed.png" alt="">
                                            <span>9</span>
                                        </div>
                                        <div class="baths">
                                            <p>Baths</p>
                                            <img src="img/rooms/bath.png" alt="">
                                            <span>2</span>
                                        </div>
                                        <div class="garage">
                                            <p>Garage</p>
                                            <img src="img/rooms/garage.png" alt="">
                                            <span>1</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="room-price">
                                    <p>For Sale</p>
                                    <span>$345,000</span>
                                </div>
                                <a href="#" class="site-btn btn-line">View Property</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-items">
                            <div class="room-img set-bg" data-setbg="img/rooms/5.jpg">
                                <img src="img/rooms/5.jpg" style="width: 100%; height: 100%;"/>
                                <a href="#" class="room-content">
                                    <i class="flaticon-heart"></i>
                                </a>
                            </div>
                            <div class="room-text">
                                <div class="room-details">
                                    <div class="room-title">
                                        <h5>Country Style House with beautiful garden and terrace</h5>
                                        <a href="#"><i class="flaticon-placeholder"></i> <span>Location</span></a>
                                        <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                Map</span></a>
                                    </div>
                                </div>
                                <div class="room-features">
                                    <div class="room-info">
                                        <div class="size">
                                            <p>Lot Size</p>
                                            <img src="img/rooms/size.png" alt="">
                                            <i class="flaticon-bath"></i>
                                            <span>2561 sqft</span>
                                        </div>
                                        <div class="beds">
                                            <p>Beds</p>
                                            <img src="img/rooms/bed.png" alt="">
                                            <span>9</span>
                                        </div>
                                        <div class="baths">
                                            <p>Baths</p>
                                            <img src="img/rooms/bath.png" alt="">
                                            <span>2</span>
                                        </div>
                                        <div class="garage">
                                            <p>Garage</p>
                                            <img src="img/rooms/garage.png" alt="">
                                            <span>1</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="room-price">
                                    <p>For Sale</p>
                                    <span>$345,000</span>
                                </div>
                                <a href="#" class="site-btn btn-line">View Property</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-items">
                            <div class="room-img set-bg" data-setbg="img/rooms/6.jpg">
                                <img src="img/rooms/6.jpg" style="width: 100%; height: 100%;"/>
                                <a href="#" class="room-content">
                                    <i class="flaticon-heart"></i>
                                </a>
                            </div>
                            <div class="room-text">
                                <div class="room-details">
                                    <div class="room-title">
                                        <h5>Country Style House with beautiful garden and terrace</h5>
                                        <a href="#"><i class="flaticon-placeholder"></i> <span>Location</span></a>
                                        <a href="#" class="large-width"><i class="flaticon-cursor"></i> <span>Show on
                                                Map</span></a>
                                    </div>
                                </div>
                                <div class="room-features">
                                    <div class="room-info">
                                        <div class="size">
                                            <p>Lot Size</p>
                                            <img src="img/rooms/size.png" alt="">
                                            <i class="flaticon-bath"></i>
                                            <span>2561 sqft</span>
                                        </div>
                                        <div class="beds">
                                            <p>Beds</p>
                                            <img src="img/rooms/bed.png" alt="">
                                            <span>9</span>
                                        </div>
                                        <div class="baths">
                                            <p>Baths</p>
                                            <img src="img/rooms/bath.png" alt="">
                                            <span>2</span>
                                        </div>
                                        <div class="garage">
                                            <p>Garage</p>
                                            <img src="img/rooms/garage.png" alt="">
                                            <span>1</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="room-price">
                                    <p>For Sale</p>
                                    <span>$345,000</span>
                                </div>
                                <a href="#" class="site-btn btn-line">View Property</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
