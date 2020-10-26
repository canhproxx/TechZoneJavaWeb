package com.techzone.springmvc.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.techzone.springmvc.entity.Bill;
import com.techzone.springmvc.entity.BillDeTail;
import com.techzone.springmvc.entity.Product;
import com.techzone.springmvc.entity.Role;
import com.techzone.springmvc.entity.User;
import com.techzone.springmvc.entity.WishList;
import com.techzone.springmvc.exception.ResourceNotFoundException;
import com.techzone.springmvc.instance.MyConstants;
import com.techzone.springmvc.model.ItemModel;
import com.techzone.springmvc.model.RecoveryModel;
import com.techzone.springmvc.model.UserModel;
import com.techzone.springmvc.service.BillDetailService;
import com.techzone.springmvc.service.BillService;
import com.techzone.springmvc.service.CartDBService;
import com.techzone.springmvc.service.ImageService;
import com.techzone.springmvc.service.ProductService;
import com.techzone.springmvc.service.UserService;
import com.techzone.springmvc.service.WishListService;
import com.techzone.springmvc.util.SecurityUtil;
import com.techzone.springmvc.validator.UserUpdateValidator;

@Controller
@RequestMapping("/")
public class AppController {

	// TODO : Dependency Injection
	@Autowired
	private ProductService productService;

	@Autowired
	private ImageService imageService;

	@Autowired
	private UserService userService;

	@Autowired
	private BillService billService;

	@Autowired
	private BillDetailService billDetailService;

	@Autowired
	private UserUpdateValidator userUpdateValidator;

	@Autowired
	private WishListService wishListService;
	
	@Autowired
	private CartDBService cartDBService;
	
	@Autowired
	public JavaMailSender emailSender;

	@Autowired
	private AuthenticationManager authenticationManager;
	// TODO : Dependency Injection

	
	@GetMapping("/product{productId}")
	public ModelAndView goPageInfoProduct(@RequestParam("productId") int theId, ModelAndView theModel,
			HttpServletResponse httpServletResponse) throws ResourceNotFoundException {

		Product theProduct = productService.getProduct(theId);
		String categoryName = theProduct.getCategory().getName();
		List<Product> relatedProduct = productService.findProductByCategoryName(categoryName);

		theModel.addObject("product", theProduct);
		theModel.addObject("relatedProduct", relatedProduct);
		theModel.addObject("images", imageService.getImagesByProductId(theId));
		theModel.addObject("cart", cartDBService.getItemsInCartDB());
		theModel.setViewName("/shopping/info-product");
		
		sumItemInCart(theModel);
		sumItemInWishList(theModel);

		return theModel;
	}

	@GetMapping("/orderHistory")
	public ModelAndView goPageOrderHistory(ModelAndView theModel) {

		List<Bill> theBills = billService
				.getBillsByCustomerId(userService.findByUsername(SecurityUtil.getPrincipal()).getId());
		theModel.addObject("theBills", theBills);
		theModel.setViewName("/shopping/order-history");
		return theModel;
	}

	@GetMapping("/getDetailBill")
	public String getDetailBill(@RequestParam("theBillId") int theBillId, ModelMap theModel) {

		List<BillDeTail> theBillDetails = billDetailService.getBillDetailByBillId(theBillId);

		theModel.addAttribute("theBillDetails", theBillDetails);

		return "/shopping/orderdetail-history";

	}

	@GetMapping("/myAccount")
	public String myAccount(ModelMap theModel) {

		String userName = SecurityUtil.getPrincipal();

		User theUser = userService.findByUsername(userName);

		UserModel theUserModel = new UserModel(theUser, null);

		theModel.addAttribute("userForm", theUserModel);

		return "/user/info-user";

	}

	@PostMapping(value = "/updateAccount")
	public String registration(@ModelAttribute("userForm") UserModel userForm, BindingResult bindingResult,
			ModelMap theModel, HttpServletRequest request) {

		userUpdateValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {

			theModel.addAttribute("message", "MISSING FIELD , PLEASE CHECK AGAIN !");
			theModel.addAttribute("userForm", userForm);
			return "/user/info-user";
		}

		User theUser = userForm.getUser(); // User Changed In Form

		int[] listRole = getYourRole(userService.findByUsername(SecurityUtil.getPrincipal()));

		userService.updateUserWithRole(SecurityUtil.getPrincipal(), theUser, listRole);

		theModel.addAttribute("message", "YOUR ACCOUNT UPDATED SUCCESSFULLY !!!");
		authenticateUserAndSetSession(theUser, request);
		return "/user/info-user";

	}

