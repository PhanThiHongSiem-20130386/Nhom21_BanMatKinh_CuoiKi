package shop.com.vn.model;

import java.io.Serializable;

public class Product implements Serializable {
    private int id;
    private String name;
    private String img;
    private long price;
    private boolean isPromo;
    private boolean isNew;
    private String information;

    private int ciditem;

    public Product() {
    }

    public Product(int id, String name, String img, long price, boolean isPromo, boolean isNew, String information, int ciditem) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.price = price;
        this.isPromo = isPromo;
        this.isNew = isNew;
        this.information = information;
        this.ciditem = ciditem;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public boolean isPromo() {
        return isPromo;
    }

    public void setPromo(boolean promo) {
        isPromo = promo;
    }

    public boolean isNew() {
        return isNew;
    }

    public void setNew(boolean aNew) {
        isNew = aNew;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public int getCiditem() {
        return ciditem;
    }

    public void setCiditem(int ciditem) {
        this.ciditem = ciditem;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", img='" + img + '\'' +
                ", price=" + price +
                ", isPromo=" + isPromo +
                ", isNew=" + isNew +
                ", information='" + information + '\'' +
                ", ciditem=" + ciditem +
                '}';
    }
}