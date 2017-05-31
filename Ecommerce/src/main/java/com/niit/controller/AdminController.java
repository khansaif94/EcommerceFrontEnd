package com.niit.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.services.CategoryService;
import com.niit.services.SupplierService;
import com.niit.model.Category;
import com.niit.services.ProductService;
import com.niit.model.Product;
@Controller
public class AdminController {
	@Autowired
	HttpSession session;
	
	@Autowired
	CategoryService service;
	
	@Autowired
	Category category;
	
	@Autowired
	SupplierService service1;
	
	@Autowired
	com.niit.model.Supplier supplier;
	
	@Autowired
	ProductService service2;
	
	@Autowired
	Product product;
	
	@RequestMapping("/Product")
	public ModelAndView Product()
	{
		session.setAttribute("productList", service2.getAllProducts());
		session.setAttribute("categoryList", service.getAllCategory());
		session.setAttribute("supplierList", service1.getAllSupplier());
		ModelAndView mv=new ModelAndView("admin/Product");
		mv.addObject("product",product);
		return mv;
	}
	
	
	@RequestMapping("/Category")
	public ModelAndView Category()
	{
		session.setAttribute("categoryList", service.getAllCategory());
		
		ModelAndView mv=new ModelAndView("admin/Category");
		mv.addObject("category",category);
		return mv;
	}
	
	
	@RequestMapping("/Supplier")
	public ModelAndView Supplier()
	{
		session.setAttribute("supplierList", service1.getAllSupplier());
		
		ModelAndView mv=new ModelAndView("admin/Supplier");
		mv.addObject("supplier",supplier);
		return mv;
		
	}

}
