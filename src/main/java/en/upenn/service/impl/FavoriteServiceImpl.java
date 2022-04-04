package en.upenn.service.impl;

import en.upenn.dao.CommodityDao;
import en.upenn.dao.FavoriteDao;
import en.upenn.dao.impl.CommodityDaoImpl;
import en.upenn.dao.impl.FavoriteDaoImpl;
import en.upenn.domain.Favorite;
import en.upenn.service.FavoriteService;

public class FavoriteServiceImpl implements FavoriteService {

    private FavoriteDao favoriteDao = new FavoriteDaoImpl();
    private CommodityDao commodityDao = new CommodityDaoImpl();

    @Override
    public boolean isFavorite(int mid, int uid) {
        Favorite favorite = favoriteDao.findByMidAndUid(mid, uid);

        return favorite != null;
    }

    @Override
    public void add(int mid, int uid) {
        favoriteDao.add(mid, uid);
        commodityDao.addCount(mid);
    }
}
