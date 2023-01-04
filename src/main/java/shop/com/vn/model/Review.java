package shop.com.vn.model;

import java.io.Serializable;

public class Review  implements Serializable {
    private  String id, content,idacc, idp;

    public Review() {
    }

    public Review(String id, String content, String idacc, String idp) {
        this.id = id;
        this.content = content;
        this.idacc = idacc;
        this.idp = idp;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIdacc() {
        return idacc;
    }

    public void setIdacc(String idacc) {
        this.idacc = idacc;
    }

    public String getIdp() {
        return idp;
    }

    public void setIdp(String idp) {
        this.idp = idp;
    }

    @Override
    public String toString() {
        return "Review{" +
                "id='" + id + '\'' +
                ", content='" + content + '\'' +
                ", idacc='" + idacc + '\'' +
                ", idp='" + idp + '\'' +
                '}';
    }
}
