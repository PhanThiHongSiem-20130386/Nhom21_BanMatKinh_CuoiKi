package shop.com.vn.model;

import java.io.Serializable;

public class Blog implements Serializable {
    private  String idb,topic, menu, content, img;

    public Blog() {
    }

    public Blog(String idb, String topic, String menu, String content, String img) {
        this.idb = idb;
        this.topic = topic;
        this.menu = menu;
        this.content = content;
        this.img = img;
    }

    public String getIdb() {
        return idb;
    }

    public void setIdb(String idb) {
        this.idb = idb;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "idb='" + idb + '\'' +
                ", topic='" + topic + '\'' +
                ", menu='" + menu + '\'' +
                ", content='" + content + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
