package en.upenn.dao;

import en.upenn.domain.Seller;

public interface SellerDao {
    Seller findBySid(int sid);
}
