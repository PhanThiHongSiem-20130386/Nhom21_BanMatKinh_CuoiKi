package shop.com.vn.service;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Order;
import shop.com.vn.model.Payment;
import shop.com.vn.model.Status;

import java.util.List;
import java.util.stream.Collectors;

public class OrderService {
    public static void insertOrderByIdAcc(String lastName, String firstName, String phone, String email
            , String address, String payment, String idAcc) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO `order` (firstname, lastname, phone,email,address,payment,idacc)" +
                                "VALUES (?,?,?,?,?,?,?)")
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
            return handle.createQuery("select * from order  where idAcc = ?")
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
            return handle.createQuery("select * FROM `order`")
                    .mapToBean(Order.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Order> getAllOrderById(String idAc) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM `order` where idacc=? ")
                    .bind(0, idAc)
                    .mapToBean(Order.class)
                    .stream().collect(Collectors.toList());
        });
    }
    // lấy tất cả các ttangj thái
    public static List<Status> getAllStatus() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from  status ")
                    .mapToBean(Status.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static void main(String[] args) {
        insertOrderByIdAcc("aa","xx","756574","email","dadaaa","1","3");
    }
}
