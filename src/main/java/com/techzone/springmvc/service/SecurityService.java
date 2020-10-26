package com.techzone.springmvc.service;

import javax.servlet.http.HttpServletRequest;

public interface SecurityService {
	
	public String findLoggedInUsername();
	
	public void autoLogin(String username , String password , HttpServletRequest request);

}
