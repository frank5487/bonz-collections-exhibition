package en.upenn.dao.impl;

import en.upenn.dao.CommodityDao;
import en.upenn.domain.Commodity;
import en.upenn.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class CommodityDaoImpl implements CommodityDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDatasource());

    @Override
    public int findTotalCount(int cid, String mname) {
        String sql = "select count(*) from tab_commodity where 1=1 ";

        StringBuilder sb = new StringBuilder(sql);
        List params = new ArrayList();

        if (cid != -1) {
            sb.append(" and cid = ? ");
            params.add(cid);
        }

        if (!"null".equals(mname) && mname != null && mname.length() > 0) {
            sb.append(" and mname like ? ");
            params.add("%"+mname+"%");
        }
        // System.out.println("dao cid: " + cid);
        // System.out.println("dao mname: " + mname);

        sql = sb.toString();
        return template.queryForObject(sql, Integer.class, params.toArray());
    }

    @Override
    public List<Commodity> findByPage(int cid, int start, int pageSize, String mname) {
        String sql = "select * from tab_commodity where 1=1 ";

        StringBuilder sb = new StringBuilder(sql);
        List params = new ArrayList();

        if (cid != -1) {
            sb.append(" and cid = ? ");
            params.add(cid);
        }

        if (!"null".equals(mname) && mname != null && mname.length() > 0) {
            sb.append(" and mname like ? ");
            params.add("%"+mname+"%");
        }

        sb.append(" limit ?, ? ");
        params.add(start);
        params.add(pageSize);

        sql = sb.toString();
        return template.query(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class), params.toArray());
    }

    @Override
    public Commodity findOne(int mid) {
        String sql = "select * from tab_commodity where mid = ?";
        return template.queryForObject(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class), mid);
    }

    @Override
    public List<Commodity> findByMids(List<Integer> mids) {
//        String inParams = String.join(",", mids.stream().map(mid -> "?").collect(Collectors.toList()));
//        List<Commodity> commodityList = template.query(
//                String.format("select * from tab_commodity where mid in (%s)", inParams), mids.toArray(), new BeanPropertyRowMapper<Commodity>(Commodity.class));
        String sql = "select * from tab_commodity where mid in ";
        StringBuilder sb = new StringBuilder(sql);
        sb.append(" ( ");
        for (int i = 0; i < mids.size(); i++) {
            if (i != mids.size()-1) {
                sb.append("?,");
            } else {
                sb.append("?");
            }
        }

        sb.append(" ) ");

        sql = sb.toString();
//        System.out.println(sql);

        List<Commodity> commodityList = template.query(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class), mids.toArray());
        return commodityList;
    }

    @Override
    public int findTotalCountByMids(List<Integer> mids, String mname) {
        String sql = "select count(*) from tab_commodity where 1=1 ";

        StringBuilder sb = new StringBuilder(sql);
        List params = new ArrayList();

        if (mids != null) {
            sb.append(" and mid in (");
            for (int i = 0; i < mids.size(); i++) {
                if (i != mids.size()-1) {
                    sb.append("?,");
                } else {
                    sb.append("?) ");
                }
                params.add(mids.get(i));
            }
        }

        if (!"null".equals(mname) && mname != null && mname.length() > 0) {
            sb.append(" and mname like ? ");
            params.add("%"+mname+"%");
        }

        sql = sb.toString();
        return template.queryForObject(sql, Integer.class, params.toArray());
    }

    @Override
    public List<Commodity> findByPageByMids(List<Integer> mids, int start, int pageSize, String mname) {
        String sql = "select * from tab_commodity where 1=1 ";

        StringBuilder sb = new StringBuilder(sql);
        List params = new ArrayList();

        if (mids != null) {
            sb.append(" and mid in (");
            for (int i = 0; i < mids.size(); i++) {
                if (i != mids.size()-1) {
                    sb.append("?,");
                } else {
                    sb.append("?) ");
                }
                params.add(mids.get(i));
            }
        }

        if (!"null".equals(mname) && mname != null && mname.length() > 0) {
            sb.append(" and mname like ? ");
            params.add("%"+mname+"%");
        }

        sb.append(" limit ?, ? ");
        params.add(start);
        params.add(pageSize);

        sql = sb.toString();
        return template.query(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class), params.toArray());
    }

    @Override
    public void addCount(int mid) {
        String sql = "update tab_commodity set count = count + 1 where mid = ?";
        template.update(sql, mid);
    }

    @Override
    public List<Commodity> findAllByRanking() {
        String sql = "select * from tab_commodity order by count desc";
        return template.query(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class));
    }

    @Override
    public int findTotalByRanking(String mname, double lower, double higher) {
        String sql = "select count(*) from tab_commodity where 1=1 ";

        StringBuilder sb = new StringBuilder(sql);
        List params = new ArrayList();

        if (!"null".equals(mname) && mname != null && mname.length() > 0) {
            sb.append(" and mname like ? ");
            params.add("%"+mname+"%");
        }
        if (lower != -1) {
            sb.append(" and price > ? ");
            params.add(lower);
        }
        if (higher != -1) {
            sb.append(" and price < ? ");
            params.add(higher);
        }

        sql = sb.toString();
        return template.queryForObject(sql, Integer.class, params.toArray());
    }

    @Override
    public List<Commodity> findByPageByRanking(int start, int pageSize, String mname, double lower, double higher) {
        String sql = "select * from tab_commodity where 1=1 ";

        StringBuilder sb = new StringBuilder(sql);
        List params = new ArrayList();

        if (!"null".equals(mname) && mname != null && mname.length() > 0) {
            sb.append(" and mname like ? ");
            params.add("%"+mname+"%");
        }
        if (lower != -1) {
            sb.append(" and price > ? ");
            params.add(lower);
        }
        if (higher != -1) {
            sb.append(" and price < ? ");
            params.add(higher);
        }

        sb.append(" order by count desc limit ?, ? ");
        params.add(start);
        params.add(pageSize);

        sql = sb.toString();
        return template.query(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class), params.toArray());
    }

    @Override
    public List<Commodity> findPopularity() {
        String sql = "select * from tab_commodity order by count desc limit 0, 4";
        return template.query(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class));
    }

    @Override
    public List<Commodity> findNewest() {
        String sql = "select * from tab_commodity order by mdate desc limit 0, 4";
        return template.query(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class));
    }

    @Override
    public List<Commodity> findRec(int cid) {
        String sql = "select * from tab_commodity where cid = ? order by count desc limit 0, 6";
        return template.query(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class), cid);
    }

}
