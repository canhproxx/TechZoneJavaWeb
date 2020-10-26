package com.techzone.springmvc.service;

import java.util.List;

import com.techzone.springmvc.entity.WishList;

public interface WishListService {
	
	public List<WishList> getWishLists(int theUserId);
	
	public void saveWishList(WishList theWishList);
	
	public void deleteWishList(int theId);
	

}
