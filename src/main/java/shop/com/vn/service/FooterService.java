package shop.com.vn.service;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.shop;

import java.util.stream.Collectors;

public class FooterService {
    public static shop getFooter() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from footer ").mapToBean(shop.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }
}
