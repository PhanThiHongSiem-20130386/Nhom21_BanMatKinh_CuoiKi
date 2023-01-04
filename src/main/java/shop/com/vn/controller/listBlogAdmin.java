package shop.com.vn.controller;

import shop.com.vn.model.Blog;
import shop.com.vn.service.BlogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "listBlogAdmin", value = "/list-BlogAdmin")
public class listBlogAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Blog> blogList = BlogService.getAllBlog();
        request.setAttribute("blogList", blogList);
        request.getRequestDispatcher("adminBolg.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
