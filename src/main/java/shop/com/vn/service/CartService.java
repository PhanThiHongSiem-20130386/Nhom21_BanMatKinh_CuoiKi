package shop.com.vn.service;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Cart;
import shop.com.vn.model.Product;

import java.util.List;
import java.util.stream.Collectors;

public class CartService {
    public static void addProductToCart(String idProduct, String quantity, String idAccount) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO cart1(idProduct,quantity,idAccount) " +
                                "VALUES (?,?,?)")
                        .bind(0, idProduct).bind(1, quantity).bind(2, idAccount)
                        .execute()
        );
    }
    public static List<Product> getProductByID(String idP) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from cart1 where idProduct = ?")
                    .bind(0, idP)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }
    // lấy tất c sp
    public static List<Product> getAllProduct() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from cart1 ")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Cart> getAllByIda(String idAccount) {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from cart1 where idAccount = ?")
                    .bind(0, idAccount)
                    .mapToBean(Cart.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Cart> getAll() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from cart1").mapToBean(Cart.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static Cart checkProduct(String idp, String ida) {

        List<Cart> byCarts = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from cart1 where idProduct = ? and idAccount = ?")
                    .bind(0, idp)
                    .bind(1, ida)
                    .mapToBean(Cart.class)
                    .stream().collect(Collectors.toList());
        });
        if (byCarts.size() == 0)
            return null;
        return byCarts.get(0);
    }

    public static void upQuantityProductByCart(String quantity, String idp, String ida) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update cart1 set quantity =? where idProduct = ? and idAccount = ?")
                        .bind(0, quantity)
                        .bind(1, idp)
                        .bind(2, ida)
                        .execute()
        );
    }
    public static void deleteProductByIdpAndIda(String idp, String ida) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from cart1 where idProduct = ? and idAccount = ?")
                        .bind(0, idp)
                        .bind(1, ida)
                        .execute()
        );
    }

}
