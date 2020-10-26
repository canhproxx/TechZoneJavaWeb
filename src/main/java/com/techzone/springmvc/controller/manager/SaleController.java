package com.techzone.springmvc.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techzone.springmvc.entity.Sale;
import com.techzone.springmvc.exception.ResourceNotFoundException;
import com.techzone.springmvc.service.ProductService;
import com.techzone.springmvc.service.SaleService;

@Controller
@RequestMapping("/admin/sale")
public class SaleController {
	
	// TODO : Dependency Injection
	@Autowired
	private SaleService saleService;
	
	@Autowired
	private ProductService productService;
	// TODO : Dependency Injection
	
    @GetMapping("/")
    public String handleOrigin() {
    	return "redirect:/admin/sale/list";
    }
	
	@RequestMapping("/list")
	public String listSale(ModelMap theModel) {
		List <Sale> sales = saleService.getSales();
		
		theModel.addAttribute("sales", sales);
		
		return "/admin/list-sale";
	}
	
	@GetMapping("/showForm")
	public String showFormSale(ModelMap theModel) {
		
		Sale sale = new Sale();
		
		theModel.addAttribute("saleModel", sale);
		
		return "/admin/form-sale";
		
	}
	
	@PostMapping("/saveSale")
	public String saveSale(@ModelAttribute Sale theSale) {
		
		saleService.saveSale(theSale);
		
		return "redirect:/admin/sale/list";
		
	}
	
	@GetMapping("/delete")
	public String deleteSale(@RequestParam("saleId") int theId) {
		
		Sale theSale = null;
		
		try {
			theSale = saleService.getSale(theId);
		} catch (ResourceNotFoundException e) {
			e.printStackTrace();
		}
		if (checkDependencyRelationShipSale(theSale.getEvent()) == true) {
			saleService.deleteSale(theId);
		}
		
		
		
		return "redirect:/admin/sale/list";
		
	}
	
	@GetMapping("/update")
	public String updateSale(@RequestParam("saleId") int theId , ModelMap theModel) throws ResourceNotFoundException {
		
		Sale theSale = saleService.getSale(theId);
		
		theModel.addAttribute("saleModel", theSale);
		
		return "/admin/form-sale";
		
	}
	
	// ================== SUPPORT ================= //
	public boolean checkDependencyRelationShipSale(String saleName) {
		
		if (productService.findProductBySaleName(saleName).isEmpty()) {
			
			return true; // apcept delete sale
			
		}
		return false; // deny delete sale
	}

}
