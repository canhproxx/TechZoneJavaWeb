package com.techzone.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techzone.springmvc.service.CartDBService;

@Controller
@RequestMapping("/cart")
public class CartAjaxController {
	
	@Autowired
	private CartDBService cartDBService;
	
	@RequestMapping(value = "/alter-quantity-down/{theId}")
	public ResponseEntity <String> downQuantity(@PathVariable("theId") int theProductId) {
		
		System.err.println("DOWN QUANTITY CART AJAX BY ID : " + theProductId);
		cartDBService.changeDownProductInCart(theProductId);
		
		try {
			ResponseEntity<String> responseBody = new ResponseEntity<String>("Change Down" , HttpStatus.OK);
			return responseBody;
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/alter-quantity-up/{theId}")
	public ResponseEntity <String> upQuantity(@PathVariable("theId") int theProductId) {
		
		System.err.println("UP QUANTITY CART AJAX BY ID : " + theProductId);
		cartDBService.changeUpProductInCart(theProductId);
		try {
			ResponseEntity<String> responseEntity = new ResponseEntity<String>("Change Up", HttpStatus.OK);
			return responseEntity;
		} catch (Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}

}
