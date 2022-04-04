package en.upenn.domain;

import java.io.Serializable;

public class ResultInfo implements Serializable {

    private boolean flag; // front end receive flag(true or false) from backend
    private Object data; // front end receive data from backend
    private String errorMsg; // front end receive error message from backend

    public ResultInfo() {}

    public ResultInfo(boolean flag, Object data, String errorMsg) {
        this.flag = flag;
        this.data = data;
        this.errorMsg = errorMsg;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
