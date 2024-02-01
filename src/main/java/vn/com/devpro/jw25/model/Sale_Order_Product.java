package vn.com.devpro.jw25.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_saleorderproduct")
public class Sale_Order_Product extends BaseModel{
		
	@Column(name = "description", length = 300, nullable = true)
	private String description;

	@Column(name = "quantity", nullable = true)
	private Integer quantity;

	// Mapping many-to-one: saleorderproduct-to-product
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_product")
	private Product product;
		
	// Mapping many-to-one: saleorderproduct-to-saleorder
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_sale_order")
	private Sale_Order saleOrder;

	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Sale_Order getSaleOrder() {
		return saleOrder;
	}

	public void setSaleOrder(Sale_Order saleOrder) {
		this.saleOrder = saleOrder;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	

	public Sale_Order_Product(Integer id, Integer createBy, Integer updateBy, Date createDate, Date updateDate,
			Boolean status, String description, Integer quantity, Sale_Order saleOrder, Product product) {
		super();
		this.description = description;
		this.quantity = quantity;
		this.saleOrder = saleOrder;
		this.product = product;
	}

	public Sale_Order_Product() {
		super();
	}

	
}
