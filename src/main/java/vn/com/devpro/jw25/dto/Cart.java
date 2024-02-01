package vn.com.devpro.jw25.dto;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

public class Cart {
	// chứa danh sách các sản phẩm rong giỏ hàng 
	List<CartProduct> ds_cartproduct = new ArrayList<CartProduct>();
	
	// đếm tổng sản phẩm trong giỏ 
	public BigInteger totalCartProducts() {
		BigInteger total = BigInteger.ZERO;
		
		for(CartProduct cartProduct : ds_cartproduct) {
			total = total.add(cartProduct.getQuantity());
		}
		
		return total;
	}
	
	// tính tổng giá các sản phẩm trong giỏ hàng 
	public BigDecimal totalCartPrice() {
		BigDecimal total =  BigDecimal.ZERO;
		
		for(CartProduct cartProduct : ds_cartproduct) {
			total = total.add(cartProduct.totalPrice());
		}
		
		return total;
		
	}

	public Cart(List<CartProduct> ds_cartproduct) {
		super();
		this.ds_cartproduct = ds_cartproduct;
	}

	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public List<CartProduct> getDs_cartproduct() {
		return ds_cartproduct;
	}

	public void setDs_cartproduct(List<CartProduct> ds_cartproduct) {
		this.ds_cartproduct = ds_cartproduct;
	}
	
	
	
}
