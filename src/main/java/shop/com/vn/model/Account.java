package shop.com.vn.model;

import java.io.Serializable;

public class Account implements Serializable {
    private  int id;
    private  String user;
    private  String email;
    private  String phone;
    private  String pass;
    private  int isadmin;
    private  String img;
    private  String address;
    private  String fullName;


    public Account() {
    }

    public Account(int id, String user, String email, String phone, String pass, int isadmin, String img, String address, String fullName) {
        this.id = id;
        this.user = user;
        this.email = email;
        this.phone = phone;
        this.pass = pass;
        this.isadmin = isadmin;
        this.img = img;
        this.address = address;
        this.fullName = fullName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(int isadmin) {
        this.isadmin = isadmin;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", pass='" + pass + '\'' +
                ", isadmin=" + isadmin +
                ", img='" + img + '\'' +
                ", address='" + address + '\'' +
                ", fullName='" + fullName + '\'' +
                '}';
    }
}
