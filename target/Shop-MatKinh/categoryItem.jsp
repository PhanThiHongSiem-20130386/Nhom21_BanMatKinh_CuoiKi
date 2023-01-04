<%@ page import="shop.com.vn.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.Product" %>
<%@ page import="shop.com.vn.model.ListCategoryItem" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="shop.com.vn.service.ProductService" %>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/GongKinh.css">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <title>DST-Mắt kính Việt</title>
</head>

<body>
<div id="main">
    <!--        test push branch-->
    <!-- begin header -->

    <jsp:include page="header.jsp"></jsp:include>
    <!-- end header -->
    <!-- content -->


    <!-- content -->
    <div class="shop-page-title category-page-title page-title ">
        <div class="page-title-inner flex-row  medium-flex-wrap container">
            <div class="flex-col flex-grow medium-text-center">
                <div class="is-large">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">

                            <li class="breadcrumb-item"><a href="home">TRANG CHỦ</a></li>
                            <%
                                Category c = (Category) request.getAttribute("c");
                                ListCategoryItem lci = (ListCategoryItem) request.getAttribute("lci");
                            %>
                            <li class="breadcrumb-item"><a href="category?cid=<%=c.getIdCategory()%>"><%=c.getNameC()%>
                            </a></li>

                            <li class="breadcrumb-item " aria-current="page"><%=lci.getname()%>
                            </li>

                        </ol>
                    </nav>
                </div>

            </div>
            <div class="flex-col medium-text-center">
                <!-- <p class="woocommerce-result-count hide-for-medium">
                    Hiển thị tất cả 11 kết quả</p> -->
