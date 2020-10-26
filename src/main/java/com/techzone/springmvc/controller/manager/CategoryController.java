package com.techzone.springmvc.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techzone.springmvc.entity.Category;
import com.techzone.springmvc.exception.ResourceNotFoundException;
import com.techzone.springmvc.service.CategoryService;
import com.techzone.springmvc.service.ProductService;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	
	// TODO : Dependency Injection
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	// TODO : Dependency Injection
	
    @GetMapping("/")
    public String handleOrigin() {
    	return "redirect:/admin/category/list";
    }
	
	@GetMapping("/list")
	public String listCategory(Model theModel) {
		
		List <Category> theCategorys = categoryService.getCategorys();
		theModel.addAttribute("categorys", theCategorys);
		return "/admin/list-categorys";
		
	}
	
	@GetMapping("/showForm")
	public String showFormCategory(ModelMap theModel) {
		
		Category theCategory = new Category();
		theModel.addAttribute("categoryModel", theCategory);
		
		return "/admin/form-category";
		
	}
	
	@PostMapping("/saveCategory")
	public String saveCategory(@ModelAttribute Category theCategory , ModelMap theModel) {
		
		categoryService.saveCategory(theCategory);
		
		return "redirect:/admin/category/list";
		
	}
	
	@GetMapping("/delete")
	public String deleteCategory(@RequestParam("categoryId") int theId) {
		
		Category theCategory = null;
		try {
			theCategory = categoryService.getCategory(theId);
		} catch (ResourceNotFoundException e) {
			e.printStackTrace();
		}
		if (checkDependencyRelationShipCategory(theCategory.getName()) == true ) {
			categoryService.deleteCategory(theId);
		}
		
		return "redirect:/admin/category/list";
		
	}
	
	@GetMapping("/update")
	public String updateCategory(@RequestParam("categoryId") int theId , ModelMap theModel) throws ResourceNotFoundException {
		
		Category theCategory = categoryService.getCategory(theId);
		theModel.addAttribute("categoryModel", theCategory);
		
		return "/admin/form-category";
		
	}
	
	
	// ================== SUPPORT ================= //
	public boolean checkDependencyRelationShipCategory(String categoryName) {
		
		if (productService.findProductByCategoryName(categoryName).isEmpty()) {
			
			return true; // apcept delete category
			
		}
		return false; // deny delete category
	}
	
	

}
