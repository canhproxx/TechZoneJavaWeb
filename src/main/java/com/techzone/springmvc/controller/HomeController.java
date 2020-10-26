package com.techzone.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techzone.springmvc.entity.Product;
import com.techzone.springmvc.entity.User;
import com.techzone.springmvc.entity.WishList;
import com.techzone.springmvc.model.CartModelAction;
import com.techzone.springmvc.model.ItemModel;
import com.techzone.springmvc.service.BrandService;
import com.techzone.springmvc.service.CartDBService;
import com.techzone.springmvc.service.CategoryService;
import com.techzone.springmvc.service.ProductService;
import com.techzone.springmvc.service.UserService;
import com.techzone.springmvc.service.WishListService;
import com.techzone.springmvc.util.SecurityUtil;


@Controller
@RequestMapping("/")
public class HomeController {
	
	// TODO : Dependency Injection
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CartDBService cartDBService;
	
	@Autowired
	private WishListService wishListService;
	
	@Autowired
	private CartModelAction cartModelAction;
	// TODO : Dependency Injection

	
	@GetMapping("/")
	public ModelAndView origin(ModelAndView modelAndView) {
		
		getAllComponent(modelAndView);
		return modelAndView;
	}
	
	@GetMapping("/search")
	public ModelAndView search(@RequestParam("searchInfo") String searchInfo , ModelAndView modelAndView) {

		
		String message = "";
		if (searchInfo.equals("")) {
			message = "Search empty , you need type any character";
			modelAndView.addObject("listProductBySearch", null);
		} else {
			message = "Result suggest for you by search : '" + searchInfo + "'";
			modelAndView.addObject("listProductBySearch", productService.findProductBySearch(searchInfo));
		}
		
		getAllComponent(modelAndView);
		modelAndView.addObject("message", message);

		return modelAndView;
		
	}
	
	@GetMapping("/brandLap-{nameBrand}")
	public ModelAndView filterBrandLaptop(@PathVariable String nameBrand , ModelAndView modelAndView) {
		
		getAllComponent(modelAndView);
		
		modelAndView.addObject("listProductByFilter", fiterlaptopByBrandName(nameBrand,modelAndView));
		
		return modelAndView;
	}
	
	@GetMapping("/saleSmartPhone-{percent1}-{percent2}")
	public ModelAndView fiterPercentSaleSmartPhone(@PathVariable String percent1 , @PathVariable String percent2  ,ModelAndView modelAndView) {
		
		getAllComponent(modelAndView);
		modelAndView.addObject("listProductByFilter", filterSmartPhoneBySalePercentRanger(Long.valueOf(percent1),Long.valueOf(percent2),modelAndView));
		
		return modelAndView;
		
	}
	
	@GetMapping("/priceSmartPhone-{price1}-{price2}")
	public ModelAndView fiterPriceSmartPhone(@PathVariable String price1 , @PathVariable String price2  ,ModelAndView modelAndView) {
		
		getAllComponent(modelAndView);
		modelAndView.addObject("listProductByFilter", filterSmartPhoneByPriceRanger(Long.valueOf(price1),Long.valueOf(price2),modelAndView));
		
		return modelAndView;
		
	}
	
	@GetMapping("/showByCategory-{nameCategory}")
	public ModelAndView showProductByCategory(@PathVariable String nameCategory , ModelAndView modelAndView) {
		
		getAllComponent(modelAndView);
		modelAndView.addObject("listProductByFilter", filterProductShowByCategory(nameCategory,modelAndView));
		
		return modelAndView;
		
	}
	
	
	// ====================================== SUPPORT
	
	public void getAllComponent(ModelAndView modelAndView) {
		
		modelAndView.setViewName("shop");
		
		modelAndView.addObject("listProduct_Laptop", productService.findProductByCategoryName("Laptop"));
		modelAndView.addObject("listProduct_SmartPhone", productService.findProductByCategoryName("SmartPhone"));
		
		modelAndView.addObject("topProductBigSale", productService.findTopProductBigSale());
		modelAndView.addObject("topFourProductBeLiked", productService.findTopFourProductBeLiked());
		modelAndView.addObject("mostPurchasedProduct", productService.getMostPurchasedProduct());
		
		List<Product> listProduct = productService.getProducts();
		List<Product> listProductOther = new ArrayList<Product>();
		for (Product p : listProduct) {
			if ( !p.getCategory().getName().equalsIgnoreCase("Laptop") && !p.getCategory().getName().equalsIgnoreCase("SmartPhone")) {
				listProductOther.add(p);
			}
		}
		listProduct.clear();
		
		modelAndView.addObject("listProduct", listProductOther);
		
		modelAndView.addObject("listCategory", categoryService.getCategorys());
		modelAndView.addObject("listBrand", brandService.getBrands());
		modelAndView.addObject("cart", cartDBService.getItemsInCartDB());
		modelAndView.addObject("total", (long) cartModelAction.getTotalOrigin(cartDBService.getItemsInCartDB()));
		
		sumItemInCart(modelAndView);
		sumItemInWishList(modelAndView);
	}
	
