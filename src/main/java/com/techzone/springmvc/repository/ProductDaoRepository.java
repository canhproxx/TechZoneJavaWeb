package com.techzone.springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.techzone.springmvc.entity.Product;

@Repository("productDaoRepository")
public interface ProductDaoRepository extends CrudRepository<Product, Integer> , JpaSpecificationExecutor<Product> {
	
	List<Product> findProductByNameLike(String productName); // search with correct type
	
	List<Product> findProductsByNameStartingWith(String productName); // search with start type
	
	List<Product> findProductsByNameContains(String productName); // search with contains type
	
	List<Product> findProductsByCategoryName(String categoryName); // search with category of product
	
	List<Product> findProductsByBrandName(String brandName); // search with brand of product
	
	List<Product> findProductsBySaleEvent(String saleName); // search with sale of product
	
	
}
