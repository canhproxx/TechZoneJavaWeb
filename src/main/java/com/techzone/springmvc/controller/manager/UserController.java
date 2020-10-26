package com.techzone.springmvc.controller.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techzone.springmvc.entity.Role;
import com.techzone.springmvc.entity.User;
import com.techzone.springmvc.model.UserModel;
import com.techzone.springmvc.service.RoleService;
import com.techzone.springmvc.service.UserService;
import com.techzone.springmvc.validator.UserUpdateValidator;
import com.techzone.springmvc.validator.UserValidator;

@Controller
@RequestMapping("/admin/user")
public class UserController {
	
	// TODO : Dependency Injection
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserUpdateValidator userUpdateValidator;
	
	@Autowired
	private UserValidator userValidator;
	
	@Autowired
	private HttpSession session;
	
	// TODO : Dependency Injection
	
	
	private Map<Integer, String> roleUser;
	
	@GetMapping("/")
	public String handleOrigin() {
		return "redirect:/admin/user/list";
	}
	
	@GetMapping("/list")
	public String listUser(ModelMap theModel) {
		theModel.addAttribute("users", userService.getUsers());
		return "/admin/list-user";
	}
	
	
	@GetMapping("/addUser")
	public String registration(ModelMap model) {

		initListRole(model);

		model.addAttribute("userForm", new UserModel());
		return "/admin/form-add-user";
	}
	
	
	@PostMapping(value = "/addUser")
	public String registration(@ModelAttribute("userForm") UserModel userForm, BindingResult bindingResult,
			ModelMap model) {

		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			initListRole(model);
			model.addAttribute("userForm", userForm);
			return "/admin/form-add-user";
		}

		User user = userForm.getUser();

		List<String> listRole = null;
		try {
			listRole = userForm.getRoles();
		} catch (NullPointerException ex) {
			ex.printStackTrace();
		}

		if (listRole != null) { // TODO : save user with multiple selected role

			User newUser = userForm.getUser();

			int[] roles = new int[listRole.size()];
			for (int i = 0; i < listRole.size(); i++) {
				roles[i] = Integer.parseInt(listRole.get(i));
			}
			userService.saveWithRole(newUser, roles);
			
			return "redirect:/admin/user";

		}
		
		userService.save(user);// TODO : save user with default role

		return "redirect:/admin/user";
	}
	
	
	@GetMapping("/update")
	public String updateUser(@RequestParam("userId") int theId , ModelMap theModel) {
		
		initListRole(theModel);
		
		User theUser = userService.getUser(theId);
		
		UserModel theUserModel = new UserModel(theUser, null);
		
		theModel.addAttribute("userForm", theUserModel);
		
		session.setAttribute("oldUsdername", theUser.getUsername());
		
		return "/admin/form-update-user";
		
	}
	
	
	@PostMapping(value = "/saveUpdate")
	public String saveUpdate(@ModelAttribute("userForm") UserModel userForm , BindingResult bindingResult , ModelMap model) {
		
		userUpdateValidator.validate(userForm, bindingResult);
		if (bindingResult.hasErrors()) {
			initListRole(model);
			model.addAttribute("userForm", userForm);
			return "/admin/form-update-user";
		}
		
		User user = userForm.getUser();

		List<String> listRole = null;
		try {
			listRole = userForm.getRoles();
		} catch (NullPointerException ex) {
			ex.printStackTrace();
		}
		
		if (listRole != null) {
			int[] roles = new int[listRole.size()];
			for (int i = 0; i < listRole.size(); i++) {
				roles[i] = Integer.parseInt(listRole.get(i));
			}
			userService.updateUserWithRole((String)session.getAttribute("oldUsdername"),user, roles);
			session.removeAttribute("oldUsdername");
			return "redirect:/admin/user/list";
		}
		
		userService.updateUser((String)session.getAttribute("oldUsdername"),user);// TODO : save user with default role
		session.removeAttribute("oldUsdername");
		return "redirect:/admin/user/list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("userId") int theId) {
		
		User theUser = userService.getUser(theId);
		userService.deleteUser(theUser);
		
		return "redirect:/admin/user/list";
	}
	
	// == == == == == == == == == == == == == == == == == == == == //
	void initListRole(ModelMap theModel) {
		roleUser = new HashMap<Integer, String>();
		List<Role> roles = roleService.getRoles();
		for (int i = 0; i < roles.size(); i++) {
			roleUser.put(roles.get(i).getId(), roles.get(i).getRoleName().toString());
		}
		theModel.addAttribute("roles", roleUser);
	}
	// == == == == == == == == == == == == == == == == == == == == //

}
