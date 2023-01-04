<%@ page import="shop.com.vn.model.shop" %>
<%@ page import="shop.com.vn.service.FooterService" %>
<%@ page import="shop.com.vn.service.ShopService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="cssAdmin/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>DST-Mắt kính hàng đầu Việt Nam</title>
    <link rel="stylesheet" href="./css/formDky.css">

</head>
<body>
<div class="footer">
    <div class="footer-wrap">
        <div id="block_3">
            <div class="ro  container" id="row-1713151878">
                <%
                    shop shop = ShopService.getShop();
                %>
                <div id="footer1" class="item-footer">
                    <div class="col-inner1">

                        <h4 style="font-size: 20px;color: #111111!important;">GIỚI THIỆU</h4>
                        <span style="font-size: 15px; color: #FFFFFF!important;">
                               <%=shop.getInformation()%>
                            </span>

                    </div>
                </div>

                <div id="footer2" class="item-footer">
                    <div class="col-inner2">
                        <h4 style="font-size: 20px;color: #111111!important;">LIÊN KẾT</h4>
                        <div class="ux-menu stack stack-col justify-start ux-menu--divider-solid">
                            <div class="ux-menu-link flex menu-item">
                                <a class="ux-menu-link__link flex">
                                        <span class="ux-menu-link__text" style="color: #FFFFFF!important;">
                                              <%=shop.getLink()%>
                                        </span>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>

                <div id="footer3" class="item-footer">
                    <div class="col-inner">
                        <h4 style="font-size: 20px;color: #111111!important;">THÔNG TIN LIÊN HỆ</h4>

                        <div class="phone-shop">
                            <a class="ux-menu-link__link flex">
                                    <span class="ux-menu-link__text" style="color: #FFFFFF!important;">
                                        SĐT:   <%=shop.getPhone()%>
                                    </span>
                            </a>
                        </div>
                        <div class="address-shop">
                            <a class="ux-menu-link__link flex">
                                    <span class="ux-menu-link__text" style="color: #FFFFFF!important;">
                                        Địa chỉ:   <%=shop.getAddress()%>
                                    </span>
                            </a>
                            <div class="mail-shop">
                                <a class="ux-menu-link__link flex">
                                    <span class="ux-menu-link__text" style="color: #FFFFFF!important;">
                                        Email:   <%=shop.getEmail()%>
                                    </span>
                                </a>
                            </div>
                            <div class="social-icons follow-icons" style="font-size:115%">
                                <a href="#" class="slow_fade social_button ">
                                    <i class="ti-facebook"style="color: #FFFFFF"></i>
                                </a>
                                <a href="#" class="slow_fade social_button">
                                    <i class="ti-twitter-alt"style="color: #FFFFFF"></i>
                                </a>
                                <a href="#" class="slow_fade social_button">
                                    <i class="ti-youtube" style="color: #FFFFFF"></i>
                                </a>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
</body>