package shop.com.vn.controller;

import shop.com.vn.model.Account;
import shop.com.vn.model.Cart;
import shop.com.vn.model.Payment;
import shop.com.vn.service.CartService;
import shop.com.vn.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CheckoutCotroller", value = "/checkout")
public class CheckoutCotroller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account ac = (Account) request.getSession().getAttribute("auth");
        List<Cart> listCart = CartService.getAllByIda(String.valueOf(ac.getId()));
        request.setAttribute("listCart", listCart);
        List<Payment> listPm = OrderService.getAllPayment();
        request.setAttribute("listPm", listPm);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String payment = request.getParameter("payment");
        String idCart = request.getParameter("idCart");
        Account ac = (Account) request.getSession().getAttribute("auth");


        OrderService.insertOrderByIdAcc(firstName, lastName, email, phone, address, payment, String.valueOf(ac.getId()));
        OrderService.deleteProductByIdCart(String.valueOf(ac.getId()));
        response.sendRedirect("home");
    }
}
