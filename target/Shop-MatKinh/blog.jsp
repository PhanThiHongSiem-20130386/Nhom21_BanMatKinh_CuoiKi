<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.Blog" %>
<%@ page import="shop.com.vn.service.BlogService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="en">

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

    <title>DST-Mắt kính hàng đầu Việt Nam</title>


</head>

<body>

<div id="main">
    <!-- begin header -->
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <%
            List<Blog> blogList = BlogService.getAllBlog();
            for (Blog b : blogList) {
        %>
        <h5 class="title-h5"><%=b.getTopic()%>
        </h5>
        <!-- <P class="line"></P> -->

        <div class="categ">
            <ol start="1">
                <li class="categ-1">
                    <%=b.getMenu()%>
                </li>

                <img class="measure" src="<%=b.getImg()%>>" alt="đo kính">
                <p class="text">
                    <%=b.getContent()%>
                </p>
            </ol>
        </div>
        <%}%>


        <!-- <img class="measure" src="assets/image/slideHome/do-kinh1.png" alt="đo kính"> -->
    </div>

</div>
<div class="clearfix"></div>

<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>

</div>


<!-- blog -->

</body>

</html>