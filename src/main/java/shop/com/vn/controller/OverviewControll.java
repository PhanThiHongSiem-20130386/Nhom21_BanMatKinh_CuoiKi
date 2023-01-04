package shop.com.vn.controller;

import shop.com.vn.model.Account;
import shop.com.vn.model.Product;
import shop.com.vn.model.Review;
import shop.com.vn.service.AccountService;
import shop.com.vn.service.ProductService;
import shop.com.vn.service.ReviewService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OverviewControll", value = "/admin-overview")
public class OverviewControll extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product>productList = ProductService.getAllProduct();
        List<Account>accountList = AccountService.getAllAccount();

        List<Review>list = ReviewService.getAllReview();
        request.setAttribute("list", list);
        request.setAttribute("accountList",accountList);
        request.setAttribute("productList",productList);
        request.getRequestDispatcher("admin.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
