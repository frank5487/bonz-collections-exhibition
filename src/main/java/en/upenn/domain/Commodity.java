package en.upenn.domain;

import java.io.Serializable;
import java.util.List;

public class Commodity implements Serializable {

    private int mid;
    private String mname;
    private double price;
    private String commodityIntroduce;
    private String mdate;
    private int count;
    private int cid;
    private String mimage;
    private int sid;

    private Category category;
    private Seller seller;
    private List<CommodityImg> commodityImgList;

    public Commodity() {}

    public Commodity(int mid, String mname, double price, String commodityIntroduce, boolean mflag, String mdate, int count, int cid, String mimage, int sid, String sourceId) {
        this.mid = mid;
        this.mname = mname;
        this.price = price;
        this.commodityIntroduce = commodityIntroduce;
        this.mdate = mdate;
        this.count = count;
        this.cid = cid;
        this.mimage = mimage;
        this.sid = sid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCommodityIntroduce() {
        return commodityIntroduce;
    }

    public void setCommodityIntroduce(String commodityIntroduce) {
        this.commodityIntroduce = commodityIntroduce;
    }

    public String getMdate() {
        return mdate;
    }

    public void setMdate(String mdate) {
        this.mdate = mdate;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getMimage() {
        return mimage;
    }

    public void setMimage(String mimage) {
        this.mimage = mimage;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }

    public List<CommodityImg> getCommodityImgList() {
        return commodityImgList;
    }

    public void setCommodityImgList(List<CommodityImg> commodityImgList) {
        this.commodityImgList = commodityImgList;
    }
}
