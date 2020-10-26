package com.techzone.springmvc.util;

import java.util.HashSet;
import java.util.Set;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.techzone.springmvc.entity.Role;
import com.techzone.springmvc.entity.User;

public class SecurityUtil {
	
	public static String getPrincipal() {
		
		String userName = null;
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if (principal instanceof UserDetails ) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	// TODO : Change Principal Username
	public static void updatePrincipal(User theUser , Set<Role> oldRoles) {
		
		Set<GrantedAuthority> grantedAuthorities = new HashSet<GrantedAuthority>();
 		for (Role role : oldRoles) {
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName().toString()));
			System.out.println("Role : " + role.getRoleName());
		}
		
		Authentication authentication = new UsernamePasswordAuthenticationToken(theUser, theUser.getPassword(), grantedAuthorities);
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
	}


	
}
