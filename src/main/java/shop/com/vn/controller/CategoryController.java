package shop.com.vn.controller;

import shop.com.vn.model.Category;
import shop.com.vn.model.ListCategoryItem;
import shop.com.vn.model.Product;
import shop.com.vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", value = "/category")
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Product> arr = ProductService.getAllProduct();
//        int start =0, end = 8;
//        if(arr.size() < 100){
//            end = 8;
//        }
//        if(request.getParameter("start") != null){
//            start = Integer.parseInt(request.getParameter("start"));
//        }
//        if(request.getParameter("end") != null){
//            end = Integer.parseInt(request.getParameter("end"));
//        }
//        List<Product> list =  ProductService.getListProductByPage(arr,start,end);

        String cid = request.getParameter("cid");
        List<Product> list = ProductService.getListCById(cid);
        Category ca = ProductService.getNameC(Integer.parseInt(cid));
        String checked = "checked";
        request.setAttribute("checked4", checked);

        request.setAttribute("nameC", ca);
        request.setAttribute("list", list);

        request.getRequestDispatcher("category.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
