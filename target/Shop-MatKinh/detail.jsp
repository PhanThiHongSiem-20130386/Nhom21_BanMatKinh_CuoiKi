<%@ page import="shop.com.vn.model.Product" %>
<%@ page import="shop.com.vn.model.Cart" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.Review" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="./image/logo/DST%20(1089%20×%20371%20px)%20(4).png" rel="icon"/>
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link href="./css/detailProduct.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
    NumberFormat nf = NumberFormat.getInstance();
    nf.setMinimumFractionDigits(0);
    Product p = (Product) request.getAttribute("product");

%>
<div class="pd-wrap" style="margin-top: 90px">
    <div class="container">
        <div class="heading-section">
            <h2>SẢN PHẨM</h2>
        </div>
        <div class="row">
            <div class="col-md-6">
                <img src="<%=p.getImg()%>" style="height: 100%"/>

            </div>

            <div class="col-md-6">
                <div class="product-dtl">
                    <div class="product-info">
                        <div class="product-name"><%=p.getName()%>
                        </div>
                       
                        <div class="product-price-discount"><span
                                style="color: #111111"> <%=nf.format(p.getPrice())%>đ</span>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-md-6">
                            <label for="color">Màu</label>
                            <select id="color" name="color" class="form-control">
                                <option>Blue</option>
                                <option>Green</option>
                                <option>Red</option>
                            </select>
                        </div>
                    </div>
                    <div class="product-count">
                        <label for="size">Số lượng </label>
                        <form action="#" class="display-flex">
                            <div class="qtyminus">-</div>
                            <input type="text" name="quantity" value="1" class="qty">
                            <div class="qtyplus">+</div>
                        </form>
                        <a href="cart?command=insertItem&product_id=<%=p.getId ()%>"
                           class="round-black-btn">Thêm vào giỏ hàng</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-info-tabs">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
                       aria-controls="description" aria-selected="true">Mô tả</a>
                </li>
                <li class="nav-item">
                    <%
                        List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
                    %>
                    <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab"
                       aria-controls="review"
                       aria-selected="false">Đánh giá (<%=reviewList.size()%>)</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="description" role="tabpanel"
                     aria-labelledby="description-tab">
                    <%=p.getInformation()%>
                </div>
                <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="review-heading">Đánh giá</div>
                    <%

                        for (Review r : reviewList) {

                    %>
                    <p class="mb-20"><%=r.getContent()%>
                    </p>
                    <hr style=" border: 1px solid #111111; width: 100px; ">

                    <%}%>
                    <form class="review-form" action="review">
                        <%--                        <div class="form-group">--%>
                        <%--                            <label>Your rating</label>--%>
                        <%--                            <div class="reviews-counter">--%>
                        <%--                                <div class="rate">--%>
                        <%--                                    <input type="radio" id="star5" name="rate" value="5"/>--%>
                        <%--                                    <label for="star5" title="text">5 stars</label>--%>
                        <%--                                    <input type="radio" id="star4" name="rate" value="4"/>--%>
                        <%--                                    <label for="star4" title="text">4 stars</label>--%>
                        <%--                                    <input type="radio" id="star3" name="rate" value="3"/>--%>
                        <%--                                    <label for="star3" title="text">3 stars</label>--%>
                        <%--                                    <input type="radio" id="star2" name="rate" value="2"/>--%>
                        <%--                                    <label for="star2" title="text">2 stars</label>--%>
                        <%--                                    <input type="radio" id="star1" name="rate" value="1"/>--%>
                        <%--                                    <label for="star1" title="text">1 star</label>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <div class="form-group">
                            <label>Đánh giá của bạn</label>
                            <textarea class="form-control" rows="10" name="content"></textarea>
                        </div>

                        <%
                            Account ac = (Account) request.getSession().getAttribute("auth");

                            if (ac != null) {


                        %>
                        <input name="idp" value="<%=p.getId()%>" type="hidden">
                        <input name="ida" value="<%=ac.getId()%>" type="hidden">
                        <button class="btn btn-primary" type="submit">Đánh giá</button>
                        <%} else {%>
                        <button class="btn btn-primary">Đăng nhập để dánh giá</button>
                        <%}%>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