<%--                <form class="woocommerce-ordering" method="get">--%>
<%--                    <select name="orderby" class="orderby" aria-label="Đơn hàng của cửa hàng">--%>
<%--                        <option value="popularity" selected='selected'>Thứ tự theo mức độ phổ biến</option>--%>
<%--                        <option value="rating">Thứ tự theo điểm đánh giá</option>--%>
<%--                        <option value="date">Mới nhất</option>--%>
<%--                        <option value="price">Thứ tự theo giá: thấp đến cao</option>--%>
<%--                        <option value="price-desc">Thứ tự theo giá: cao xuống thấp</option>--%>
<%--                    </select>--%>
<%--                    <input type="hidden" name="paged" value="1"/>--%>
<%--                </form>--%>
            </div>
        </div>
    </div>
    <!--  nọi dung chính của trang -->
    <div id="content">
        <!-- chia trang thành 2 phần 1 phần là list product, 1 phần là danh mục sp -->
        <div class="category-page-row container">
            <!-- content trái -->
            <div class="left-category">
                <div class="shop-container">
                    <!--  chia 4 -->
                    <div class="list-product">
                        <ul class="products">
                            <%
                                NumberFormat nf = NumberFormat.getInstance();
                                nf.setMinimumFractionDigits(0);
                                List<Product> pByIdi = (List<Product>) request.getAttribute("listPByIdi");
                                for (Product p : pByIdi) {
                            %>
                            <li>
                                <div class="product-item">
                                    <div class="product-top">
                                        <a href="detail?id=<%=p.getId()%>" class="product-thumb">
                                            <img src="<%=p.getImg()%>" alt="">
                                        </a>

                                    </div>
                                    <div class="product-info">
                                        <a href="" class="product-name"><%=p.getName()%>
                                        </a>
                                        <div class="product-price"><%=nf.format(p.getPrice())%>đ</div>
                                        <!--btn lựa chọn nhanh-->
                                    </div>
                                </div>
                            </li>
                            <%}%>
                        </ul>

                    </div>
                </div>

            </div>
            <!--  content phải -->
            <div class="right-category">
                <div id="shop-sidebar" class="sidebar-inner">
                    <div class="inner-category">
                        <h6 class="widget-title">Danh mục sản phẩm</h6>
                        <div class="is-divider"></div>
                        <ul class="product-category">
                            <li class="cat-item cat-parent cat-item-1 has-child">
                                <a href="category?cid=3">Gọng kính</a>
                                <button class="toggle collapsed" data-toggle="collapse" data-target="#collapse1"
                                        aria-expanded="false" aria-controls="collapse1">
                                    <i class="ti-angle-down"></i>
                                </button>

                                <ul class="children collapse" id="collapse1">
                                    <%  List<ListCategoryItem> listCC3 = ProductService.getListC();
                                        for (ListCategoryItem cc : listCC3) {
                                            if (cc.getIdc() == 3) {
                                    %>
                                    <li class="cat-item item-1-children1 item-public">
                                        <a href="categoryi?idI=<%=cc.getId()%>"><%= cc.getname() %>
                                        </a>
                                    </li>
                                    <%
                                            }
                                        }
                                    %>
                                </ul>

                            </li>

                            <li class="cat-item cat-parent cat-item-2  has-child">
                                <a href="category?cid=1">Kính mát</a>
                                <button class="toggle collapsed" data-toggle="collapse" data-target="#collapse2"
                                        aria-expanded="false" aria-controls="collapse2">
                                    <i class="ti-angle-down"></i>
                                </button>

                                <ul class="children collapse" id="collapse2">
                                    <%  List<ListCategoryItem> listCC1 = ProductService.getListC();
                                        for (ListCategoryItem cc : listCC1) {
                                            if (cc.getIdc() == 1) {
                                    %>
                                    <li class="cat-item item-2-children1 item-public">
                                        <a href="categoryi?idI=<%=cc.getId()%>"><%= cc.getname() %>
                                        </a>
                                    </li>
                                    <%}}%>
                                </ul>
                            </li>

                            <li class="cat-item cat-parent cat-item-3  has-child">
                                <a href="category?cid=2">Tròng kính</a>
                                <button class="toggle collapsed" data-toggle="collapse" data-target="#collapse3"
                                        aria-expanded="false" aria-controls="collapse3">
                                    <i class="ti-angle-down"></i>
                                </button>
                                <ul class="children collapse" id="collapse3">
                                    <%  List<ListCategoryItem> listCC2 = ProductService.getListC();
                                        for (ListCategoryItem cc : listCC2) {
                                            if (cc.getIdc() == 2) {
                                    %>
                                    <li class="cat-item item-3-children1 item-public">
                                        <a href="categoryi?idI=<%=cc.getId()%>"><%= cc.getname() %>
                                        </a>
                                    </li>
                                    <%}}%>
                                </ul>
                            </li>

                        </ul>
                        <form action="filter-product">
                            <input name="cid" value="<%=ca.getIdCategory()%>" type="hidden">
                            <div class="border-bottom mb-4 pb-4">
                                <%
                                    String checked0 = (String) request.getAttribute("checked0");
                                    String checked1 = (String) request.getAttribute("checked1");
                                    String checked2 = (String) request.getAttribute("checked2");
                                    String checked3 = (String) request.getAttribute("checked3");
                                    String checked4 = (String) request.getAttribute("checked4");
                                %>
                                <h5 class="font-weight-semi-bold mb-4">Giá</h5>

                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input
                                            type="checkbox"
                                            name="price"
                                            class="custom-control-input check"
                                            <%=checked4%>
                                            id="price-all"
                                            value="1"/>
                                    <label class="custom-control-label" for="price-all">Tất cả</label>
                                    <span class="badge border font-weight-normal">70</span>
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input
                                            type="checkbox"
                                            name="price"
                                            <%=checked0%>
                                            class="custom-control-input check"
                                            value="0"
                                            id="price-1"/>
                                    <label class="custom-control-label" for="price-1">0 - 300,000đ</label>
                                    <span class="badge border font-weight-normal">150</span>
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input
                                            type="checkbox"
                                            name="price"
                                            value="300000"
                                            <%=checked1%>
                                            class="custom-control-input check"
                                            id="price-2"/>
                                    <label class="custom-control-label" for="price-2">300,000đ - 600,000đ</label>
                                    <span class="badge border font-weight-normal">295</span>
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input
                                            type="checkbox"
                                            name="price"
                                            value="600000"
                                            <%=checked2%>
                                            class="custom-control-input check"
                                            id="price-3"/>
                                    <label class="custom-control-label" for="price-3">600,000đ - 900,000đ</label>
                                    <span class="badge border font-weight-normal">246</span>
                                </div>
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input
                                            type="checkbox"
                                            name="price"
                                            value="900000"
                                            <%=checked3%>
                                            class="custom-control-input check"
                                            id="price-4"/>
                                    <label class="custom-control-label" for="price-4">900,000đ - 1,200,000đ</label>
                                    <%--                                    <span class="badge border font-weight-normal">246</span>--%>
                                </div>

                            </div>

                            <div>
                                <button
                                        class="btn btn-primary btn-block border-0 py-3 "
                                        style="border-radius: 5px; font-size: 25px; padding: 5px !important;"
                                        type="submit">
                                    Lọc
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="footer.jsp"></jsp:include>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
    function loadMore() {
        var amount = document.getElementsByClassName("listproduct").length;
        $.ajax({
            url: "load-more-product",
            type: "get", //send it through get method
            data: {
                exits: amount
            },
            success: function (response) {
                var productList = document.getElementById("contentProduct");
                productList.innerHTML += response;

            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
</script>

<script>
    $(document).ready(function () {
        $('.check').click(function () {
            $('.check').not(this).prop('checked', false);
        });
    });

</script>
</body>

</html>