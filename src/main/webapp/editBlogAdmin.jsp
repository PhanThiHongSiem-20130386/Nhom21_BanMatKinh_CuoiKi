<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="shop.com.vn.model.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="./css/profile.css">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Admin- chỉnh sửa tài khoản</title>
</head>
<body>
<div class="container-xl px-4 mt-4">


    <%
        Blog b = (Blog) request.getAttribute("b");


    %>
    <!-- Account page navigation-->
    <div class="container container-profile" style="margin-top: 90px;">


        <nav class="nav nav-borders">
            <a class="nav-link active ms-0" href="#" target="__blank">Nội dung</a>
        </nav>


        <div class="row">
            <div class="col-xl-4">
                <!-- Profile picture card-->
                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Ảnh</div>
                    <div class="card-body text-center">
                        <img class="img-account-profile rounded-circle mb-2" src="<%=b.getImg()%>" alt="">
                    </div>
                    <button class="btn btn-primary" type="button">Đổi ảnh</button>
                </div>
            </div>
            <div class="col-xl-8">
                <!-- Account details card-->
                <div class="card mb-4">
                    <div class="card-header">Nội dung</div>
                    <div class="card-body">
                        <form action="edit_blogadmin" method="post">
                            <!-- Form Group (username)-->
                            <input type="hidden" value="<%=b.getIdb()%>" name="idb">
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <div>
                                        <label class="small mb-1" for="inputUsername">Tiêu đề</label>
                                        <input class="form-control" id="inputUsername" type="text"
                                               name="topic"
                                               placeholder="Enter your username" value="<%=b.getTopic()%>">
                                    </div>
                                    <div>
                                        <label class="small mb-1" for="inputFirstName">Câu hỏi</label>
                                        <input class="form-control"
                                               name="menu"
                                               id="inputFirstName" type="text"
                                               placeholder="Enter your first name" value="<%=b.getMenu()%>">
                                    </div>
                                    <div>
                                        <label class="small mb-1" for="inputFirstName">Hinh anhr</label>
                                        <input class="form-control"
                                               name="img"
                                               id="inputFirstName1" type="text"
                                               placeholder="Enter your first name" value="<%=b.getImg()%>">
                                    </div>
                                    <div>
                                        <label class="small mb-1" for="inputEmailAddress">Nội dung</label>
                                        <textarea id="inputEmailAddress" class="form-control" rows="10" name="content">
                                            <%=b.getContent()%>
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                            <!-- Form Row-->

                            <button class="btn btn-primary" type="submit">Lưu thông tin</button>


                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>
</body>
</html>
