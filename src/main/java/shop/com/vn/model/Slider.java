package shop.com.vn.model;

public class Slider {
    private  int idSlide;
    private  String imgSlide;

    public Slider() {
    }

    public Slider(int idSlide, String imgSlide) {
        this.idSlide = idSlide;
        this.imgSlide = imgSlide;
    }

    public int getIdSlide() {
        return idSlide;
    }

    public void setIdSlide(int idSlide) {
        this.idSlide = idSlide;
    }

    public String getImgSlide() {
        return imgSlide;
    }

    public void setImgSlide(String imgSlide) {
        this.imgSlide = imgSlide;
    }

    @Override
    public String toString() {
        return "Slider{" +
                "idSlide=" + idSlide +
                ", imgSlide='" + imgSlide + '\'' +
                '}';
    }
}
