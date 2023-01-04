<%@ page import="shop.com.vn.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.Product" %>
<%@ page import="shop.com.vn.service.OrderService" %>
<%@ page import="shop.com.vn.model.ProductOrder" %>
<%@ page import="shop.com.vn.service.ProductOrderService" %>
<%@ page import="java.util.Collection" %>
<%@ page import="com.sun.xml.internal.ws.policy.privateutil.PolicyUtils" %>
<%@ page import="java.util.Collections" %>
<%@ page import="shop.com.vn.service.ProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    <link rel="stylesheet" href="./css/profile.css">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/order.css">
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">

    <title>Đơn hàng</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="main" style="min-height: 480px">
    <nav class="nav menu container" style="margin-top: 100px">
        <a class="nav-link active ms-0" href="profile">Hồ sơ</a>
        <a class="nav-link" href="buyOrder">Đơn hàng</a>
    </nav>

    <div class="container">
        <header class="card-header1"> Đơn hàng của tôi</header>
        <%

            List<Order> cartList = (List<Order>) request.getAttribute("orderList");
            Collections.reverse(cartList);


            for (Order order : cartList) {
                List<ProductOrder> productOrders = ProductOrderService.getProductOrderByIdO(String.valueOf(order.getIdorder()));
        %>
        <div class="card-body">
            <h6>Mã đơn hàng: <%=order.getIdorder()%>
            </h6>
            <article class="card">
                <div class="card-body row">
                    <div class="col"><strong>Thời gian dự kiến giao:</strong> <br>ngày 5 tháng 1 năm 2023</div>
                    <div class="col"><strong>Giao hàng bởi:</strong> <br> DST express, | <i class="fa fa-phone"></i>
                        +0362113708
                    </div>
                    <div class="col"><strong>Trạng thái:</strong> <br><%
                        String status = "";
                        if (order.getStatus() == 1) {
                            status = "Chờ xác nhận";
                        }
                        if (order.getStatus() == 2) {
                            status = "Giao hàng";
                        }
                        if (order.getStatus() == 3) {
                            status = "Đã nhận hàng";
                        }
                    %>
                        <%=status%>

                    </div>
                </div>
            </article>

            <hr>
            <ul class="row">

                <li class="col-md-4">
                    <figure class="itemside mb-3">
                        <%
                            for (ProductOrder po : productOrders) {
                          Product p = ProductService.getProductById(String.valueOf(po.getIdp()));

                        %>
                        <div class="aside"><img src="<%=p.getImg()%>" style="height: 50px; width: 50%;"></div>
                        <figcaption class=" info align-self-center">
                            <p class="title"><%=p.getName()%><span
                                    class="text-muted"><%=p.getPrice()%>đ</span>
                        </figcaption>
                        <%}%>
                    </figure>
                </li>

            </ul>
            <hr>

        </div>
        <%}%>
        <a href="home" class="btn btn-warning" data-abc="true" style="margin-bottom: 20px"> <i
                class="fa fa-chevron-left"></i> Trang chủ</a>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
