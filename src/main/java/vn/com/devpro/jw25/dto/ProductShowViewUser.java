package vn.com.devpro.jw25.dto;

public class ProductShowViewUser {
	
	private int sizeOfPage;  
	private int currentPage; 
	private int totalItems;
	private int status;
	public ProductShowViewUser() {
		super();
	}
	
	
	
	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public ProductShowViewUser(int sizeOfPage, int currentPage, int totalItems, int status) {
		super();
		this.sizeOfPage = sizeOfPage;
		this.currentPage = currentPage;
		this.totalItems = totalItems;
		this.status = status;
	}



	public int getSizeOfPage() {
		return sizeOfPage;
	}
	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalItems() {
		return totalItems;
	}
	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}
	
	

}
