package com.niit.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.Category;
import com.niit.services.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	HttpSession session;
	@Autowired
	CategoryService service;
	@Autowired
	Category category;
	
	@RequestMapping(value="/admin/saveCategory", method=RequestMethod.POST)
	public ModelAndView addCategory(@ModelAttribute("category") @Valid Category cat, BindingResult  result,Model model){
	 if(result.hasErrors())
	 {
		 return new ModelAndView("/admin/Category");
	 }
	 else{
		boolean saved= service.saveCategory(cat);
		if(saved)
		{
			model.addAttribute("msg","Category Saved Sucessfully");
		}
session.setAttribute("categoryList", service.getAllCategory());
		
		ModelAndView mv=new ModelAndView("admin/Category");
		mv.addObject("category",category);
		return mv;
	 }
	
	}
	
	@RequestMapping(value="/admin/editCategory/{id}", method=RequestMethod.GET)
	public ModelAndView edit(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("/admin/Category");
		Category cat =service.getCategoryById(id);
		mv.addObject("category", cat);
		mv.addObject("isEdit",true);
		
		return mv;		
	}
	@RequestMapping(value="/admin/editCategory", method=RequestMethod.POST)
	public ModelAndView edit(@ModelAttribute("category") @Valid Category cat, BindingResult  result,Model model){
		 if(result.hasErrors())
		 {
			 return new ModelAndView("/admin/Category");
		 }
		 else{
			boolean saved= service.updateCategory(cat);
			if(saved)
			{
				model.addAttribute("msg","Category Updated Sucessfully");
			}
	session.setAttribute("categoryList", service.getAllCategory());
			
			ModelAndView mv=new ModelAndView("admin/Category");
			mv.addObject("category",category);
			return mv;
		 }
		
		}
	@RequestMapping(value="/admin/deleteCategory/{id}", method=RequestMethod.GET)
	public ModelAndView ModelAndView (@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("/admin/Category");
		Category cat =service.getCategoryById(id);
		if(service.deleteCategory(cat))
		{
			mv.addObject("msg","Category Deleted Sucessfully");
			session.setAttribute("categoryList", service.getAllCategory());
			
		}
		mv.addObject("category", new Category());
		
		
		return mv;		
	}
}
