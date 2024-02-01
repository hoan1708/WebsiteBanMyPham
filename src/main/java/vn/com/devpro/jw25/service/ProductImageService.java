package vn.com.devpro.jw25.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.com.devpro.jw25.model.Product_image;


@Service
public class ProductImageService extends BaseService<Product_image>{

	@Override
	public Class<Product_image> clazz() {
		// TODO Auto-generated method stub
		return Product_image.class;
	}
	
	public List<Product_image> getImageByProductId(int productId){
		// tạo câu lệnh truy vấn 
		String sql = "Select * from tbl_product_image where id_product = " + productId;
		return super.executeNativeSql(sql);
	}
	
	@Transactional
	public void deleteImage(Product_image product_image) {
		super.delete(product_image);
	}
	 
}
