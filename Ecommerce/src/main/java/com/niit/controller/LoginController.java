package com.niit.controller;

import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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
	
	//Saving New Registered User
	
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
	
	
	// Displaying Register Page
	@RequestMapping(value="/User", method=RequestMethod.GET)
	public ModelAndView register()
	{
		ModelAndView mv=new ModelAndView("User");
		mv.addObject("user",new User());
			return mv;
	}
	
	@RequestMapping("/failedlogin")
	public ModelAndView loginFailed()
	{
			ModelAndView mv=new ModelAndView("Login");
			mv.addObject("errmsg","Login Failed");
			return mv;
	}
	@RequestMapping("/welcome")
	public ModelAndView welcome(HttpServletRequest request)
	{
		ModelAndView mv =null ;
		session=request.getSession(true);
		Authentication auth = (Authentication) SecurityContextHolder.getContext().getAuthentication();
		String userID = auth.getName();
		session.setAttribute("loggedInUser", userID);
		Collection<?extends GrantedAuthority> authority=auth.getAuthorities();
		for(GrantedAuthority grantedAuthority : authority)
		{
		
			if(grantedAuthority.getAuthority().equals("ROLE_ADMIN")){
				mv= new ModelAndView("admin/AdminHome");
				session.setAttribute("isAdmin", true);
				return mv;
			}
			if(grantedAuthority.getAuthority().equals("ROLE_USER")){
				mv= new ModelAndView("homepg");
				session.setAttribute("isUser", true);
				return mv;
			}
		}
		return mv;
	}
	@RequestMapping("/logout") 
	public ModelAndView logout()
	{
		System.out.println("Logging you out...");
			ModelAndView mv=new ModelAndView("Login");
			mv.addObject("errmsg","Logout Successfully");
		//	session.removeAttribute("loggedInUser");
		//	session.removeAttribute("isAdmin");
		//	session.removeAttribute("isUser");
			return mv;
	}
	
}
	

