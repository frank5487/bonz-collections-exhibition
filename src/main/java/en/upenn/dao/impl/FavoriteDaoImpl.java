package en.upenn.dao.impl;

import en.upenn.dao.FavoriteDao;
import en.upenn.domain.Commodity;
import en.upenn.domain.Favorite;
import en.upenn.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FavoriteDaoImpl implements FavoriteDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDatasource());

    @Override
    public Favorite findByMidAndUid(int mid, int uid) {
        Favorite favorite = null;
        try {
            String sql = "select * from tab_favorite where mid = ? and uid = ?";
            favorite = template.queryForObject(sql, new BeanPropertyRowMapper<Favorite>(Favorite.class), mid, uid);
        } catch (Exception e) {
            System.out.println("Favorite doesn't exist...");
        }

        return favorite;
    }

    @Override
    public int findCountByMid(int mid) {
        String sql = "select count(*) from tab_favorite where mid = ?";
        return template.queryForObject(sql, Integer.class, mid);
    }

    @Override
    public void add(int mid, int uid) {
        String sql = "insert into tab_favorite values(?,?,?)";
        template.update(sql, mid, new Date(), uid);
    }

    @Override
    public List<Integer> findAllMidByUid(int uid) {
        List<Integer> mids = new ArrayList<>();

        try {
            String sql = "select mid from tab_favorite where uid = ?";
            mids = template.queryForList(sql, Integer.class, uid);
        } catch (Exception e) {
            System.out.println("this user doesn't have collection");
        }

        return mids;
    }
}
