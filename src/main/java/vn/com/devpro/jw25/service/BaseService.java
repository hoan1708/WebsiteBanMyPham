package vn.com.devpro.jw25.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.com.devpro.jw25.model.BaseModel;

@Service
public abstract class BaseService<E extends BaseModel> {
	@PersistenceContext
	EntityManager entityManager;
	
	public abstract Class<E> clazz();
	
	public E getById(int id) {
		return entityManager.find(clazz(), id);
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findAll() {
		Table table = clazz().getAnnotation(Table.class);
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + table.name(), clazz()).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findAllActive() {
		Table table = clazz().getAnnotation(Table.class);
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + table.name() + " where status = 1", clazz()).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findTop5ProductTypeOfSonMoi() {
		Table table = clazz().getAnnotation(Table.class);  
		// SELECT * FROM jw26_cuoikhoa.tbl_product where 
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + table.name() + " where id_catetory=1 LIMIT 5;", clazz()).getResultList();
	}
	
//	@SuppressWarnings("unchecked")
//	public List<E> getListProductByIdCategory_min8Product() {
//		Table table = clazz().getAnnotation(Table.class);  
//		// SELECT * FROM jw26_cuoikhoa.tbl_product where 
//		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + table.name() + " where id_catetory=1 LIMIT 5;", clazz()).getResultList();
//	}
	
	@SuppressWarnings("unchecked")
	public List<E> getListProductByIdCategory(int idCategory) {
		Table table = clazz().getAnnotation(Table.class); 
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + table.name() + " where id_catetory=" + idCategory, clazz()).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<E> getListProductByIdCategory_min4Product(int idCategory) {
		Table table = clazz().getAnnotation(Table.class);  
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + table.name() + " where id_catetory=" + idCategory +" LIMIT 4; ", clazz()).getResultList();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<E> getListURLProductByID(int idProduct) {
		Table table = clazz().getAnnotation(Table.class);  
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + table.name() + " where id_product=" + idProduct, clazz()).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findTop5ProductTypeOfKemDuongDa() {
		Table table = clazz().getAnnotation(Table.class); 
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + table.name() + " where id_catetory=3 LIMIT 5;", clazz()).getResultList();
	}
	
	

	@Transactional
	public E saveOrUpdate(E entity) {
		if (entity.getId() == null || entity.getId() <= 0) { //Add
			entityManager.persist(entity);
			return entity;
		}
		else { //update
			return entityManager.merge(entity);
		}
	}
	
	public void delete(E entity) {
		entityManager.remove(entity);
	}
	
	@Transactional
	public void deleteById(int id) {
		E entity = this.getById(id);
		delete(entity);
	}
	
	@SuppressWarnings("unchecked")
	public List<E> executeNativeSql(String sql) {
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<E> executeNativeSql(String sql, int currentPage, int sizeOfPage) {
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			query.setFirstResult((currentPage-1)*sizeOfPage);   // vị trí bản ghi đầu trang 
			query.setMaxResults(sizeOfPage);  // số bản ghi hiển thị trên 1 trang 
			
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}
	
	public E getEntityByNativeSql(String sql) {
		try {
			return this.executeNativeSql(sql).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
