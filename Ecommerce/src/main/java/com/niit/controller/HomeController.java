package com.niit.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	@RequestMapping(value={"/","/Ecommerce"})
	public String Home()
	{
		return"homepg";
	}
	
	@RequestMapping("/Aboutus")
	public String About()
	{
		return"Aboutus";
	}
	
	@RequestMapping("/Contactus")
	public String Contact()
	{
		return"Contactus";
	}
	
	
	@RequestMapping("/Login")
	public String Login()
	{
		return"Login";
	}
	
	@RequestMapping("/AdminHome")
	public String AdminHome()
	{
		return"admin/AdminHome";
	}
	

}
