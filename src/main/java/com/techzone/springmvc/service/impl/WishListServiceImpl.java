package com.techzone.springmvc.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.techzone.springmvc.entity.WishList;
import com.techzone.springmvc.repository.WishListRepository;
import com.techzone.springmvc.service.WishListService;

@Service
@Transactional
public class WishListServiceImpl implements WishListService {

	@Autowired
	private WishListRepository wishListRepository;
	
	@Override
	public List<WishList> getWishLists(int theUserId) {
		return wishListRepository.findAllWishListsByUserId(theUserId);
	}

	@Override
	public void saveWishList(WishList theWishList) {
		wishListRepository.save(theWishList);
		
	}

	@Override
	public void deleteWishList(int theId) {
		wishListRepository.deleteById(theId);
	}


}
