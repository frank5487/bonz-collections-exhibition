package en.upenn.dao;

import en.upenn.domain.Category;

import java.util.List;

public interface CategoryDao {
    List<Category> findAll();

    Category findByCid(int cid);
}
