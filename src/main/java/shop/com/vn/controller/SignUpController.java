package shop.com.vn.controller;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Account;
import shop.com.vn.model.Category;
import shop.com.vn.model.ListCategoryItem;
import shop.com.vn.service.LoginService;
import shop.com.vn.service.ProductService;
import shop.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SignUpController", value = "/signup")
public class SignUpController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("repass");
        LoginService lg = new LoginService();
        Account account = lg.checkAccount(user);
        if (user == null || pass == null || re_pass == null) {
            response.sendRedirect("login.jsp");
        } else {
            if (account == null) {
                if (pass.equals(re_pass)) {
                    lg.signUpA(user, Encode.enCodeMD5(pass));
                    response.sendRedirect("home");
                } else {
                    response.sendRedirect("login.jsp");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
