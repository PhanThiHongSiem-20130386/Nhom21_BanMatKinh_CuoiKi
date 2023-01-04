package shop.com.vn.service;
import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Blog;

import java.util.List;
import java.util.stream.Collectors;

public class BlogService {


    public static List<Blog> getAllBlog() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM blog")
                        .mapToBean(Blog.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public static Blog getBlogByIdBl(String idBl) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM blog where idb=?")
                        .bind(0, idBl)
                        .mapToBean(Blog.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );
    }



    public static void editBlogByIdBl(String idb, String topic, String menu, String content, String img) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update blog set  topic=?,  menu=?,content=?, img=? where idb = ?")
                        .bind(0, topic)
                        .bind(1, menu)
                        .bind(2, content)
                        .bind(3, img)
                        .bind(4, idb)
                        .execute()
        );
    }

    public static void addBlogByIdBl( String topic, String menu, String content, String img) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into blog(topic,  menu,content, img) values (?,?,?,?)")
                        .bind(0, topic)
                        .bind(1, menu)
                        .bind(2, content)
                        .bind(3, img)
                        .execute()
        );
    }

    public static void deleteBlogByIdBl(String idBl) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from blog where idb = ?")
                        .bind(0, idBl)
                        .execute()
        );
    }

}
