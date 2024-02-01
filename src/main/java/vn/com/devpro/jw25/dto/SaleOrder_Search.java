package vn.com.devpro.jw25.dto;

public class SaleOrder_Search {
	private String keyWord;
	private Integer status;
	private int sizeOfPage;  // tổng phần tử trong 1 trang 
	private int currentPage; // trang hiện tại 
	
	
	private int totalItems;
	private String beginDate;
	private String endDate;
	
	

	public SaleOrder_Search() {
		super();
	}

	public SaleOrder_Search(String keyWord, int status, int sizeOfPage, int currentPage, int totalItems,
			String beginDate, String endDate) {
		super();
		this.keyWord = keyWord;
		this.status = status;
		this.sizeOfPage = sizeOfPage;
		this.currentPage = currentPage;
		this.totalItems = totalItems;
		this.beginDate = beginDate;
		this.endDate = endDate;
	}



	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}



	public String getBeginDate() {
		return beginDate;
	}



	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
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
	
	
	
}
