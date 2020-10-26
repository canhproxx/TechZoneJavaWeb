package com.techzone.springmvc.service.impl;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techzone.springmvc.entity.Role;
import com.techzone.springmvc.entity.User;
import com.techzone.springmvc.repository.RoleRepository;
import com.techzone.springmvc.repository.UserRepository;
import com.techzone.springmvc.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	@Transactional
	public void save(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
//		user.setRoles(new HashSet<Role>(roleRepository.findAll())); // this will provide all role
		HashSet<Role> roleDefault = new HashSet<Role>();
		roleDefault.add(roleRepository.getOne(3));// ROLE USER
		user.setRoles(roleDefault);
		userRepository.save(user);
	}
	
	@Override
	@Transactional
	public void saveWithRole(User user, int[] roles) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		HashSet<Role> ROLES = new HashSet<Role>();
		for (int i = 0 ; i < roles.length ; i++) {
			ROLES.add(roleRepository.getOne(roles[i]));
		}
		user.setRoles(ROLES);
		userRepository.save(user);
	}
	
	
	@Override
	@Transactional
	public void updateUser(String oldUsdername , User theUser) {
		
		User theUserUpdate = userRepository.findByUsername(oldUsdername);
		
		theUserUpdate.setLastName(theUser.getLastName());
		theUserUpdate.setFirstName(theUser.getFirstName());
		theUserUpdate.setEmail(theUser.getEmail());
		theUserUpdate.setUsername(theUser.getUsername());
		theUserUpdate.setPassword(bCryptPasswordEncoder.encode(theUser.getPassword()));
		
		HashSet<Role> roleDefault = new HashSet<Role>();
		roleDefault.add(roleRepository.getOne(3));
		theUserUpdate.setRoles(roleDefault);
		
		userRepository.saveAndFlush(theUserUpdate);
	}
	
	
	@Override
	@Transactional
	public void updateUserWithRole(String oldUsdername , User theUser, int[] roles) {
		User theUserUpdate = userRepository.findByUsername(oldUsdername);
		
		theUserUpdate.setLastName(theUser.getLastName());
		theUserUpdate.setFirstName(theUser.getFirstName());
		theUserUpdate.setEmail(theUser.getEmail());
		theUserUpdate.setUsername(theUser.getUsername());
		theUserUpdate.setPassword(bCryptPasswordEncoder.encode(theUser.getPassword()));
		
		HashSet<Role> ROLES = new HashSet<Role>();
		for (int i = 0 ; i < roles.length ; i++) {
			ROLES.add(roleRepository.getOne(roles[i]));
		}
		theUserUpdate.setRoles(ROLES);
		
		userRepository.saveAndFlush(theUserUpdate);
		
	}
	
	
	@Override
	@Transactional
	public void recoveryPasswordAccount(String email, String newPassword) {
		User theUserUpdate = userRepository.findByEmail(email);
		
		theUserUpdate.setPassword(bCryptPasswordEncoder.encode(newPassword));
		userRepository.saveAndFlush(theUserUpdate);
		
	}
	

	@Override
	@Transactional
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}
	
	@Override
	@Transactional
	public User getUser(int theId) {
		return userRepository.getOne(theId);
	}

	@Override
	@Transactional
	public List<User> getUsers() {
		return userRepository.findAll();
	}

	@Override
	@Transactional
	public void deleteUser(User theUser) {
		userRepository.delete(theUser);
	}

	@Override
	@Transactional
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}




	
	

} // END CLASS

