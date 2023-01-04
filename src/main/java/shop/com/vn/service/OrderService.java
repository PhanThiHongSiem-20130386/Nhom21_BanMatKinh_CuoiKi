package shop.com.vn.service;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Order;
import shop.com.vn.model.Payment;

import java.util.List;
import java.util.stream.Collectors;

public class OrderService {
    public static void insertOrderByIdAcc(String lastName, String firstName, String phone, String email
            , String address, String payment, String idAcc) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO orders (firstname, lastname, phone,email,address,payment,idacc, status)" +
                                "VALUES (?,?,?,?,?,?,?,1)")
                        .bind(0, firstName)
                        .bind(1, lastName)
                        .bind(2, email)
                        .bind(3, phone)
                        .bind(4, address)
                        .bind(5, payment)
                        .bind(6, idAcc)
                        .execute()
        );

    }
    public static List<Order> getListOrderByIdAcc(String idAcc) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from orders  where idAcc = ?")
                    .bind(0,idAcc)
                    .mapToBean(Order.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Payment> getAllPayment() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from pay ")

                    .mapToBean(Payment.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static Payment getPaymentByIdPm(String idPm) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from pay  where idPm = ?")
                    .bind(0,idPm)
                    .mapToBean(Payment.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }
    public static void deleteProductByIdCart(String idac) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from cart1 where idAccount = ?")
                        .bind(0, idac)
                        .execute()
        );
    }
    public static List<Order> getAllOrder() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM orders")
                    .mapToBean(Order.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Order> getAllOrderById(String idAc) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM orders where idacc=? ")
                    .bind(0, idAc)
                    .mapToBean(Order.class)
                    .stream().collect(Collectors.toList());
        });
    }
    // lấy tất cả các ttangj thái
    public static void editStatus(String ido, String status) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update orders set status= ? where idorder =?")
                        .bind(0, status)
                        .bind(1, ido)
                        .execute()
        );
    }


    public static void main(String[] args) {



    }
}