	public List<Product> fiterlaptopByBrandName(String brandName , ModelAndView modelAndView) {
		
		List <Product> allProduct = productService.findProductByCategoryName("Laptop");
		List<Product> filterProduct = new ArrayList<Product>();
		
		for (Product p : allProduct) {
			if (p.getBrand().getName().equalsIgnoreCase(brandName)) {
				filterProduct.add(p);
			}
		}
		String message = "";
		if (filterProduct.size() == 0) {
			message = "List product by filter is empty in store at this time";
			modelAndView.addObject("message", message);
		}
		
		return filterProduct;
	}
	
	public List<Product> filterSmartPhoneBySalePercentRanger(long percent1 , long percent2 , ModelAndView modelAndView){
		
		List <Product> allProduct = productService.findProductByCategoryName("SmartPhone");
		List<Product> filterProduct = new ArrayList<Product>();
		
		for (Product p : allProduct) {
			if (p.getSale().getPercent() >= percent1 && p.getSale().getPercent() <= percent2) {
				filterProduct.add(p);
			}
		}
		String message = "";
		if (filterProduct.size() == 0) {
			message = "List product by filter is empty in store at this time";
			modelAndView.addObject("message", message);
		}
		
		return filterProduct;
	}
	
	public List<Product> filterSmartPhoneByPriceRanger(long price1 , long price2 , ModelAndView modelAndView){
		
		List <Product> allProduct = productService.findProductByCategoryName("SmartPhone");
		List<Product> filterProduct = new ArrayList<Product>();
		
		boolean isOverPrice = false;
		isOverPrice = ( price2 < price1 ) ? true : false;
		
		if (isOverPrice) {
			for (Product p : allProduct) {
				if (p.getPrice() >= price1 ) {
					filterProduct.add(p);
				}
			}
		} else {
			for (Product p : allProduct) {
				if (p.getPrice() >= price1 && p.getPrice() <= price2) {
					filterProduct.add(p);
				}
			}
		}
		
		String message = "";
		if (filterProduct.size() == 0) {
			message = "List product by filter is empty in store at this time";
			modelAndView.addObject("message", message);
		}
		
		return filterProduct;
	}
	
	public List<Product> filterProductShowByCategory(String nameCategory , ModelAndView modelAndView) {
		
		List <Product> listProductByCategory = productService.findProductByCategoryName(nameCategory);
		
		String message = "";
		if (listProductByCategory.size() == 0) {
			message = "Category is empty in store at this time";
			modelAndView.addObject("message", message);
		}
		
		return listProductByCategory;
		
	}
	
	
	public void sumItemInCart(ModelAndView theModel) {
		List <ItemModel> items = cartDBService.getItemsInCartDB();
		int sumItemInCart = 0;
		for (ItemModel i : items) {
			sumItemInCart += i.getQuantity();
		}
		theModel.addObject("sumItemInCart", sumItemInCart);
	}
	
	public void sumItemInWishList(ModelAndView theModel) {
		
		if ( isCurrentAuthentication() ) {
			
			User theUser = userService.findByUsername(SecurityUtil.getPrincipal());
			List <WishList> wishList = wishListService.getWishLists(theUser.getId());
			theModel.addObject("sumItemInWishList", wishList.size());
			
		} else {
			theModel.addObject("sumItemInWishList", 0);
		}
	}
	
	
	public boolean isCurrentAuthentication() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			System.err.println("USER IS ON LOGIN");
			return true; // Authenticated User
		}
		System.err.println("IS ANONYMOUS");
		return false; // Anonymous
	}
	
	// ====================================== SUPPORT

	
	
}