	@GetMapping("/addToWishList")
	public String addProductToWishList(@RequestParam("productId") int theProductId, ModelMap theModel,
			HttpServletRequest httpServletRequest) throws ResourceNotFoundException {

		String referrer = httpServletRequest.getHeader("referer");

		if (isCurrentAuthentication()) {

			// Check product exist in wish list of this user

			User theUser = userService.findByUsername(SecurityUtil.getPrincipal());
			Product theProduct = productService.getProduct(theProductId);

			List<WishList> wishLists = wishListService.getWishLists(theUser.getId());

			boolean empty = wishLists.isEmpty();

			if (empty) {
				WishList theWishList = new WishList(theUser, theProduct, createAddItemIntoWishList());
				wishListService.saveWishList(theWishList);
			}
			if (!empty) {
				if (checkProductAddToWishListIsExistingOnWishListUser(wishLists, theProduct) == false) {
					WishList theWishList = new WishList(theUser, theProduct, createAddItemIntoWishList());
					wishListService.saveWishList(theWishList);
				} else {
					// make late
				}
			}
		}

		// check if not current login will remind user login
		if (!isCurrentAuthentication()) {
			return "redirect:/showMyLoginPage";
		}

		return "redirect:" + referrer;
	}

	@GetMapping("/wishList")
	public String goPageWishList(ModelMap theModel) {

		if (isCurrentAuthentication()) {
			User theUser = userService.findByUsername(SecurityUtil.getPrincipal());

			List<WishList> wishList = wishListService.getWishLists(theUser.getId());

			if (!isCurrentAuthentication()) {
				return "redirect:/showMyLoginPage";
			}

			theModel.addAttribute("wishList", wishList);
		}
		if ( ! isCurrentAuthentication()) {
			return "redirect:/showMyLoginPage";
		}
		
		return "/user/wishlist";
	}
	
	@GetMapping("/removeItemFromWishList")
	public String removeItemFromWishList(ModelMap theModel , @RequestParam("wishListId") int theId) {
		
		wishListService.deleteWishList(theId);
		
		return "redirect:/wishList";
	}
	
	
	@GetMapping("/recoveryPassword")
	public String recoveryPassword(ModelMap theModel) {
		theModel.addAttribute("recovery", new RecoveryModel());
		return "/user/recovery-password";
	}
	
	@PostMapping("/recoveryPassword")
	public String handleRecoveryAccount(@ModelAttribute("recovery") RecoveryModel theRecoveryModel , ModelMap theModel) {
		
		if (userService.findByEmail(theRecoveryModel.getEmailRecovery()) == null) {
			
			theModel.addAttribute("recovery", new RecoveryModel());
			theModel.addAttribute("message", "Email is not exist , please check your email !");
			return "/user/recovery-password";
		}
		
		String newPassword = generatorRandomPassword();
		userService.recoveryPasswordAccount(theRecoveryModel.getEmailRecovery(), newPassword);
		sendMailToRecoveryPasswordAccount(theRecoveryModel.getEmailRecovery(),newPassword);
		
		return "redirect:/";
		
	}
	
	

	// ================== SUPPORT =================
	
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

	public boolean checkProductAddToWishListIsExistingOnWishListUser(List<WishList> wishLists, Product theProduct) {

		for (WishList item : wishLists) {
			if (item.getProduct().getId() == theProduct.getId()) {
				return true; // is existing
			}
		}
		return false; // not exist
	}

	@SuppressWarnings("deprecation")
	public Date createAddItemIntoWishList() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		return date;
	}

	public int[] getYourRole(User theUser) {

		Set<Role> theUserRole = theUser.getRoles();
		int i = 0;
		int[] roles = new int[theUserRole.size()];
		for (Iterator<Role> iter = theUserRole.iterator(); iter.hasNext();) {
			Role r = iter.next();
			roles[i] = r.getId();
			i++;
		}
		return roles;
	}

	// TODO : protected AuthenticationManager authenticationManager;
	protected void authenticateUserAndSetSession(User user, HttpServletRequest request) {
		String username = user.getUsername();
		String password = user.getPassword();
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);

		// generate session if one doesn't exist
		request.getSession();

		token.setDetails(new WebAuthenticationDetails(request));
		Authentication authenticatedUser = authenticationManager.authenticate(token);

		SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
	}

	// TODO : Check Authentication at this moment
	public boolean isCurrentAuthentication() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			System.err.println("USER IS ON LOGIN");
			return true; // Authenticated User
		}
		System.err.println("IS ANONYMOUS");
		return false; // Anonymous
	}
	
	public void sendMailToRecoveryPasswordAccount(String mailAddress , String newPassword) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(MyConstants.MY_EMAIL);
		message.setTo(mailAddress);
		message.setSubject("TechZone Recovery Password");
		message.setText("This is new your password : " + newPassword + ". You should change to easy remember");
		emailSender.send(message);
	}
	
	public String generatorRandomPassword() {
		String newPass = "";
		Random randomGenerator = new Random();
		for (int i = 0 ; i < 8 ; i++) {
			newPass += String.valueOf(randomGenerator.nextInt(9) + 1);
		}
		return newPass;
	}
	
	
	// TODO : Access Denied
	@GetMapping("/Access_Denied")
	public String accessDenied() {
		return "accessdenied";
	}

}
