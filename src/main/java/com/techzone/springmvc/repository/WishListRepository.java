package com.techzone.springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.techzone.springmvc.entity.WishList;

@Repository("wishListRepository")
public interface WishListRepository extends JpaRepository<WishList, Integer> {
	
	List <WishList> findAllWishListsByUserId( int theUserId);


}
