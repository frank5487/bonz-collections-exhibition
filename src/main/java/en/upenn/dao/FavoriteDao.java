package en.upenn.dao;

import en.upenn.domain.Commodity;
import en.upenn.domain.Favorite;

import java.util.List;

public interface FavoriteDao {
    Favorite findByMidAndUid(int mid, int uid);

    int findCountByMid(int mid);

    void add(int mid, int uid);

    List<Integer> findAllMidByUid(int uid);
}
