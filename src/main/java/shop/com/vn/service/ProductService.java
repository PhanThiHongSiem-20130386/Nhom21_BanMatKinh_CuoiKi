package shop.com.vn.service;


import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Category;
import shop.com.vn.model.ListCategoryItem;
import shop.com.vn.model.Product;

import java.util.List;
import java.util.stream.Collectors;

public class ProductService {
    //    lấy sản phẩm mới
    public static List<Product> getListProduct() {
//        xử DB ...
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product where isNew =true").mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    // lấy các danh mục menu
    public static List<Category> getListCategories() {
//        xử DB ...
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from category").mapToBean(Category.class)
                    .stream().collect(Collectors.toList());
        });
    }

    //lấy tất cả các loại của danh mục menu
    public static List<ListCategoryItem> getListC() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from categoryItem").mapToBean(ListCategoryItem.class)
                    .stream().collect(Collectors.toList());
        });
    }
//    lấy danh sách sản phẩm theo cat
    public static List<Product> getListCById(String cid) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select p.id,p.img,p.name, p.price, p.information from product p join categoryItem c on p.ciditem =c.id  where c.idc = ?")
                    .bind(0,cid)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

//    lấy ra từng cat theo id
    public static Category getNameC(int cid){
        for (Category c: getListCategories() ) {
            if(cid==(c.getIdCategory())){
                return  c;
            }

        }
        return null;
    }

//    lấy ra danh sách sản phẩm theo phân loại trong cat theo id của phân loại
    public static List<Product> getListItemCatById(String idI) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product  where ciditem = ?")
                    .bind(0,idI)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

//  lấy phân loại trong menu để lấy tên của phân loại đó để hiển thị lên đường dẫn
   public static ListCategoryItem getItemName(int idI ){
       for (ListCategoryItem ci: getListC() ) {
           if(idI == ci.getId()){
               return  ci;
           }

       }
        return null;
   }

    public static Category getCateName(int idI ){
        for (Category ca:getListCategories() ) {
            if(idI == ca.getIdCategory()){
                return  ca;
            }

        }
        return null;
    }
    public static Product getProductById(String id) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product  where id = ?")
                    .bind(0,id)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }
    public static List<Product> getListProductByPrice(String price1,String price2) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product  where price > ? and price<?")
                    .bind(0,price1)
                    .bind(1,price2)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Product> getListProductByName(String name) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product WHERE name LIKE ?")
                    .bind(0,"%"+ name+"%")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }


    public static void main(String[] args) {
        System.out.println(getListProductByName("MK_DST01"));
    }

}