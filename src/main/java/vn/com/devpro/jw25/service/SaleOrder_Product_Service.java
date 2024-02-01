package vn.com.devpro.jw25.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.com.devpro.jw25.model.Product;
import vn.com.devpro.jw25.model.Sale_Order;
import vn.com.devpro.jw25.model.Sale_Order_Product;


@Service
public class SaleOrder_Product_Service extends BaseService<Sale_Order_Product>  {
	
	@Override
	public Class<Sale_Order_Product> clazz() {
		// TODO Auto-generated method stub
		return Sale_Order_Product.class;
	}
	
	@Transactional
	public void deleteSaleOrderProduct (Sale_Order_Product saleOrderProduct) {
		super.delete(saleOrderProduct);
	}
	
	@Transactional
	public void addProductToSaleOrderProduct(Product product, Sale_Order saleOrder, Integer quatity ) {
		Sale_Order_Product saleOrderProduct = new Sale_Order_Product();
		saleOrderProduct.setProduct(product);
		saleOrderProduct.setSaleOrder(saleOrder);
		saleOrderProduct.setQuantity(quatity);
		saleOrderProduct.setStatus(true);
		super.saveOrUpdate(saleOrderProduct);
	}
	
	@Transactional
	public void updateProductOFSaleOrderProduct(Product product, Sale_Order saleOrder, Integer quatity, Integer idSaleOrderProduct ) {
		
		Sale_Order_Product saleOrderProduct = new Sale_Order_Product();
		saleOrderProduct.setId(idSaleOrderProduct);
		saleOrderProduct.setProduct(product);
		saleOrderProduct.setSaleOrder(saleOrder);
		saleOrderProduct.setQuantity(quatity);
		saleOrderProduct.setStatus(true);
		
		super.saveOrUpdate(saleOrderProduct);
	}
}
