package com.uxpsystems.assignment.service;

import com.uxpsystems.assignment.pojos.User;
public interface UserService {

	public User getUser(User user);
	public User saveUser(User user);
	public User updateUser(User user);
	public User deleteUser(User user);
	
}
