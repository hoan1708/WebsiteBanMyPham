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

@Entity
@Table(name = "tbl_product")
public class Product extends BaseModel {
	// EDGER : lấy product, lấy hết các category tương ứng 
	//Mapping many-to-one: product-to-category
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_catetory")
	private Category category;
	
	
	//Mapping one-to-many: Product - to - Product Image
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<Product_image> product_images = new HashSet<Product_image>();
	
	// voi moi quan he One-to-Many 
	// can thiet lap them cac phuong thuc add và xoa trong moi quan he nay 
	
	
	//Phuong thuc them va xoa phan tu trong danh sach quan he: Product - to - Product Image
	public void addRelationalProductImage(Product_image product_image) {
		product_images.add(product_image);
		product_image.setProduct(this);
	}
	
	public void deleteRelationalProductImage(Product_image product_image) {
		product_images.remove(product_image);
		product_image.setProduct(null);	
	}
	
	
	//Mapping one-to-many: Product - to - Sale_order_product
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<Sale_Order_Product> sale_order_products = new HashSet<>();

	//Phuong thuc them va xoa phan tu trong danh sach quan he: Product - to - Sale_order_product
	public void addRelationalSaleOrderProduct(Sale_Order_Product sale_order_product) {
		sale_order_products.add(sale_order_product);
		sale_order_product.setProduct(this);
	}
	
	public void deleteRelationalSaleOrderProduct(Sale_Order_Product sale_order_product) {
		sale_order_products.remove(sale_order_product);
		sale_order_product.setProduct(null);	
	}
	
	@Column(name = "name", length = 1000, nullable = false)
	private String name;
	
	@Column(name = "price", nullable = true)
	private BigDecimal price;
	
	@Column(name = "sale_price", nullable = true)
	private BigDecimal salePrice;
	
	@Column(name = "short_description", length = 200, nullable = true)
	private String shortDescription;
	
	@Column(name = "detail_description", nullable = true)
	private String detailDescription;
	
	@Column(name = "avartar", length = 255, nullable = true)
	private String avartar;    // lưu đường dẫn, ko lưu trực tiếp ảnh đc 
	
	@Column(name = "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE;
	
	
	public Product() {
		super();
	}

	

	public Product(Category category, String name, BigDecimal price, BigDecimal salePrice, String shortDescription,
			String detailDescription, String avartar, Boolean isHot) {
		super();
		this.category = category;
		this.name = name;
		this.price = price;
		this.salePrice = salePrice;
		this.shortDescription = shortDescription;
		this.detailDescription = detailDescription;
		this.avartar = avartar;
		this.isHot = isHot;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	

	public String getAvartar() {
		return avartar;
	}

	public void setAvartar(String avartar) {
		this.avartar = avartar;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [category=" + category + ", product_images=" + product_images + ", sale_order_products="
				+ sale_order_products + ", name=" + name + ", price=" + price + ", salePrice=" + salePrice
				+ ", shortDescription=" + shortDescription + ", detailDescription=" + detailDescription + ", avartar="
				+ avartar + ", isHot=" + isHot + "]";
	}
	
}
