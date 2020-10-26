package com.techzone.springmvc.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.techzone.springmvc.entity.Product;

@Repository("productRepository")
public interface ProductRepository extends JpaRepository < Product,Integer > {

	Product findProductByName(String nameProduct);
	
	// TODO : add to pagination
	Page <Product> findAll(Pageable pageable);
	
	
	// TODO : NATIVE 
	final static String SP_getAllProductBigSale = "{CALL getAllProductBigSale}";
	@Query( value = SP_getAllProductBigSale, nativeQuery = true)
	List<Product> findTopProductBigSale();
	
	// TODO : NATIVE 
	final static String getTopFourProductBeLiked = "{CALL getTopFourProductBeLiked}";
	@Query( value = getTopFourProductBeLiked, nativeQuery = true)
	List<Product> findTopFourProductBeLiked();
	
	// TODO : NATIVE
	final static String getMostPurchasedProduct = "{CALL getMostPurchasedProduct}";
	@Query( value = getMostPurchasedProduct , nativeQuery = true)
	Product getMostPurchasedProduct();
	
	// TODO : NATIVE
	final static String getAllProductExisingInBillIsWaitingStatus = "{CALL getAllProductExisingInBillIsWaitingStatus}";
	@Query( value = getAllProductExisingInBillIsWaitingStatus , nativeQuery = true)
	List <Product> getAllProductExisingInBillIsWaitingStatus();// TODO : List product can't be delete by existing in some bill is status = 'WAITING'
	
	// TODO : Still use yet
	final static String query = "Select name From Products Where name like %:keyword%";
	@Query( value = query , nativeQuery = true)
	List <String> searchAutocompelte(@Param("keyword") String keyword);
	
	
	

}
