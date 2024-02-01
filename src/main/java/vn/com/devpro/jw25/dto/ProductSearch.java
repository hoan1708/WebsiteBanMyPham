package vn.com.devpro.jw25.dto;

public class ProductSearch {
	
	private String keyWord;
	private int categoryId;
	private int sizeOfPage;  // số dòng trên 1 trang 
	private int currentPage; // tổng số sản phẩm thực tế 
	private int totalItems;
	private int status;
	
	public ProductSearch() {
		// TODO Auto-generated constructor stub
	}
	


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}









	public ProductSearch(String keyWord, int categoryId, int sizeOfPage, int currentPage, int totalItems, int status) {
		super();
		this.keyWord = keyWord;
		this.categoryId = categoryId;
		this.sizeOfPage = sizeOfPage;
		this.currentPage = currentPage;
		this.totalItems = totalItems;
		this.status = status;
	}









	public int getTotalItems() {
		return totalItems;
	}



	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}



	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
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
	
	
	
	
}
