package shop.com.vn.model;

import java.io.Serializable;

public class Policy implements Serializable {

    private String idCS,topic,content;

    public Policy() {
    }

    public Policy(String idCS, String topic, String content) {
        this.idCS = idCS;
        this.topic = topic;
        this.content = content;
    }

    public String getIdCS() {
        return idCS;
    }

    public void setIdCS(String idCS) {
        this.idCS = idCS;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "policy{" +
                "idCS='" + idCS + '\'' +
                ", topic='" + topic + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
