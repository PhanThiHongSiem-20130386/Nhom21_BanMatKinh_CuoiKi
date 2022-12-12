package shop.com.vn.controller;

import shop.com.vn.model.Account;
import shop.com.vn.model.Product;
import shop.com.vn.service.AccountService;
import shop.com.vn.service.LoginService;
import shop.com.vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditAccountAdminController", value = "/edit_accountadmin")
public class EditAccountAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idA = request.getParameter("idA");
        Account acc =  AccountService.getAccount(idA);
        request.setAttribute("account", acc);
        request.getRequestDispatcher("edit_Accountadmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idAccount");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        LoginService.editProfileAcountById(pass,email,phone,fullName,address,id);
        response.sendRedirect("account-edit");

    }
}
