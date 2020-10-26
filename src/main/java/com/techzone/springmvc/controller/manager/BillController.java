package com.techzone.springmvc.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techzone.springmvc.entity.Bill;
import com.techzone.springmvc.entity.BillDeTail;
import com.techzone.springmvc.service.BillDetailService;
import com.techzone.springmvc.service.BillService;

@Controller
@RequestMapping("/admin/bill")
public class BillController {
	
	// TODO : Dependency Injection
	@Autowired
	private BillService billService;
	
	@Autowired
	private BillDetailService billDetailService;
	// TODO : Dependency Injection
	
	@GetMapping("")
	public String handleOrigin() {
		return "redirect:/admin/bill/list";
	}
	
	@GetMapping("/list")
	public String listBill(ModelMap theModel) {
		List <Bill> theBills = billService.getBills();
		theModel.addAttribute("theBills", theBills);
		return "/admin/list-bills";
	}
	
	@GetMapping("/getDetailBill")
	public String getDetailBill(@RequestParam("theBillId") int theBillId , ModelMap theModel) {
		
		List<BillDeTail> theBillDetails = billDetailService.getBillDetailByBillId(theBillId);
		
		theModel.addAttribute("theBillDetails", theBillDetails);
		return "/admin/list-billdetails";
		
	}
	
} // END CLASS

//@GetMapping("/setShipSuccess")
//public String setShipSuccess(@RequestParam("theBillId") int theBillId) {
//	
//	System.err.println("Bill Id To set success : " + theBillId);
//	Bill theBill = billService.getBill(theBillId);
//	billService.setShipSuccess(theBill);
//	return "redirect:/admin/bill";
//}
//
//@GetMapping("/setShipCancel")
//public String setShipCancel(@RequestParam("theBillId") int theBillId) {
//	System.err.println("Bill Id To set cancel : " + theBillId);
//	Bill theBill = billService.getBill(theBillId);
//	billService.setShipCancel(theBill);
//	return "redirect:/admin/bill";
//}

