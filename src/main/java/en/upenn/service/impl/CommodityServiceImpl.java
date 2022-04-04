package en.upenn.service.impl;

import en.upenn.dao.*;
import en.upenn.dao.impl.*;
import en.upenn.domain.*;
import en.upenn.service.CommodityService;

import java.util.ArrayList;
import java.util.List;

public class CommodityServiceImpl implements CommodityService {

    private CommodityDao commodityDao = new CommodityDaoImpl();
    private CommodityImgDao commodityImgDao = new CommodityImgDaoImpl();
    private SellerDao sellerDao = new SellerDaoImpl();
    private FavoriteDao favoriteDao = new FavoriteDaoImpl();
    private CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public PageBean<Commodity> pageQuery(int cid, int currentPage, int pageSize, String mname) {
        PageBean<Commodity> pb = new PageBean<Commodity>();
        pb.setCurrentPage(currentPage);
        pb.setPageSize(pageSize);

        int totalCount = commodityDao.findTotalCount(cid, mname);
        pb.setTotalCount(totalCount);

        int start = (currentPage-1) * pageSize;

        List<Commodity> list = commodityDao.findByPage(cid, start, pageSize, mname);
        pb.setList(list);

        int totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
        pb.setTotalPage(totalPage);

        return pb;
    }

    @Override
    public Commodity findOne(int mid) {
        Commodity commodity = commodityDao.findOne(mid);

        List<CommodityImg> commodityImgList = commodityImgDao.findByMid(commodity.getMid());
        commodity.setCommodityImgList(commodityImgList);
//        System.out.println(commodityImgList);

        Seller seller = sellerDao.findBySid(commodity.getSid());
        commodity.setSeller(seller);

        int count = favoriteDao.findCountByMid(mid);
        commodity.setCount(count);

        Category category = categoryDao.findByCid(commodity.getCid());
        commodity.setCategory(category);

        return commodity;
    }

    @Override
    public List<Commodity> getCollection(int uid) {
        List<Integer> mids = favoriteDao.findAllMidByUid(uid);

        List<Commodity> commodityList = new ArrayList<>();
        if (mids == null) {
            return commodityList;
        }
        commodityList = commodityDao.findByMids(mids);


        return commodityList;
    }

    @Override
    public PageBean<Commodity> pageQueryForCollection(List<Integer> mids, int currentPage, int pageSize, String mname) {

        System.out.println("enter pageQueryForCollection...");

        PageBean<Commodity> pb = new PageBean<Commodity>();
        pb.setCurrentPage(currentPage);
        pb.setPageSize(pageSize);

        int totalCount = commodityDao.findTotalCountByMids(mids, mname);
        pb.setTotalCount(totalCount);

        int start = (currentPage-1) * pageSize;

        List<Commodity> list = commodityDao.findByPageByMids(mids, start, pageSize, mname);
        pb.setList(list);

        int totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
        pb.setTotalPage(totalPage);

        System.out.println("CommodityServiceImpl: pb " + pb);

        return pb;
    }

    @Override
    public List<Commodity> findAllByRanking() {
        return commodityDao.findAllByRanking();
    }

    @Override
    public PageBean<Commodity> pageQueryForRanking(int currentPage, int pageSize, String mname, double lower, double higher) {

        PageBean<Commodity> pb = new PageBean<Commodity>();
        pb.setCurrentPage(currentPage);
        pb.setPageSize(pageSize);

        int totalCount = commodityDao.findTotalByRanking(mname, lower, higher);
        pb.setTotalCount(totalCount);

        int start = (currentPage-1) * pageSize;

        List<Commodity> list = commodityDao.findByPageByRanking(start, pageSize, mname, lower, higher);
        pb.setList(list);

        int totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
        pb.setTotalPage(totalPage);


        return pb;
    }

    @Override
    public List<Commodity> findPopularity() {
        return commodityDao.findPopularity();
    }

    @Override
    public List<Commodity> findNewest() {
        return commodityDao.findNewest();
    }

    @Override
    public List<Commodity> findRec(int cid) {
        return commodityDao.findRec(cid);
    }


}
