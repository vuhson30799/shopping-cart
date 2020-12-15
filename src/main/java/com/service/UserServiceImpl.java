package com.service;

import java.util.List;

import com.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model.User;

@Service
public class UserServiceImpl implements UserService {
	private final UserRepository userRepository;

	public UserServiceImpl(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Transactional
	public List<User> getAllUsers() {
	return userRepository.findAll();
	}

	@Transactional
	public void deleteUser(Long userId) {
		userRepository.deleteById(userId);
	}
	@Transactional 
	public void addUser(User user){
		userRepository.save(user);
	}
	
	public User getUserById(Long userId) {
		return userRepository.findById(userId).orElseThrow();
	}

	@Override
	public User getUserByEmail(String emailId) {
		return userRepository.findByEmailId(emailId);
	}


}
