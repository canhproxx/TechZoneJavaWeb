package com.techzone.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.techzone.springmvc.entity.BillConfirm;
import com.techzone.springmvc.service.BillConfirmService;
import com.techzone.springmvc.service.DashBoardService;

@Controller
@RequestMapping("/")
public class DashboardController {

	// TODO : Dependency Injection
	@Autowired
	private DashBoardService dashboardService;
	
	@Autowired
	private BillConfirmService billConfirmService;
	// TODO : Dependency Injection
	
	@GetMapping("/admin/managerment")
	public ModelAndView dashboard(ModelAndView theModel) {
		
		theModel.setViewName("/admin/dashboard/center");
		
		theModel.addObject("revenue", dashboardService.statisticalRevenue());
		theModel.addObject("billOrder", dashboardService.statisticalBillCustomer());
		theModel.addObject("productStorage", dashboardService.statisticalProductInStorage());
		theModel.addObject("userSubcriber", dashboardService.statisticalCustomer());
		
		theModel.addObject("quantityConfirmBill", getQuantityBillConfirm());
		
		return theModel;
	}
	
	public int getQuantityBillConfirm() {
		List<BillConfirm> list = billConfirmService.getBillConfirms();
		return list.size();
	}
	
	

}
