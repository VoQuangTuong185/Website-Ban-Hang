package clothes.dao;

import java.util.List;
import clothes.entity.Category;
public interface CategoryDAO {
	List<Category> listCategories();

	Category getCategory(int id);
	
	boolean insert(Category category);
	
	boolean update(Category category);
	
	boolean delete(Category category);
	
}
