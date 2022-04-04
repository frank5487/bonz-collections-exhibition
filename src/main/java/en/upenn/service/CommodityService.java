package en.upenn.service;

import en.upenn.domain.Commodity;
import en.upenn.domain.PageBean;

import java.util.List;

public interface CommodityService {
    PageBean<Commodity> pageQuery(int cid, int currentPage, int pageSize, String mname);

    Commodity findOne(int mid);

    List<Commodity> getCollection(int uid);

    PageBean<Commodity> pageQueryForCollection(List<Integer> mids, int currentPage, int pageSize, String mname);

    List<Commodity> findAllByRanking();

    PageBean<Commodity> pageQueryForRanking(int currentPage, int pageSize, String mname, double lower, double higher);

    List<Commodity> findPopularity();

    List<Commodity> findNewest();

    List<Commodity> findRec(int cid);
}
