package com.techzone.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techzone.springmvc.entity.User;
import com.techzone.springmvc.exception.ResourceNotFoundException;
import com.techzone.springmvc.model.ItemModel;
import com.techzone.springmvc.model.UserCheckoutModel;
import com.techzone.springmvc.service.CartDBService;
import com.techzone.springmvc.service.CategoryService;
import com.techzone.springmvc.service.UserService;
import com.techzone.springmvc.util.SecurityUtil;
import com.techzone.springmvc.validator.UserCheckoutValidator;
import com.techzone.springmvc.view.ResponseInfoShopping;

@Controller
@RequestMapping("/cart")
public class CartController {

	// TODO : Dependency Injection
	@Autowired
	private UserService userService;

	@Autowired
	private UserCheckoutValidator userCheckoutValidator;

	@Autowired
	private CartDBService cartDBService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private HttpSession session;
	// TODO : Dependency Injection

	@GetMapping("")
	public String cartPage(ModelMap theModel, HttpServletRequest request) throws ResourceNotFoundException {

		theModel.addAttribute("cart", cartDBService.getItemsInCartDB());
		return "/shopping/cart";
	}

	@GetMapping("/addProductToCart")
	public String addProductToCart(@RequestParam("productId") int theProductId, ModelMap theModel) {
		if (cartDBService.addCart(theProductId)) {
			return "redirect:/cart";
		}
		return "redirect:/";
	}
	
	
	@GetMapping("/removeProductInCart")
	public String removeProductInCart(@RequestParam("productId") int theProductId, ModelMap theModel) {
		
		cartDBService.removeProductInCart(theProductId);
		return "redirect:/cart";
	}
	
	
	@GetMapping("/clearCart")
	public String clearCart() {
		
		if (isCurrentAuthentication()) { // User Authentication
			
			cartDBService.clearCartFromCartDBByUserId(userService.findByUsername(SecurityUtil.getPrincipal()).getId());
			
		} else { // Is Anonymous
			
			cartDBService.clearCartInSession();
		}
		return "redirect:/cart";
	}

	@GetMapping("/buy")
	public String buyCart(ModelMap theModel) {

		List<ItemModel> listItem = cartDBService.getItemsInCartDB();
		if (listItem.size() == 0)
			return "redirect:/cart";
			
		UserCheckoutModel theUserCheckoutModel = new UserCheckoutModel();
		
		if (isCurrentAuthentication()) { // User Authentication
			theUserCheckoutModel.setUser(userService.findByUsername(SecurityUtil.getPrincipal()));
		} else { // Is Anonymous
			theUserCheckoutModel.setUser(new User());
		}
		
		theModel.addAttribute("listCategory", categoryService.getCategorys());
		theModel.addAttribute("theUserCheckoutModel", theUserCheckoutModel);
		setModelCheckOutIntoSession(theUserCheckoutModel , listItem);
		
		getAllComponent(listItem, theModel);
		return "/shopping/checkout";
	}

	
	
	
	@PostMapping("/confirmPayment")
	@Transactional
	public String orderSuccess(@ModelAttribute("theUserCheckoutModel") UserCheckoutModel theUserCheckoutModel,
			BindingResult bindingResult, ModelMap theModel) {

		userCheckoutValidator.validate(theUserCheckoutModel, bindingResult);

		if (bindingResult.hasErrors()) {
			
			theModel.addAttribute("theUserCheckoutModel", getUserCheckOutModelFromSession());
			
			getAllComponent(getListItemModelFromSession(), theModel);
			
			theModel.addAttribute("message", "Something wrong when confirm infomation , please check info ");
			return "/shopping/checkout";

		}
		
		clearSession();
		
		User theUser;
		boolean isAuthenticated = false;
		
		if (isCurrentAuthentication()) { // User Authentication
			isAuthenticated = true;
			System.err.println("-------------------- INFO ODER OF USER ALREADY --------------------");
			theUser = userService.findByUsername(SecurityUtil.getPrincipal());
			System.out.println("User Name : " + theUser.getLastName());
			System.out.println("User Email : " + theUser.getEmail());
			System.out.println("User Phone : " + theUserCheckoutModel.getPhone());
			System.out.println("User City : " + theUserCheckoutModel.getCity());
			System.out.println("User Address : " + theUserCheckoutModel.getAddress());
			System.out.println("User Note : " + theUserCheckoutModel.getNote());
			System.err.println("-------------------- INFO ODER OF USER ALREADY --------------------");
		} else {
			System.err.println("-------------------- INFO ORDER NEW USER IN TRANSACTION --------------------");
			theUser = theUserCheckoutModel.getUser();
			System.out.println("Username - Password : " + theUser.getUsername() + " - " + theUser.getPassword());
			System.out.println("Name User : " + theUser.getFirstName() + theUser.getLastName());
			System.out.println("User Email : " + theUser.getEmail());
			System.out.println("User Phone : " + theUserCheckoutModel.getPhone());
			System.out.println("User City : " + theUserCheckoutModel.getCity());
			System.out.println("User Address : " + theUserCheckoutModel.getAddress());
			System.out.println("User Note : " + theUserCheckoutModel.getNote());
			System.err.println("-------------------- INFO ORDER NEW USER IN TRANSACTION --------------------");
		}
		
		ResponseInfoShopping theResponseInfoShopping = cartDBService.buy(theUser , theUserCheckoutModel , isAuthenticated);
		
		if (theResponseInfoShopping != null) {
			if (isAuthenticated == true) { // User Authenticated
				cartDBService.clearCartFromCartDBByUserId(theUser.getId());
			} else { // Is Anonymous
				cartDBService.clearCartInSession();
			}
			
			theModel.addAttribute("theResponseInfoShopping", theResponseInfoShopping);
		}

		return "/shopping/order-success";

	}
	
	

	// == == == == == == == == == == == == == == == == == == == == == == == == == == //
	public void getAllComponent(List<ItemModel>listItem , ModelMap theModel) {
		
		theModel.addAttribute("cityList", catalogCity());
		theModel.addAttribute("listItem",listItem );
		theModel.addAttribute("totalPayment",(long) totalPayment(listItem) );
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

	public List<String> catalogCity() {
		List<String> city = new ArrayList<String>();
		city.add("Ho Chi Minh");
		city.add("Ha Hoi");
		city.add("Da Nang");
		city.add("Can Tho");
		city.add("Nha Trang");
		return city;
	}
	
	public long totalPayment(List<ItemModel> listItem) {
		long sum = 0;
		for (ItemModel i : listItem) {
			sum +=  i.getProduct().getPrice() * i.getQuantity();
		}
		return sum;
	}
	
	protected void setModelCheckOutIntoSession(UserCheckoutModel theUserCheckoutModel , List<ItemModel> listItem) {
		session.setAttribute("theUserCheckoutModel", theUserCheckoutModel);
		session.setAttribute("listItem", listItem);
	}
	
	protected UserCheckoutModel getUserCheckOutModelFromSession() {
		UserCheckoutModel theUserCheckoutModel = (UserCheckoutModel) session.getAttribute("theUserCheckoutModel");
		return theUserCheckoutModel;
	}
	
	protected List<ItemModel> getListItemModelFromSession() {
		@SuppressWarnings("unchecked")
		List<ItemModel> listItem = (List<ItemModel>) session.getAttribute("listItem");
		return listItem;
	}
	
	protected void clearSession() {
		session.removeAttribute("theUserCheckoutModel");
		session.removeAttribute("listItem");
	}

	// == == == == == == == == == == == == == == == == == == == == == == == == == == //

}
