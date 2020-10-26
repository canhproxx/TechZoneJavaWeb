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

import com.techzone.springmvc.entity.Brand;
import com.techzone.springmvc.exception.ResourceNotFoundException;
import com.techzone.springmvc.service.BrandService;
import com.techzone.springmvc.service.ProductService;

@Controller
@RequestMapping("/admin/brand")
public class BrandController {
	
	// TODO : Dependency Injection
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private ProductService productService;
	// TODO : Dependency Injection
	
    @GetMapping("/")
    public String handleOrigin() {
    	return "redirect:/admin/brand/list";
    }
	
	@GetMapping("/list")
	public String listBrand(ModelMap theModel) {
		
		List <Brand> brands = brandService.getBrands();
		
		theModel.addAttribute("brands", brands);
		
		return "/admin/list-brand";
		
	}
	
	@GetMapping("/showForm")
	public String showFormBrand(ModelMap theModel) {
		
		Brand theBrand = new Brand();
		
		theModel.addAttribute("brandModel", theBrand);
		
		return "/admin/form-brand";
		
	}
	
	
	@PostMapping("/saveBrand")
	public String saveBrand(@ModelAttribute Brand theBrand) {
		
		brandService.saveBrand(theBrand);
		
		return "redirect:/admin/brand/list";
		
	}
	
	@GetMapping("/delete")
	public String deleteBrand(@RequestParam("brandId") int theId) {
		
		Brand theBrand = null;
		try {
			theBrand = brandService.getBrand(theId);
		} catch (ResourceNotFoundException e) {
			e.printStackTrace();
		}
		if (checkDependencyRelationShipBrand(theBrand.getName()) == true) {
			brandService.deleteBrand(theId);
		}
		
		return "redirect:/admin/brand/list";
		
	}
	
	
	@GetMapping("/update")
	public String updateBrand(@RequestParam("brandId") int theId , ModelMap theModel) throws ResourceNotFoundException {
		Brand theBrand = brandService.getBrand(theId);
		
		theModel.addAttribute("brandModel", theBrand);
		
		return "/admin/form-brand";
		
	}
	
	// ================== SUPPORT ================= //
	public boolean checkDependencyRelationShipBrand(String brandName) {
		
		if (productService.findProductByBrandName(brandName).isEmpty()) {
			
			return true; // apcept delete brand
			
		}
		return false; // deny delete brand
	}
	

}
