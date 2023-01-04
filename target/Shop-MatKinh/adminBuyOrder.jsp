<%@ page import="java.util.List" %>

<%@ page import="shop.com.vn.service.CartService" %>
<%@ page import="shop.com.vn.service.ProductService" %>
<%@ page import="shop.com.vn.model.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="shop.com.vn.service.ProductOrderService" %>
<%@ page import="java.util.Collections" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./image/logo/DST%20(1089%20×%20371%20px)%20(4).png" rel="icon"/>
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="./css/templatemo-style.css"/>--%>

    <title>Quản lí đơn hàng</title>
</head>
<body>
<jsp:include page="headeradmin.jsp"></jsp:include>

<%--<div class="container mt-5">--%>
<!-- row -->
<div class="row tm-content-row">
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <div class="profile-sidebar">
            <div class="profile-userpic">
                <img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
            </div>
            <div class="profile-usertitle">
                <div class="profile-usertitle-name">Tên tài khoản</div>
                <div class="profile-usertitle-status"><span class="indicator label-success"></span>đang hoạt động</div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="divider"></div>
        <form role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Tìm kiếm">
            </div>
        </form>
        <jsp:include page="adminMenu.jsp"></jsp:include>
        <ul class="nav menu">


            <li><a href="profile?command=logout"><em class="fa fa-power-off">&nbsp;</em> Đăng xuất</a></li>
        </ul>
    </div><!--/.sidebar-->
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="admin">
                    <em class="fa fa-home"></em>
                </a></li>
                <li class="active">Đơn Hàng</li>
            </ol>
        </div>
        <div class="tm-bg-primary-dark tm-block tm-block-products">
            <h2 class="tm-block-title">Danh sách đơn hàng</h2>
            <div class="tm-product-table-container">
                <table class="table table-hover tm-table-small tm-product-table" style="overflow-y: auto">
                    <thead>
                    <tr>
                        <th scope="col">Mã đơn hàng</th>
                        <th scope="col">Họ và tên</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Tổng tiền</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        List<Order> orderList = (List<Order>) request.getAttribute("orderList");
                        Collections.reverse(orderList);
                        for (Order order : orderList) {
                    %>
                    <tr>
                        <td><%=order.getIdorder()%>
                        </td>
                        <td>
                            <a href="" style="color: #111111">
                                <%=order.getFirstName()%>
                            </a>
                        </td>

                        <td><%
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

                        </td>
                        <%
                            NumberFormat nf = NumberFormat.getInstance();
                            nf.setMinimumFractionDigits(0);
                            List<ProductOrder> productOrderList = ProductOrderService.getProductOrderByIdO(String.valueOf(order.getIdorder()));
                            int totalprice = 0;
                            for (ProductOrder po : productOrderList) {
                                Product p = ProductService.getProductById(String.valueOf(po.getIdp()));
                                totalprice += p.getPrice() * po.getQuantity();
                            }

                        %>
                        <td><%=nf.format(totalprice)%>
                        </td>
                        <td>
                            <a href="adminAccept?ido=<%=order.getIdorder()%>&status=<%=order.getStatus()%>" class="btn btn-primary" >Xác nhận</a>
                        </td>
                    </tr>
                    <%}%>


                    </tbody>
                </table>
            </div>
            <!-- table container -->
        </div>
    </div>


</div>


</div>

</body>
</html>
