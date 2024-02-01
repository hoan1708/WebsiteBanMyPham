package vn.com.devpro.jw25.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import vn.com.devpro.jw25.dto.SaleOrder_Search;
import vn.com.devpro.jw25.model.Product;
import vn.com.devpro.jw25.model.Sale_Order;


@Service
public class SaleOrderService extends BaseService<Sale_Order> {

	@Override
	public Class<Sale_Order> clazz() {
		// TODO Auto-generated method stub
		return Sale_Order.class;
	}
	
	// ham search 
	public List<Sale_Order> searchSaleOrderService(SaleOrder_Search saleOrderSearch) {

		String sql = "SELECT * FROM tbl_sale_order s WHERE 1=1";

		if (saleOrderSearch.getStatus() < 2 && saleOrderSearch.getStatus() > -1) {
			sql += " AND s.status=" + saleOrderSearch.getStatus();
		}

		if (!StringUtils.isEmpty(saleOrderSearch.getKeyWord())) {
			sql += " AND (s.code='" + saleOrderSearch.getKeyWord() + "'" + 
					" OR s.customer_name like '%" + saleOrderSearch.getKeyWord() + "%'" +
					" OR s.customer_address like '%" + saleOrderSearch.getKeyWord() + "%'" +
					" OR s.customer_mobile like '%" + saleOrderSearch.getKeyWord() + "%'" + 
					" OR s.customer_email like '%" 	+ saleOrderSearch.getKeyWord() + "%')";
		}

		String bDate = saleOrderSearch.getBeginDate();
		String eDate = saleOrderSearch.getEndDate();
		if (bDate != null && eDate != null) {
			eDate = eDate + " 23:59:59";
			sql += " AND (s.date_create BETWEEN '" + bDate + "' AND '" + eDate + "')";
		}
//		System.out.println("sql: " + sql);
		
		return super.executeNativeSql(sql, saleOrderSearch.getCurrentPage(), saleOrderSearch.getSizeOfPage());
	}

	
	@Transactional
	public Sale_Order saveSaleOrder (Sale_Order saleOrder) {
		return super.saveOrUpdate(saleOrder);
	}
	
	@Transactional
	public void deleteSaleOrder(Sale_Order sale_order) {
		 super.delete(sale_order);
	}
	
		
}
