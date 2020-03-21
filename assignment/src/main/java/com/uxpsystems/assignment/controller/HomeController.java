package com.uxpsystems.assignment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {


	@RequestMapping("/")
	public String getPage()
	{
		return "testAPIClient.jsp";
		
	}	
	@RequestMapping("/assignment")
	public String getHomePage()
	{
		return "testAPIClient.jsp";
		
	}	
	
	
	
}
