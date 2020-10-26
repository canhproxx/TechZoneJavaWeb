package com.techzone.springmvc.service;

import java.util.List;

import com.techzone.springmvc.entity.BillConfirm;

public interface BillConfirmService {

	public List<BillConfirm> getBillConfirms();
	
	public void saveBillConfirm(BillConfirm theBillConfirm);
	
	public void deleteBillConfirm(int theBillConfirmId);
	
	public void deleteAllBillConfirm();
	
}
