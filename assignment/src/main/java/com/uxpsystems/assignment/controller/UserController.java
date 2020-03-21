package com.uxpsystems.assignment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.uxpsystems.assignment.pojos.User;
import com.uxpsystems.assignment.service.UserService;

@RestController
public class UserController {

	@Autowired
	UserService service;

	public UserService getService() {
		return service;
	}

	public void setService(UserService service) {
		this.service = service;
	}

	@GetMapping(path="/getUser", consumes = MediaType.APPLICATION_JSON_VALUE,produces = "application/json")
	public @ResponseBody User getEmployees(@RequestParam("userId") Long  userId) 
	{
		User user=new User();
		user.setUserId(userId);
		System.out.println("User Id:"+user);
		user=service.getUser(user);
		return user;
	}

	@PostMapping(path="/saveUser", consumes = MediaType.APPLICATION_JSON_VALUE,produces = "application/json")
	public @ResponseBody User saveUser(@RequestBody User user) 
	{
		System.out.println("User Id:"+user);
		user=service.saveUser(user);
		return user;
	}
	
	@PutMapping(path="/updateUser", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE,produces = "application/json")
	public @ResponseBody User updateUser(@RequestBody User user) 
	{
		System.out.println("User Id:"+user);
		user=service.updateUser(user);
		return user;
	}
	
	@DeleteMapping(path="/deleteUser", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE,produces = "application/json")
	public @ResponseBody User deleteUser(@RequestBody User user) 
	{
		System.out.println("User Id:"+user);
		user=service.deleteUser(user);
		return user;
	}
	
	
	@GetMapping(path="/testUser", consumes = MediaType.APPLICATION_JSON_VALUE,produces = "application/json")
	public @ResponseBody User testUser(@RequestParam("userId") Long l) 
	{ 
		User user=new User();
		user.setUserId(l);
		System.out.println("User Id:"+user);
		user=service.getUser(user);
		return user;
	}
}
