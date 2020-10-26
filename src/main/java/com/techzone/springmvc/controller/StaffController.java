package com.techzone.springmvc.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techzone.springmvc.entity.Bill;
import com.techzone.springmvc.entity.BillConfirm;
import com.techzone.springmvc.entity.BillDeTail;
import com.techzone.springmvc.service.BillConfirmService;
import com.techzone.springmvc.service.BillDetailService;
import com.techzone.springmvc.service.BillService;
import com.techzone.springmvc.service.UserService;
import com.techzone.springmvc.util.SecurityUtil;

@Controller
@RequestMapping("/staff")
public class StaffController {

	// TODO : Dependency Injection
	@Autowired
	private BillService billService;

	@Autowired
	private BillDetailService billDetailService;
	
	@Autowired
	private BillConfirmService billConfirmService;

	@Autowired
	private UserService userService;
	// TODO : Dependency Injection

	@GetMapping("/managerment")
	public ModelAndView listTast(ModelAndView theModel) {
		List<Bill> theBills = billService
				.getBillsByStaffId(userService.findByUsername(SecurityUtil.getPrincipal()).getId());
		
		Collections.sort(theBills); // ascending
		Collections.reverse(theBills); // descending
		
		
		theModel.addObject("theBills", theBills);
		theModel.setViewName("/staff/list-task");
		return theModel;
	}

	@GetMapping("/getDetailBill")
	public ModelAndView getDetailBillShowForStaff(@RequestParam("theBillId") int theBillId, ModelAndView theModel) {

		List<BillDeTail> theBillDetails = billDetailService.getBillDetailByBillId(theBillId);
		
		theModel.addObject("theBillDetails", theBillDetails);
		
		theModel.setViewName("/staff/detail-bill");

		return theModel;

	}
	
	@GetMapping("/setDoneBill")
	public String setDoneBill(@RequestParam("theBillId") int theBillId) {
		
		billConfirmService.saveBillConfirm(new BillConfirm(theBillId, 1));
		
		Bill theBill = billService.getBill(theBillId);
		billService.setShipWaiting(theBill);
		
		return "redirect:/staff/managerment";
		
	}
	
	@GetMapping("/setFailBill")
	public String setFailBill(@RequestParam("theBillId") int theBillId) {
		
		billConfirmService.saveBillConfirm(new BillConfirm(theBillId, 0));
		
		Bill theBill = billService.getBill(theBillId);
		billService.setShipWaiting(theBill);
		
		return "redirect:/staff/managerment";
		
	}
	
	

}
