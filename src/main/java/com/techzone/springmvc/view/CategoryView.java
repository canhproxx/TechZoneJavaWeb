package com.techzone.springmvc.view;

/** VIEW **/
public class CategoryView {
	
	String categoryName;
	
	public CategoryView() {
		
	}

	public CategoryView(String categoryName) {
		super();
		this.categoryName = categoryName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	

}
