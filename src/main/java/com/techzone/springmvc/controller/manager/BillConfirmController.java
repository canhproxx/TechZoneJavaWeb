package com.techzone.springmvc.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techzone.springmvc.entity.Bill;
import com.techzone.springmvc.entity.BillConfirm;
import com.techzone.springmvc.service.BillConfirmService;
import com.techzone.springmvc.service.BillService;

@Controller
@RequestMapping("/admin/billConfirm")
public class BillConfirmController {
	
	// TODO : Dependency Injection
	@Autowired
	private BillService billService;
	
	@Autowired
	private BillConfirmService billConfirmService;
	// TODO : Dependency Injection
	
	
	@GetMapping("")
	public String handleOrigin() {
		return "redirect:/admin/billConfirm/list";
	}
	
	@GetMapping("/list")
	public String listBillConfirmStatus(ModelMap theModel) {
		
		List<BillConfirm> theBillConfirms = billConfirmService.getBillConfirms();
		theModel.addAttribute("theBillConfirms", theBillConfirms);
		return "/admin/list-confirm";
	}
	
	@GetMapping("/confirmAll")
	public String confirmAll() {
		
		List<BillConfirm> theBillConfirms = billConfirmService.getBillConfirms();
		for (BillConfirm billConfirm : theBillConfirms) {
			
			if (billConfirm.getStatus() == 1) {
				Bill theBill = billService.getBill(billConfirm.getBillId());
				billService.setShipSuccess(theBill);
			}
			
			if (billConfirm.getStatus() == 0) {
				Bill theBill = billService.getBill(billConfirm.getBillId());
				billService.setShipCancel(theBill);
			}
		}
		
		billConfirmService.deleteAllBillConfirm();
		
		return "redirect:/admin/billConfirm/list";
	}
	
	
}
