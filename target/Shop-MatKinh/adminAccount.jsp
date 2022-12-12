<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.service.AccountService" %>
<%@ page import="shop.com.vn.model.IsAdmin" %>
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
    <link href="cssAdmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssAdmin/css/font-awesome.min.css" rel="stylesheet">
    <link href="cssAdmin/css/datepicker3.css" rel="stylesheet">
    <link href="cssAdmin/css/admin.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <title>DST EYESWEAR - ADMIN</title>
</head>
<body>
<jsp:include page="headeradmin.jsp"></jsp:include>

<% List<Account> listAccount = (List<Account>) request.getAttribute("listAccount");

%>

<%--<div class="container mt-5">--%>
<!-- row -->
<div class="row ">
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
        <ul class="nav menu">
            <li class="active"><a href="overview"><em class="fa fa-dashboard">&nbsp;</em> Tổng quan</a></li>
            <li><a href="account-edit"><em class="fa fa-calendar">&nbsp;</em> Quản lí tài khoản</a></li>
            <li><a href="product-edit"><em class="fa fa-toggle-off">&nbsp;</em> Quản lý sản phẩm</a></li>
            <li><a href=""><em class="fa fa-toggle-off">&nbsp;</em> Quản lý cửa hàng</a></li>
            <li><a href="../../../../TH_LAPTRINH/admin/charts.html"><em class="fa fa-bar-chart">&nbsp;</em> Thống kê</a>
            </li>

            <!--			<li><a href="panels.html"><em class="fa fa-clone">&nbsp;</em> Alerts &amp; Panels</a></li>-->
            <!--			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">-->
            <!--				<em class="fa fa-navicon">&nbsp;</em> Multilevel <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>-->
            <!--				</a>-->
            <!--				<ul class="children collapse" id="sub-item-1">-->
            <!--					<li><a class="" href="#">-->
            <!--						<span class="fa fa-arrow-right">&nbsp;</span> Sub Item 1-->
            <!--					</a></li>-->
            <!--					<li><a class="" href="#">-->
            <!--						<span class="fa fa-arrow-right">&nbsp;</span> Sub Item 2-->
            <!--					</a></li>-->
            <!--					<li><a class="" href="#">-->
            <!--						<span class="fa fa-arrow-right">&nbsp;</span> Sub Item 3-->
            <!--					</a></li>-->
            <!--				</ul>-->
            <!--			</li>-->
            <li><a href="profile?command=logout"><em class="fa fa-power-off">&nbsp;</em> Đăng xuất</a></li>
        </ul>
    </div><!--/.sidebar-->
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-products">
                <h2 class="tm-block-title">Danh sách tài khoản</h2>
                <div class="tm-product-table-container">
                    <table class="table table-hover tm-table-small tm-product-table">
                        <thead>
                        <tr>
                            <th scope="col">TÊN TÀI KHOẢN</th>
                            <th scope="col">EMAIL</th>
                            <th scope="col">CHỨC VỤ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Account acc : listAccount) {%>

                        <tr>
                            <td>
                                <a href="edit_accountadmin?idA=<%=acc.getId()%> "style="color: #111111">
                                    <%=acc.getUser()%>
                                </a>
                            </td>
                            <td><%=acc.getEmail()%>
                            </td>
                            <td><%=AccountService.getDepartment(String.valueOf(acc.getIsadmin())).getDepartment()%>
                            </td>

                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
                <!-- table container -->
            </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-product-categories" style="min-height: 725px;">
                <h2 class="tm-block-title">Chức vụ</h2>
                <div class="tm-product-table-container">
                    <table class="table tm-table-small tm-product-table">
                        <tbody>
                        <% List<IsAdmin> listDeparment = (List<IsAdmin>) request.getAttribute("listDeparment");
                            for (IsAdmin deparment : listDeparment) {
                        %>
                        <tr>
                            <td class="tm-product-name" style="float: left">
                                <%=deparment.getDepartment()%>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
                <!-- table container -->
                <a
                        href="add-category"
                        class="btn btn-primary btn-block text-uppercase mb-3"
                >Thêm chức vụ mới</a
                >
            </div>
        </div>
    </div>


</div>


</body>
</html>
