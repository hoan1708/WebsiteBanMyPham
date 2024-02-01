package vn.com.devpro.jw25.dto;

import java.math.BigDecimal;
import java.math.BigInteger;

// là 1 lớp lưu trữ thông tin các sản phẩm được thêm vào giỏ hàng 
public class CartProduct {

	// các thông tin chính được hiển thị trong giỏ hàng sau khi thêm 
	// đây không phải là 1 entity trong database 
	private int productId;
	private String name;
	private String avatar;
	private BigInteger quantity;
	private BigDecimal price;
	
	// hàm tính thành tiền của sản phẩm 
	public BigDecimal totalPrice() {
		if(this.price==null || this.quantity==null) {
			return BigDecimal.ZERO;
		}
		return this.price.multiply(new BigDecimal(this.quantity));
	}
	
	
	public CartProduct() {
		// TODO Auto-generated constructor stub
	}


	public CartProduct(int productId, String name, String avatar, BigInteger quantity, BigDecimal price) {
		super();
		this.productId = productId;
		this.name = name;
		this.avatar = avatar;
		this.quantity = quantity;
		this.price = price;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAvatar() {
		return avatar;
	}


	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	public BigInteger getQuantity() {
		return quantity;
	}


	public void setQuantity(BigInteger quantity) {
		this.quantity = quantity;
	}


	public BigDecimal getPrice() {
		return price;
	}


	public void setPrice(BigDecimal price) {
		this.price = price;
	}



	
	
}
