package vn.com.devpro.jw25.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "tbl_sale_order")
public class Sale_Order extends BaseModel {
	@Column(name = "code", length = 45, nullable = false)
	private String code;

	@Column(name = "total", nullable = false)
	private BigDecimal total;

	@Column(name = "customer_name", length = 100, nullable = false)
	private String customer_name;

	@Column(name = "customer_address", length = 200, nullable = false)
	private String customer_address;

	@Column(name = "customer_mobile", length = 100, nullable = false)
	private String customer_mobile;

	@Column(name = "customer_email", length = 100, nullable = false)
	private String customer_email;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_user")
	private User user;

	// Mapping one-to-many: sale-to-saleorderproduct
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "saleOrder")
	private Set<Sale_Order_Product> saleOrderProducts = new HashSet<Sale_Order_Product>();

	// Phuong thuc them va xoa phan tu trong danh sach quan he category-product
	public void addRelationalSaleOrderProduct(Sale_Order_Product saleOrderProduct) {
		saleOrderProducts.add(saleOrderProduct);
		saleOrderProduct.setSaleOrder(this);
	}

	public void deleteRelationalSaleOrderProduct(Sale_Order_Product saleOrderProduct) {
		saleOrderProducts.remove(saleOrderProduct);
		saleOrderProduct.setSaleOrder(null);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public String getCustomer_mobile() {
		return customer_mobile;
	}

	public void setCustomer_mobile(String customer_mobile) {
		this.customer_mobile = customer_mobile;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}


	public Set<Sale_Order_Product> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(Set<Sale_Order_Product> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}


}
