package kr.co.vo;

public class SearchCriteria extends Criteria {
	private String searchType = "";
	private String keyword = "";
	
	public SearchCriteria() {
		
	}
	
	public SearchCriteria(String searchType, String keyword) {
		this.searchType = searchType;
		this.keyword = keyword;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
