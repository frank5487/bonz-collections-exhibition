package en.upenn.util;

import java.util.UUID;

public class UuidUtils {

    public static String getUuid() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    /**
     * test
     */
    public static void main(String[] args) {
        System.out.println(UuidUtils.getUuid());
        System.out.println(UuidUtils.getUuid());
    }
}
