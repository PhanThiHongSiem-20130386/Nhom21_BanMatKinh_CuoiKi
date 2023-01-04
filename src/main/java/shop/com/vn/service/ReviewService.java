package shop.com.vn.service;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Product;
import shop.com.vn.model.Review;

import java.util.List;
import java.util.stream.Collectors;

public class ReviewService {
    public static void addReview(String ida, String content, String idp) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO review(content, idacc, idp) " +
                                "VALUES (?,?,?)")
                        .bind(0, content)
                        .bind(1, ida)
                        .bind(2, idp)
                        .execute()
        );

    }

    public static List<Review> getAllReviewByIdp(String idp) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from review where  idp =?")
                    .bind(0, idp)
                    .mapToBean(Review.class)

                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Review> getAllReview() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from review")

                    .mapToBean(Review.class)

                    .stream().collect(Collectors.toList());
        });
    }
}
