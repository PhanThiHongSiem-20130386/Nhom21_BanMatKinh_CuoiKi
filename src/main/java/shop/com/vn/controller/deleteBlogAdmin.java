package shop.com.vn.controller;

import shop.com.vn.service.BlogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "deleteBlogAdmin", value = "/delete_blogadmin")
public class deleteBlogAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idb = request.getParameter("idb");

        BlogService.deleteBlogByIdBl(idb);
        response.sendRedirect("list-BlogAdmin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
