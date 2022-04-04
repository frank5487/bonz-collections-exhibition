package en.upenn.dao.impl;

import en.upenn.dao.CommodityImgDao;
import en.upenn.domain.CommodityImg;
import en.upenn.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CommodityImgDaoImpl implements CommodityImgDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDatasource());

    @Override
    public List<CommodityImg> findByMid(int mid) {
        String sql = "select * from tab_commodity_img where mid = ?";
        return template.query(sql, new BeanPropertyRowMapper<CommodityImg>(CommodityImg.class), mid);
    }
}
