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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Title</title>
</head>
<body>
<% List<Account> listAccount = (List<Account>) request.getAttribute("listAccount");

%>
<div class="container mt-5">
    <!-- row -->
    <div class="row tm-content-row">
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
                                <a href="edit_Accountadmin.jsp" style="color: #111111">
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
                            <td class="tm-product-name">
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
