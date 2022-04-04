package en.upenn.domain;

import java.io.Serializable;

public class Seller implements Serializable {
    private int sid;
    private String sname;
    private String contactphone;
    private String address;

    public Seller() {}

    public Seller(int sid, String sname, String contactphone, String address) {
        this.sid = sid;
        this.sname = sname;
        this.contactphone = contactphone;
        this.address = address;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getContactphone() {
        return contactphone;
    }

    public void setContactphone(String contactphone) {
        this.contactphone = contactphone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
