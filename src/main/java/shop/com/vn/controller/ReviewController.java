package shop.com.vn.controller;

import shop.com.vn.service.ReviewService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ReviewController", value = "/review")
public class ReviewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ida = request.getParameter("ida");
        String  idp = request.getParameter("idp");
        String content = request.getParameter("content");

        ReviewService.addReview(ida,content,idp);
        response.sendRedirect("detail?id="+idp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
