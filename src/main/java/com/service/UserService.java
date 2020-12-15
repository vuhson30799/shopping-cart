package com.service;

import java.util.List;

import com.model.User;

public interface UserService {

	List<User> getAllUsers();
	
	void deleteUser(Long userId);
	
	void addUser(User user);
	
	User getUserById(Long userId);

	User getUserByEmail(String emailId);
}
