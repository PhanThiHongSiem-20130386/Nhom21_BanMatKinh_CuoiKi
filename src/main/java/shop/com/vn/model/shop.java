package shop.com.vn.model;

import java.io.Serializable;

public class shop implements Serializable {
    private int ids;
    private  String information;
    private  String link;
    private  String phone;
    private  String address;
    private  String email;
    private  String logo;
    public shop() {
    }

    public shop(int ids, String information, String link, String phone, String address, String email, String logo) {
        this.ids = ids;
        this.information = information;
        this.link = link;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.logo = logo;
    }

    public int getIds() {
        return ids;
    }

    public void setIds(int ids) {
        this.ids = ids;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
}
