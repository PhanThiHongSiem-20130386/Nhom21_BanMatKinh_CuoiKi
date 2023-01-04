package shop.com.vn.service;


import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Policy;
import shop.com.vn.model.shop;

import java.util.List;
import java.util.stream.Collectors;

public class ShopService {
    public static shop getShop() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM shop")
                        .mapToBean(shop.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );
    }

    public static void editShop(String ids, String information, String link, String phone, String address, String email, String logo) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update shop set information=?,  link=?,  phone=?,  " +
                                "address=?,  email=?,  logo=? where ids = ?")
                        .bind(0, information)
                        .bind(1, link)
                        .bind(2, phone)
                        .bind(3, address)
                        .bind(4, email)
                        .bind(5, logo)
                        .bind(6, ids)
                        .execute()
        );
    }

    public static List<Policy> getPolicy() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM policy")
                        .mapToBean(Policy.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public static void main(String[] args) {
        System.out.println(getPolicy());
    }
}
