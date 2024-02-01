package vn.com.devpro.jw25.dto;

public class CategorySearch {

	private String keyWord;
	private int sizeOfPage;  // số dòng trên 1 trang 
	private int currentPage; // tổng số sản phẩm thực tế 
	private int totalItems;
	private int status ; 
	
	
	public CategorySearch(String keyWord, int sizeOfPage, int currentPage, int totalItems, int status) {
		super();
		this.keyWord = keyWord;
		this.sizeOfPage = sizeOfPage;
		this.currentPage = currentPage;
		this.totalItems = totalItems;
		this.status = status;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public CategorySearch() {
		super();
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
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
