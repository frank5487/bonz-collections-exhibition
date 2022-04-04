package en.upenn.domain;

import java.io.Serializable;

public class CommodityImg implements Serializable {

    private int mgid;
    private int mid;
    private String bigPic;
    private String smallPic;

    public CommodityImg() {}

    public CommodityImg(int mgid, int mid, String bigPic, String smallPic) {
        this.mgid = mgid;
        this.mid = mid;
        this.bigPic = bigPic;
        this.smallPic = smallPic;
    }

    public int getMgid() {
        return mgid;
    }

    public void setMgid(int mgid) {
        this.mgid = mgid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getBigPic() {
        return bigPic;
    }

    public void setBigPic(String bigPic) {
        this.bigPic = bigPic;
    }

    public String getSmallPic() {
        return smallPic;
    }

    public void setSmallPic(String smallPic) {
        this.smallPic = smallPic;
    }

    @Override
    public String toString() {
        return "CommodityImg{" +
                "mgid=" + mgid +
                ", mid=" + mid +
                ", bigPic='" + bigPic + '\'' +
                ", smallPic='" + smallPic + '\'' +
                '}';
    }
}
