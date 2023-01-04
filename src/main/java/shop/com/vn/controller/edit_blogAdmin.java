package shop.com.vn.controller;

import shop.com.vn.model.Blog;
import shop.com.vn.service.BlogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminEditBlog", value = "/edit_blogadmin")
public class edit_blogAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idb = request.getParameter("idb");
        Blog b = BlogService.getBlogByIdBl(idb);
        request.setAttribute("b", b);
        request.getRequestDispatcher("editBlogAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idb = request.getParameter("idb");
        String topic = request.getParameter("topic");
        String menu = request.getParameter("menu");
        String content = request.getParameter("content");
        String img = request.getParameter("img");

        BlogService.editBlogByIdBl(idb, topic,menu, content, img);
        response.sendRedirect("list-BlogAdmin");
    }
}
