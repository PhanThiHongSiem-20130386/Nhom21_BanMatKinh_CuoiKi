package shop.com.vn.controller;

import shop.com.vn.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminAcceptController", value = "/adminAccept")
public class AdminAcceptController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int status = Integer.parseInt(request.getParameter("status"));
        String ido = request.getParameter("ido");
        System.out.println(ido);
        if (status == 1) {
            OrderService.editStatus(ido, "2");
        }
        if (status == 2) {
            OrderService.editStatus(ido, "3");
        }
        response.sendRedirect("admin-buy-order");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
