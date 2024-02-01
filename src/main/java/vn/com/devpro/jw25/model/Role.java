package vn.com.devpro.jw25.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;

@Entity
@Table(name = "tbl_role")
public class Role extends BaseModel implements GrantedAuthority{
	public Role() {
		// TODO Auto-generated constructor stub
	}
	
	@Column(name = "name", length = 200, nullable = true)
	private String name;
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

		//Handling many-to-many relationship: Mapping many-to-many fiels
		//First side: owner (user has some roles)
		@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
		@JoinTable(	name = "tbl_user_role", 
					joinColumns = @JoinColumn(name = "role_id"),
					inverseJoinColumns = @JoinColumn(name = "user_id"))
		private List<User> users = new ArrayList<User>();


		public List<User> getUsers() {
			return users;
		}

		public void setUsers(List<User> users) {
			this.users = users;
		}

		@Override
		public String getAuthority() {
			// TODO Auto-generated method stub
			return this.name;
		}
		
		
}
