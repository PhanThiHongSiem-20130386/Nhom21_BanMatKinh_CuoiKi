package shop.com.vn.controller;

import shop.com.vn.service.ShopService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "editShopAdmin", value = "/edit_Shopadmin")
public class editShopAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("adminShop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String ids = request.getParameter("ids");
    String information = request.getParameter("information");
    String link = request.getParameter("link");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String email = request.getParameter("email");

    String logo = request.getParameter("logo");
        ShopService.editShop(ids,information,link,phone,address,email,logo);
        response.sendRedirect("edit_Shopadmin");
    }
}
