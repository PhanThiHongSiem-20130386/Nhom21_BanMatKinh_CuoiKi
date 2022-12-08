<%@ page import="shop.com.vn.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.ListCategoryItem" %>
<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="shop.com.vn.service.ProductService" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="header">
    <div class="header-wrapper">
        <div class="header-main nav-dark">
            <div class="header-inner container">
                <div class=" list-nav" id="logo">
                    <a href="./index.html" title="DST Eyewear - Mắt Kính Chính Hãng, Gía tốt #1">

                        <img src="assets/image/slideHome/logo.png" class="logo-header-dark" alt="">

                    </a>
                </div>
                <div class="list-nav" id="nav">
                    <ul class="center-nav">
                        <li>
                            <a href="home">Trang chủ</a>
                        </li>
                        <% List<Category> listC = ProductService.getListCategories();
                            List<ListCategoryItem> listCC = ProductService.getListC();
                            for (Category c : listC) {
                        %>
                        <li>
                            <a href="category?cid=<%=c.getIdCategory()%>"><%= c.getNameC()%>
                                <i class="ti-angle-down"></i>
                            </a>
                            <ul class="subnav">
                                <%
                                    for (ListCategoryItem cc : listCC) {
                                        if (cc.getIdc() == c.getIdCategory()) {
                                %>
                                <li><a href="categoryi?idI=<%=cc.getId()%>"><%= cc.getname() %>
                                </a></li>
                                <% } %>
                                <% }%>
                            </ul>
                        </li>
                        <%}%>
                        <!-- Tròng kính -->

                        <li>
                            <a href="blog">Blog</a>
                        </li>
                    </ul>
                </div>


                <div class="list-nav" id="right-header">
                    <ul class="right-nav">
                        <form action="search">

                            <li class="item-nav box">
                                <div class="container-1">
                                    <button class="icon" type="submit">
                                        <i class="ti-search"></i>
                                    </button>
                                    <input name="search" type="search" id="search" placeholder="Tìm kiếm..."/>
                                </div>
                            </li>

                        </form>
                        <%
                            Account ac = (Account) request.getSession().getAttribute("auth");
                            if (ac == null) {

                        %>
                        <li class="item-nav user">
                            <a href="login.jsp" class="true">
                                <i class="ti-user"></i>
                            </a>
                        </li>
                        <% }%>

                        <%
                            if (ac != null) {
//                            phân quyền
                                if (ac.getIsadmin() == 1) {
                        %>
                        <li class="item-nav user">
                            <a href="admin.jsp" class="ue">
                                </i>Chào <%=ac.getUser()%>
                            </a>
                        </li>
                        <% }%>
                        <% if (ac.getIsadmin() != 1) {%>
                        <li class="item-nav user">
                            <a href="profile" class="ue">
                                <i class="ti-user"></i>Chào <%=ac.getUser()%>
                            </a>
                        </li>
                        <% }%>
                        <% }%>

                        <li class="item-nav ">
                            <a href="show-cart" class="cart-header" title="giỏ hàng">
                                <i class="ti-shopping-cart"></i>
                            </a>
                            <!--chi tiet gio hang-->
                            <div class="small-container cart-page">
                                <table>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th></th>
                                        <th>Số lượng</th>
                                    </tr>
                                    <tr>
                                        <td>
                                    <tr>
                                        <div class="cart-info">
                                            <td>
                                                <img src="">
                                            </td>
                                            <td>
                                                <div>
                                                    <p>product name</p>
                                                    <small>Price: 390000</small>
                                                    <br>
                                                    <a href="">Remove</a>
                                                </div>
                                            </td>
                                            <td><input type="number" value="1"></td>
                                        </div>
                                    </tr>
                                    </td>
                                    </tr>
                                </table>
                                <div class="total-price">
                                    <table>
                                        <tr>
                                            <td>Giá:</td>
                                            <td>39000</td>
                                        </tr>
                                        <tr>
                                            <td>Tiền vận chuyển:</td>
                                            <td>39000</td>
                                        </tr>
                                        <tr>
                                            <td>Thành tiền:</td>
                                            <td>39000</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <label for="nav-mobile-input" class="nav-bar-btn">
        <div class="mobile-header">

            <div class="icon-menu">
                <i class="  ti-menu-alt"></i>
            </div>
            <div class="nav-mobile-logo">
                <a href="./index.html">
                    <img src="./image/logo/DST (1089 × 371 px) (4).png" alt="">
                </a>
            </div>
            <div class="nav-mobile-cart">
                <i class="ti-shopping-cart"></i>
            </div>
        </div>
    </label>

    <input type="checkbox" name="" class="nav__input" id="nav-mobile-input">
    <label for="nav-mobile-input" class="nav__overlay">
    </label>

    <!-- nav mobile -->
    <div class="nav__mobile">
        <label for="nav-mobile-input" class="nav__mobile__close">
            <i class="ti-close"></i>
        </label>
        <div class="nav__list__mobile">
            <div class="nav__inner__mobile container">
                <div class=" list__nav__item">
                    <a href="./index.html" class="mobile-link icon"
                       title="DST Eyewear - Mắt Kính Chính Hãng, Gía tốt #1">
                        <img src="./image/logo/DST (1089 × 371 px) (4).png"
                             class="logo-header-dark-mobile" alt="">
                    </a>
                </div>
                <div class="list__nav__item">
                    <ul class="right-nav-mob">
                        <li class="item-nav box">
                            <div class="container-1">
                                        <span class="icon">
                                            <i class="ti-search"></i>
                                        </span>
                                <input type="search" id="search" placeholder="Tìm kiếm..."/>
                            </div>
                        </li>
                        <!-- <li class="item-nav user">
                            <a href="" class="logged">
                                <i class="ti-user"></i>
                            </a>

                        </li> -->
                        <!-- <li class="item-nav cart">
                            <a href="" class="cart-header" title="giỏ hàng">
                                <i class="ti-shopping-cart"></i>
                            </a>
                        </li> -->
                    </ul>
                </div>
                <div class="list__nav__item">
                    <ul class="center-nav-mobile">
                        <li>
                            <a href="./index.html" class="mobile-link">Trang chủ</a>
                        </li>
                        <li class="cat-item-mobile cat-parent cat-item-2  has-child">
                            <a href="./KinhMat.html">Kính mát</a>
                            <button class="toggle collapsed" data-toggle="collapse" data-target="#collapse2"
                                    aria-expanded="false" aria-controls="collapse2">
                                <i class="ti-angle-down"></i>
                            </button>
                            <!-- <ul class="children collapse" id="collapse2">
                                <li class="cat-item-mobile item-2-children1 item-public">
                                    <a href="./KinhMatEmBe.html">Kính mát em bé</a>
                                </li>
                                <li class="cat-item-mobile item-2-children2 item-public">
                                    <a href="./KinhMatNam.html">Kính mát nam</a>
                                </li>
                                <li class="cat-item-mobile item-2-children3 item-public">
                                    <a href="./KinhMatNu.html">Kính mát nữ</a>
                                </li>
                            </ul> -->
                        </li>
                        <!-- Tròng kính -->
                        <li class="cat-item-mobile cat-parent cat-item-3  has-child">
                            <a href="TrongKinh.jsp">Tròng kính</a>
                            <button class="toggle collapsed" data-toggle="collapse" data-target="#collapse3"
                                    aria-expanded="false" aria-controls="collapse3">
                                <i class="ti-angle-down"></i>
                            </button>
                            <!-- <ul class="children collapse" id="collapse3">
                                <li class="cat-item-mobile item-3-children1 item-public">
                                    <a href="./TrongCan.html">Tròng cận</a>
                                </li>
                                <li class="cat-item-mobile item-3-children2 item-public">
                                    <a href="./TrongChongASXanh.html">Tròng chống ánh xanh</a>
                                </li>
                                <li class="cat-item-mobile item-3-children3 item-public">
                                    <a href="./TrongNgayDem.html">Tròng chốt chói ngày & đêm</a>
                                </li>
                                <li class="cat-item-mobile item-3-children3 item-public">
                                    <a href="./TrongChongUV.HTML">Tròng chốt tia UV</a>
                                </li>
                                <li class="cat-item-mobile item-3-children3 item-public">
                                    <a href="./TrongDoiMau.html">Tròng đổi màu</a>
                                </li>
                                <li class="cat-item-mobile item-3-children3 item-public">
                                    <a href="./TrongSieuMong.html">Tròng siêu mỏng</a>
                                </li>
                            </ul> -->
                        </li>
                        <!-- Gọng kính -->
                        <li class="cat-item-mobile cat-parent cat-item-1 has-child">
                            <a href="category.jsp">Gọng kính</a>
                            <button class="toggle collapsed" data-toggle="collapse" data-target="#collapse1"
                                    aria-expanded="false" aria-controls="collapse1">
                                <i class="ti-angle-down"></i>
                            </button>
                            <!-- <ul class="children collapse" id="collapse1">
                                <li class="cat-item-mobile item-1-children1 item-public">
                                    <a href="./GongKinhKhongVien.html">Gọng không viền</a>
                                </li>
                                <li class="cat-item-mobile item-1-children2 item-public">
                                    <a href="./GongKinhKimLoai.html">Gọng kính kim loại</a>
                                </li>
                                <li class="cat-item-mobile item-1-children3 item-public">
                                    <a href="./GongKinhNhua.html">Gọng kính nhựa</a>
                                </li>
                                <li class="cat-item-mobile item-1-children4 item-public">
                                    <a href="./GongKinhKimLoai.html">Gọng nhựa phối kim loại</a>
                                </li>
                                <li class="cat-item-mobile item-1-children5 item-public">
                                    <a href="./GongTitan.html">Gọng titan</a>
                                </li>
                                <li class="cat-item-mobile item-1-children6 item-public">
                                    <a href="./GongTron.html">Gọng tròn</a>
                                </li>
                            </ul> -->
                        </li>
                        <li>
                            <a href="blog" class="mobile-link">Blog</a>
                        </li>
                    </ul>
                </div>


            </div>

        </div>

    </div>
</header>