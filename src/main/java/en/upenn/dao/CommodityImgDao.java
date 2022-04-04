package en.upenn.dao;

import en.upenn.domain.CommodityImg;

import java.util.List;

public interface CommodityImgDao {
    List<CommodityImg> findByMid(int mid);
}
