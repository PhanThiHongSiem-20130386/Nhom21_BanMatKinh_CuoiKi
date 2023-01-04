package shop.com.vn.controller;

import shop.com.vn.model.Category;
import shop.com.vn.model.ListCategoryItem;
import shop.com.vn.model.Product;
import shop.com.vn.model.Slider;
import shop.com.vn.service.ProductService;
import shop.com.vn.service.SliderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchControl", value = "/search")
public class SearchConrol extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameP");
        request.setCharacterEncoding("UTF-8");
        List<Product> listProductBySearch = ProductService.getProductByName(name);
        List<Slider> listSlider = SliderService.getListSlider();


        request.setAttribute("listSlider", listSlider);
        request.setAttribute("list", listProductBySearch);
        request.setAttribute("txtSearch", name);
        request.getRequestDispatcher("home.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
