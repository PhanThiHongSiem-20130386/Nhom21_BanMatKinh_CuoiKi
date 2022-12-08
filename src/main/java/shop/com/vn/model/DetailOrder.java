package shop.com.vn.model;

import java.io.Serializable;

public class DetailOrder implements Serializable {
    private  int idOrder;
    private int idProduct;
    private  int pricce;
    private  int quatity;

    public DetailOrder() {
    }

    public DetailOrder(int idOrder, int idProduct, int pricce, int quatity) {
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.pricce = pricce;
        this.quatity = quatity;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getPricce() {
        return pricce;
    }

    public void setPricce(int pricce) {
        this.pricce = pricce;
    }

    public int getQuatity() {
        return quatity;
    }

    public void setQuatity(int quatity) {
        this.quatity = quatity;
    }

    @Override
    public String toString() {
        return "DetailOrder{" +
                "idOrder=" + idOrder +
                ", idProduct=" + idProduct +
                ", pricce=" + pricce +
                ", quatity=" + quatity +
                '}';
    }
}
