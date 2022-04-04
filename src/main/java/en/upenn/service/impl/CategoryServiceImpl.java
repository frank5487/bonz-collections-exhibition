package en.upenn.service.impl;

import en.upenn.dao.CategoryDao;
import en.upenn.dao.impl.CategoryDaoImpl;
import en.upenn.domain.Category;
import en.upenn.service.CategoryService;
import en.upenn.util.JedisUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class CategoryServiceImpl implements CategoryService {

    private CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public List<Category> findAll() {
        // 1. query data from redis
        // 1.1 connect to jedis client
        Jedis jedis = JedisUtils.getJedis();
        // 1.2 use sortedset to query
        Set<Tuple> categories = jedis.zrangeWithScores("category", 0, -1);

        List<Category> categoryList = new ArrayList<Category>();
        // 2. check if categories exist
        if (categories == null || categories.size() == 0) {
            System.out.println("query from MySQL database");

            // 3. query from MySQL and store the data to redis
            // 3.1 query from MySQL
            categoryList = categoryDao.findAll();
            // 3.2 store categoryList to redis
            for (int i = 0; i < categoryList.size(); i++) {
                jedis.zadd("category", categoryList.get(i).getCid(), categoryList.get(i).getCname());
            }
        } else {
            System.out.println("query from redis");

            for (Tuple tuple : categories) {
                Category category = new Category();
                category.setCname(tuple.getElement());
                category.setCid((int)tuple.getScore());
                categoryList.add(category);
            }
        }

        return categoryList;
    }
}
