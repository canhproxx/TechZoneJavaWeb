package com.techzone.springmvc.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techzone.springmvc.entity.BillDeTail;
import com.techzone.springmvc.service.BillDetailService;

@Controller
@RequestMapping("/admin/billDetail")
public class BillDetailController {
	
	// TODO : Dependency Injection
	@Autowired
	private BillDetailService billDetailService;
	// TODO : Dependency Injection
	
	@GetMapping("")
	public String handleOrigin() {
		return "redirect:/admin/billDetail/list";
	}
	
	@GetMapping("/list")
	public String listBillDetail(ModelMap theModel) {
		List<BillDeTail> theBillDetails = billDetailService.getBillDetails();
		theModel.addAttribute("theBillDetails", theBillDetails);
		return "/admin/list-billdetails";
	}
	

}
