package en.upenn.domain;

import java.io.Serializable;

public class Favorite implements Serializable {

    private int mid;
    private String date;
    private int uid;

    public Favorite() {}

    public Favorite(int mid, String date, int uid) {
        this.mid = mid;
        this.date = date;
        this.uid = uid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}
