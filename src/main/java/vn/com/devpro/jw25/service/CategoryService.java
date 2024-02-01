package vn.com.devpro.jw25.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.com.devpro.jw25.dto.CategorySearch;
import vn.com.devpro.jw25.model.Category;

@Service
public class CategoryService extends BaseService<Category> {

	@Override
	public Class<Category> clazz() {
		return Category.class;
	}
	
	// ham search 
		public List<Category> searchCategory(CategorySearch categorySearch){
			
			String sql = "Select * from tbl_category p where 1=1";
			
			if (categorySearch.getStatus() < 2 && categorySearch.getStatus() > -1) {
				sql += " AND p.status=" + categorySearch.getStatus();
			}
			
			// trường hợp tìm theo nhập từ khóa keyword 
			if (!org.springframework.util.StringUtils.isEmpty(categorySearch.getKeyWord())) {
				sql += " and (p.name like '%" + categorySearch.getKeyWord() + "%'" +
						" or p.description like '%" + categorySearch.getKeyWord() + "%')";
			}
//			System.out.println("sql : " + sql);
//			return super.executeNativeSql(sql);
			return super.executeNativeSql(sql, categorySearch.getCurrentPage(), categorySearch.getSizeOfPage());
		}
		
		@Transactional
		public Category addNewCategory(Category category) {
			return super.saveOrUpdate(category);
		}

		@Transactional
		public void deleteCategory(Category category) {
			super.delete(category);
		}
}
