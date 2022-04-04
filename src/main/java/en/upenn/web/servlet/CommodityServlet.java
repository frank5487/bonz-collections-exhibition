package en.upenn.web.servlet;

import en.upenn.domain.Commodity;
import en.upenn.domain.PageBean;
import en.upenn.domain.User;
import en.upenn.service.CommodityService;
import en.upenn.service.FavoriteService;
import en.upenn.service.impl.CommodityServiceImpl;
import en.upenn.service.impl.FavoriteServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/commodity/*")
public class CommodityServlet extends BaseServlet{

    private CommodityService commodityService = new CommodityServiceImpl();
    private FavoriteService favoriteService = new FavoriteServiceImpl();

    public void pageQuery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cidStr = req.getParameter("cid");
        System.out.println(cidStr);
        String currentPageStr = req.getParameter("currentPage");
        String pageSizeStr = req.getParameter("pageSize");

        String mname = req.getParameter("mname");
        mname = new String(mname.getBytes("iso-8859-1"), "utf-8"); // tomcat7 doesn't support for chinese decode directly.

        // System.out.println("commodityServlet mname: " + mname);

        int cid;
        if (!"null".equals(cidStr) && cidStr != null && cidStr.length() > 0) {
            cid = Integer.parseInt(cidStr);
        } else {
            cid = -1;
        }
        // System.out.println("commodityServlet cid: " + cid);

        int currentPage;
        if (currentPageStr != null && currentPageStr.length() > 0) {
            currentPage = Integer.parseInt(currentPageStr);
        } else {
            currentPage = 1; // default by 1
        }

        int pageSize;
        if (pageSizeStr != null && pageSizeStr.length() > 0) {
            pageSize = Integer.parseInt(pageSizeStr);
        } else {
            pageSize = 4; // set default by 4 counts in each page.
        }

        PageBean<Commodity> pb = commodityService.pageQuery(cid, currentPage, pageSize, mname);

        writeValue(pb, resp);
    }

    public void findOne(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String midStr = req.getParameter("mid");
        int mid = Integer.parseInt(midStr);

        Commodity commodity = commodityService.findOne(mid);

        writeValue(commodity, resp);
    }

    public void isFavorite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String midStr = req.getParameter("mid");
        int mid = Integer.parseInt(midStr);

        User user = (User) req.getSession().getAttribute("user");
        int uid;
        if (user == null) {
            uid = -1;
        } else {
            uid = user.getUid();
        }

        boolean flag = favoriteService.isFavorite(mid, uid);

        writeValue(flag, resp);
    }

    public void addFavorite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // System.out.println("Enter addFavorite function...");
        String midStr = req.getParameter("mid");
        int mid = Integer.parseInt(midStr);

        User user = (User) req.getSession().getAttribute("user");
        int uid;
        if (user == null) {
            return;
        } else {
            uid = user.getUid();
        }

        favoriteService.add(mid, uid);
    }

    public void getCollection(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        int uid;
        if (user == null) {
            return;
        } else {
            uid = user.getUid();
        }
//        System.out.println("commodity/getCollection uid: " + uid);

        List<Commodity> commodities = commodityService.getCollection(uid);

        writeValue(commodities, resp);
    }

    public void pageQueryForCollection(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");

        int uid;
        if (user == null) {
            return;
        } else {
            uid = user.getUid();
        }

        List<Commodity> commodities = commodityService.getCollection(uid);

        List<Integer> mids = new ArrayList<>();
        for (Commodity commodity : commodities) {
            mids.add(commodity.getMid());
        }

        String currentPageStr = req.getParameter("currentPage");
        String pageSizeStr = req.getParameter("pageSize");

        String mname = req.getParameter("mname");
        mname = new String(mname.getBytes("iso-8859-1"), "utf-8"); // tomcat7 doesn't support for chinese decode directly.

        int currentPage;
        if (currentPageStr != null && currentPageStr.length() > 0) {
            currentPage = Integer.parseInt(currentPageStr);
        } else {
            currentPage = 1; // default by 1
        }

        int pageSize;
        if (pageSizeStr != null && pageSizeStr.length() > 0) {
            pageSize = Integer.parseInt(pageSizeStr);
        } else {
            pageSize = 4; // set default by 4 counts in each page.
        }

        PageBean<Commodity> pb = commodityService.pageQueryForCollection(mids, currentPage, pageSize, mname);
//        System.out.println("CommodityServlet pb:" + pb);
//        System.out.println("CommodityServlet pb.getList().size():" + pb.getList().size());

        writeValue(pb, resp);
    }

    public void pageQueryForRanking(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<Commodity> commodityList = commodityService.findAllByRanking();

        String currentPageStr = req.getParameter("currentPage");
        String pageSizeStr = req.getParameter("pageSize");

        String mname = req.getParameter("mname");
        mname = new String(mname.getBytes("iso-8859-1"), "utf-8"); // tomcat7 doesn't support for chinese decode directly.

        String lowerStr = req.getParameter("lower");
        String higherStr = req.getParameter("higher");
        double lower = -1;
        try {
            lower = Double.parseDouble(lowerStr);
        } catch (Exception e) {
            System.out.println("this is not a double type");
        }
        double higher = -1;
        try {
            higher = Double.parseDouble(higherStr);
        } catch (Exception e) {
            System.out.println("this is not a double type");
        }
        if (lower > higher) {
            double t = lower;
            lower = higher;
            higher = t;
        }

        int currentPage;
        if (currentPageStr != null && currentPageStr.length() > 0) {
            currentPage = Integer.parseInt(currentPageStr);
        } else {
            currentPage = 1; // default by 1
        }

        int pageSize;
        if (pageSizeStr != null && pageSizeStr.length() > 0) {
            pageSize = Integer.parseInt(pageSizeStr);
        } else {
            pageSize = 8; // set default by 8 counts in each page.
        }

        PageBean<Commodity> pb = commodityService.pageQueryForRanking(currentPage, pageSize, mname, lower, higher);
        writeValue(pb, resp);
    }

    public void getPopularity(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Commodity> popularList = commodityService.findPopularity();

        writeValue(popularList, resp);
    }

    public void getNewest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Commodity> newestList = commodityService.findNewest();

        writeValue(newestList, resp);
    }

    public void getRecommendation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String cidStr = req.getParameter("cid");
        int cid = Integer.parseInt(cidStr);

        List<Commodity> recList = commodityService.findRec(cid);

        writeValue(recList, resp);
    }
}
