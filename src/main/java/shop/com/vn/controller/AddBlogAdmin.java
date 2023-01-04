package shop.com.vn.controller;

import shop.com.vn.service.BlogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddBlogAdmin", value = "/add_blogadmin")
public class AddBlogAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addBlogAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String topic = request.getParameter("topic");
        String menu = request.getParameter("menu");
        String content = request.getParameter("content");
        String img = request.getParameter("img");

        BlogService.addBlogByIdBl( topic,menu, content, img);
        response.sendRedirect("list-BlogAdmin");
    }
}
