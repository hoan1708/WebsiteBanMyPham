package vn.com.devpro.jw25.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import antlr.StringUtils;
import vn.com.devpro.jw25.controller.Constants;
import vn.com.devpro.jw25.dto.ProductSearch;
import vn.com.devpro.jw25.dto.ProductShowViewUser;
import vn.com.devpro.jw25.model.Product;
import vn.com.devpro.jw25.model.Product_image;

@Service
public class ProductService extends BaseService<Product> implements Constants{
	
	@Override
	public Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}

	// ham search 
	public List<Product> searchProduct(ProductSearch productSearch){
		
		String sql = "Select * from tbl_product p where 1=1";
		
		if(productSearch.getCategoryId() > 0) {
			sql += " and p.id_catetory = " + productSearch.getCategoryId();
		}
		
		if (!org.springframework.util.StringUtils.isEmpty(productSearch.getKeyWord())) {
			sql += " and (p.name like '%" + productSearch.getKeyWord() + "%'" +
					" or p.short_description like '%" + productSearch.getKeyWord() + "%')";
		}
		
		return super.executeNativeSql(sql, productSearch.getCurrentPage(), productSearch.getSizeOfPage());
	}
	
	// ham search hiển thị trên các trang người dùng
	public List<Product> searchProductShowUser(ProductShowViewUser productShowViewUser){
		
		String sql = "Select * from tbl_product p where 1=1";
		
		return super.executeNativeSql(sql, productShowViewUser.getCurrentPage(), productShowViewUser.getSizeOfPage());
	}
	
	public List<Product> searchProductShowUserWithIdCategory(int idCategory, ProductShowViewUser productShowViewUser){
		
		String sql = "Select * from tbl_product p where 1=1" + "and p.id_catetory="+ idCategory ;
		return super.executeNativeSql(sql, productShowViewUser.getCurrentPage(), productShowViewUser.getSizeOfPage());
	}

	
	// ham kiem tra nguoi dung co upload avatar khong ???
	public boolean isEmptyUploadAvatar(MultipartFile avartafile) {
		if(avartafile == null) {
			return true;  // ko upload 
		}
		return false;
	}
	
	// kiem tra nguoi dung co upload images khong ? 
	public boolean isEmptyUploadImages(MultipartFile[] imagesFile) {
		if(imagesFile == null || imagesFile.length<0 ) {
			return true;
		}
		
		if(imagesFile[0].getOriginalFilename().isEmpty() && imagesFile.length==1) {
			return true;
		}
		return false;
	}
	
	@Transactional
	public Product saveProduct(Product product, MultipartFile avartaFile, MultipartFile[] imageFiles) throws IllegalStateException, IOException {
//		Product productx = new Product();
		// luu avatar 
		

//		if(!isEmptyUploadAvatar(avartaFile)) {
//			// luu file vao thu muc FileUpload/product/productAvatar
//			String path = FOLDER_UPLOAD + "/product/productAvatar/" + avartaFile.getOriginalFilename();
////			System.out.println("Path 1 : " + path );
//			avartaFile.transferTo(new File(path));  // luu vao thu má»¥c path 
//		}
//		
//		product.setAvartar("product/productAvatar/" + avartaFile.getOriginalFilename());
//		
//		
//		// luu cac image of product
//		if(!isEmptyUploadImages(imageFiles)) {
//			for(MultipartFile x : imageFiles) {
//				if(x.isEmpty()) {
//					break;
//				}
//				// product image se luu vao table product image 
//				String path = FOLDER_UPLOAD + "/product/productImage/" + x.getOriginalFilename();
//				try {
//					x.transferTo(new File(path));
//					System.out.println("image of product : " + x.getOriginalFilename());
//					
//				} catch (Exception e) {
//					System.out.println("Error transfer file product image : " + e.getMessage() );
//				}
//				
//				Product_image product_image = new Product_image();
//				product_image.setTitle(x.getOriginalFilename());
//				product_image.setPath("product/productImage/" + x.getOriginalFilename());
//				product.addRelationalProductImage(product_image);
//			}
//		}
//		
//		return super.saveOrUpdate(product);
		
		
//		Product productx = new Product();
		// luu avatar 
		if(!isEmptyUploadAvatar(avartaFile)) {
			// luu file vao thu muc FileUpload/product/productAvatar
			// //C:\Users\DELL\eclipse-workspace\JW25-DangThiHoan-Day5\FileUpload\product\productImage
			String path = FOLDER_UPLOAD + "/product/productAvatar/" + avartaFile.getOriginalFilename();
			avartaFile.transferTo(new File(path));  // luu vao thu mục path 
		}
		
		// đưa avatar vào product 
		product.setAvartar("product/productAvatar/" + avartaFile.getOriginalFilename());
		
		
		// luu cac image of product
		if(!isEmptyUploadImages(imageFiles)) {
			for(MultipartFile x : imageFiles) {
				if(x.isEmpty()) {
					break;
				}
				// product image se luu vao table product image 
				String path = FOLDER_UPLOAD + "/product/productImage/" + x.getOriginalFilename();
				try {
					
					x.transferTo(new File(path));
					System.out.println("image of product : " + x.getOriginalFilename());
					
				} catch (Exception e) {
					System.out.println("Error transfer file product image : " + e.getMessage() );
				}
				
				Product_image product_image = new Product_image();
				product_image.setTitle(x.getOriginalFilename());
				product_image.setPath("product/productImage/" + x.getOriginalFilename());
				product.addRelationalProductImage(product_image);
			}
		}
		
		return super.saveOrUpdate(product);
		
	}
	
	
	@Transactional
	public Product editProduct(Product product, MultipartFile avartaFile, MultipartFile[] imageFiles) throws IllegalStateException, IOException {
		
		// Lay product trong database - tbl-product
		Product dbProduct = super.getById(product.getId());
		String path;
		// Kiem tra xem nguoi dung co up Avatar khong
		if (!isEmptyUploadAvatar(avartaFile)) {
			// Xoa avatar cu di
			File file = new File(FOLDER_UPLOAD + dbProduct.getAvartar());
			file.delete();
			// Luu file vao thu muc product/avatar
			path = FOLDER_UPLOAD + "product/productAvatar/" + avartaFile.getOriginalFilename();
			avartaFile.transferTo(new File(path));

			// Luu duong dan vao database

			product.setAvartar("product/productAvatar/" + avartaFile.getOriginalFilename());
		} else { // Neu nguoi dung khong upload avatar moi
			product.setAvartar(dbProduct.getAvartar()); // giu path avatar
		}
		// Luu cac image
		if (!isEmptyUploadImages(imageFiles)) {
			for (MultipartFile x : imageFiles) {
				if (!x.isEmpty()) {
					path = FOLDER_UPLOAD + "product/productAvatar/" + x.getOriginalFilename();
					x.transferTo(new File(path));
					Product_image productImage = new Product_image();
					productImage.setTitle(x.getOriginalFilename());
					productImage.setPath("product/productImage/" + x.getOriginalFilename());
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return super.saveOrUpdate(product);
	}
	
	// delete product by id 
	@Transactional
	public void deleteProduct(Product product) {
		super.delete(product);
	}
	
	
	@Transactional
	public void inactiveProduct(Product product) {
		super.saveOrUpdate(product);
	}
	
	
}
