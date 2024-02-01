package vn.com.devpro.jw25.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


@Entity
@Table(name="tbl_user")
public class User extends BaseModel implements UserDetails{

	@Column(name="username" , length=60, nullable=true)
	public String username;
	
	@Column(name="password" , length=60, nullable=true)
	public String password;
	
	@Column(name="email" , length=200, nullable = true )
	private String email;
	
	@Column(name="description" , length=200, nullable = true )
	private String description;
	
	@Column(name="mobile" , length=200, nullable = true )
	private String mobile;

	public User(Integer id, Integer createBy, Integer updateBy, Date createDate, Date updateDate, Boolean status,
			String username, String password, String email, String description, String mobile) {
		super(id, createBy, updateBy, createDate, updateDate, status);
		this.username = username;
		this.password = password;
		this.email = email;
		this.description = description;
		this.mobile = mobile;
	}

	public User() {
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	// Handling many-to-many relationship: Mapping data fields user -> role
			@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "users")
			private List<Role> roles = new ArrayList<Role>();

			// Handling many-to-many relationship: Add and remove data contained
			// relational-list
			public void addRole(Role role) {
				role.getUsers().add(this);
				roles.add(role);
			}

			public void deleteRole(Role role) {
				role.getUsers().remove(this);
				roles.remove(role);
			}
			
			
			// Handling one-to-many relationship: Mapping data field from user (one-side) to
			// sale order (many-side)
			@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
			private Set<Sale_Order> saleOrders = new HashSet<Sale_Order>();

			// Handling one-to-many relationship: Add and remove data contained
			// relational-list
			public void addRelationalSaleOrder(Sale_Order saleOrder) {
				saleOrders.add(saleOrder);
				saleOrder.setUser(this);
			}

			public void deleteRelationalSaleOrder(Sale_Order saleOrder) {
				saleOrders.remove(saleOrder);
				saleOrder.setUser(null);
			}
			
			

			public Set<Sale_Order> getSaleOrders() {
				return saleOrders;
			}


			public void setSaleOrders(Set<Sale_Order> saleOrders) {
				this.saleOrders = saleOrders;
			}


			@Override
			public Collection<? extends GrantedAuthority> getAuthorities() {
				// TODO Auto-generated method stub
				return  this.roles;
			}


			@Override
			public boolean isAccountNonExpired() {
				// TODO Auto-generated method stub
				return true;
			}


			@Override
			public boolean isAccountNonLocked() {
				// TODO Auto-generated method stub
				return true;
			}


			@Override
			public boolean isCredentialsNonExpired() {
				// TODO Auto-generated method stub
				return true;
			}


			@Override
			public boolean isEnabled() {
				// TODO Auto-generated method stub
				return true;
			}


			public List<Role> getRoles() {
				return roles;
			}


			public void setRoles(List<Role> roles) {
				this.roles = roles;
			}
			
			
	
}
