package vn.com.devpro.jw25.model;

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
@Table(name="tbl_category")
public class Category extends BaseModel{
	
	@Column(name="name" , length=200, nullable = true )
	private String name;
	
	@Column(name="description" , length=300, nullable = true)
	private String description;
	
	// one to many ( category to product ) 
	//Mapping one-to-many: category-to-product
//		@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "category")
//		private Set<Product> products = new HashSet<Product>();
//		
//		//Phuong thuc them va xoa phan tu trong danh sach quan he: category - to - product 
//				public void addRelationalProductCate(Product product) {
//					products.add(product);
//					product.setCategory(this);
//				}
//				
//				public void deleteRelationalProductCate(Product product) {
//					products.remove(product);
//					product.setCategory(null);	
//				}
				
		
				public Category(Integer id, Integer createBy, Integer updateBy, Date createDate, Date updateDate,
						Boolean status, String name, String description) {
					super(id, createBy, updateBy, createDate, updateDate, status);
					this.name = name;
					this.description = description;
				}

				public Category() {
					super();
				}

				
				public String getName() {
					return name;
				}

				public void setName(String name) {
					this.name = name;
				}

				public String getDescription() {
					return description;
				}

				public void setDescription(String description) {
					this.description = description;
				}

//				public Set<Product> getProducts() {
//					return products;
//				}
//
//				public void setProducts(Set<Product> products) {
//					this.products = products;
//				}

				
			
		
}
