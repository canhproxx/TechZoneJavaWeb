package com.techzone.springmvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techzone.springmvc.entity.Bill;
import com.techzone.springmvc.repository.BillRepository;
import com.techzone.springmvc.repository.ProductRepository;
import com.techzone.springmvc.repository.UserRepository;
import com.techzone.springmvc.service.DashBoardService;

@Service
@Transactional
public class DashBoardServiceImpl implements DashBoardService {
	
	@Autowired
	private BillRepository billRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ProductRepository productRepository;


	@Override
	public long statisticalRevenue() {
		long sum = 0;
		List <Bill> bills = billRepository.findAll();
		for (Bill bill : bills) {
			if (bill.getShipStatus().equalsIgnoreCase("FINISH")) {
				sum += bill.getTotal();
			}
			
		}
		return sum;
	}

	@Override
	public long statisticalBillCustomer() {
		return billRepository.findAll().size();
	}

	@Override
	public long statisticalProductInStorage() {
		return productRepository.findAll().size();
	}

	@Override
	public long statisticalCustomer() {
		return userRepository.findAll().size();
	}

}
