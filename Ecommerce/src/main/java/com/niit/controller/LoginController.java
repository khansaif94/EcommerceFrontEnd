package com.niit.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.niit.model.User;
import com.niit.services.UserService;

@Controller
public class LoginController 
{
	
	@Autowired
	HttpSession session;
	
	@Autowired
	UserService service;
	
	@Autowired
	User user;
	
	
	
	@RequestMapping(value="/saveUser", method=RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("user") @Valid User usr, BindingResult  result,Model model)
	{
	 if(result.hasErrors())
	 {
		 model.addAttribute("msg","some error occured");
		 model.addAttribute("user",usr);
		 System.out.println(result.getFieldError().getField());
		 return new ModelAndView("User");
	 }
	 	else
	 	 {
	 		usr.setUserrole("ROLE_USER");
	 		boolean saved= service.saveUser(usr);
	 		if(saved)
	 		{
	 			model.addAttribute("msg","User Saved Sucessfully");
	 		}
	 			
		
	 			ModelAndView mv=new ModelAndView("User");
	 			mv.addObject("user",new User());
	 			return mv;
	 	 	}
		}	
	
	@RequestMapping(value="/User", method=RequestMethod.GET)
	public ModelAndView register()
	{
		ModelAndView mv=new ModelAndView("User");
		mv.addObject("user",new User());
			return mv;
	}
}
	

