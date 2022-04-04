package en.upenn.dao;

import en.upenn.domain.Commodity;

import java.util.List;

public interface CommodityDao {
    int findTotalCount(int cid, String mname);

    List<Commodity> findByPage(int cid, int start, int pageSize, String mname);

    Commodity findOne(int mid);

    List<Commodity> findByMids(List<Integer> mids);

    int findTotalCountByMids(List<Integer> mids, String mname);

    List<Commodity> findByPageByMids(List<Integer> mids, int start, int pageSize, String mname);

    void addCount(int mid);

    List<Commodity> findAllByRanking();

    int findTotalByRanking(String mname, double lower, double higher);

    List<Commodity> findByPageByRanking(int start, int pageSize, String mname, double lower, double higher);

    List<Commodity> findPopularity();

    List<Commodity> findNewest();

    List<Commodity> findRec(int cid);
}
