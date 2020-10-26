package com.techzone.springmvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techzone.springmvc.entity.BillConfirm;
import com.techzone.springmvc.repository.BillConfirmRepository;
import com.techzone.springmvc.service.BillConfirmService;

@Service
public class BillConfirmServiceImpl implements BillConfirmService {
	
	@Autowired
	private BillConfirmRepository billConfirmRepository;

	@Override
	@Transactional
	public List<BillConfirm> getBillConfirms() {
		return billConfirmRepository.findAll();
	}

	@Override
	@Transactional
	public void saveBillConfirm(BillConfirm theBillConfirm) {
		billConfirmRepository.save(theBillConfirm);
		
	}

	@Override
	@Transactional
	public void deleteBillConfirm(int theBillConfirmId) {
		billConfirmRepository.deleteById(theBillConfirmId);
		
	}

	@Override
	public void deleteAllBillConfirm() {
		billConfirmRepository.deleteAll();
	}
	

}
