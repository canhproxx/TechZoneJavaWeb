package com.techzone.springmvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techzone.springmvc.entity.Product;
import com.techzone.springmvc.exception.ResourceNotFoundException;
import com.techzone.springmvc.repository.ProductDaoRepository;
import com.techzone.springmvc.repository.ProductRepository;
import com.techzone.springmvc.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	// add for search product by search bar
	@Autowired
	private ProductDaoRepository productDaoRepository;
	// add for search product by search bar
	
	@Override
	@Transactional
	public Product getProduct(int theId) throws ResourceNotFoundException {
		
		return productRepository.findById(theId).orElseThrow(() -> new ResourceNotFoundException(theId));
		
	}

	@Override
	@Transactional
	public List<Product> getProducts() {
		return productRepository.findAll();
	}

	@Override
	@Transactional
	public void saveProduct(Product theProduct) {
		productRepository.save(theProduct);
	}

	@Override
	@Transactional
	public void deleteProduct(int theId){
		productRepository.deleteById(theId);
	}

	
	@Override
	@Transactional
	public void updateProduct(Product theProduct) {
		productRepository.saveAndFlush(theProduct);
		
	}

	@Override
	@Transactional
	public Product findProductByName(String nameProduct) {
		return productRepository.findProductByName(nameProduct);
	}

	@Override
	@Transactional
	public List<Product> findProductBySearch(String productName) {
//		return productDaoRepository.findProductByNameLike(productName);
//		return productDaoRepository.findProductsByNameStartingWith(productName);
		return productDaoRepository.findProductsByNameContains(productName);
	}

	
	@Override
	@Transactional
	public List<Product> findProductByCategoryName(String categoryName) {
		
		return productDaoRepository.findProductsByCategoryName(categoryName);
		
	}

	@Override
	@Transactional
	public List<Product> findProductByBrandName(String brandName) {
		
		return productDaoRepository.findProductsByBrandName(brandName);
		
	}

	@Override
	@Transactional
	public List<Product> findProductBySaleName(String saleName) {
		
		return productDaoRepository.findProductsBySaleEvent(saleName);
		
	}

	@Override
	@Transactional
	public List<Product> findTopProductBigSale() {
		return productRepository.findTopProductBigSale();
	}

	@Override
	public List<Product> findTopFourProductBeLiked() {
		return productRepository.findTopFourProductBeLiked();
	}

	@Override
	public Product getMostPurchasedProduct() {
		return productRepository.getMostPurchasedProduct();
	}

	@Override
	public List<Product> getAllProductExisingInBillIsWaitingStatus() {
		
		return productRepository.getAllProductExisingInBillIsWaitingStatus();
	}


}
