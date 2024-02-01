package vn.com.devpro.jw25.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_product_image")
public class Product_image extends BaseModel{

	@Column(name = "title", length=500, nullable = true)
	private String title;
	
	@Column(name = "path", length=255, nullable = true)
	private String path;
	
	//Mapping many-to-one: ProductImage-to-Product
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_product")
	private Product product;
	
	public Product_image() {
		super();
	}


	public Product_image(Integer id, Integer createBy, Integer updateBy, Date createDate, Date updateDate,
			Boolean status, String title, String path, Product product) {
		super(id, createBy, updateBy, createDate, updateDate, status);
		this.title = title;
		this.path = path;
		this.product = product;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	
	
	
}
