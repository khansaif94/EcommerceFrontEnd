package com.niit.controller;



import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.niit.model.Product;
import com.niit.services.ProductService;


@Controller
public class ProductController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ProductService service;
	
	@Autowired
	Product product;
	
	@RequestMapping(value="/admin/saveProduct", method=RequestMethod.POST)
	public ModelAndView addProduct(HttpServletRequest request,@ModelAttribute("product") @Valid Product pro, BindingResult  result,Model model){
	 if(result.hasErrors())
	 {
		 return new ModelAndView("/admin/Product");
	 }
	 else{
		 pro.setImage(pro.getFile().getOriginalFilename());
		 service.storeFile( pro, request);
		boolean saved= service.saveProduct(pro);
		if(saved)
		{
			model.addAttribute("msg","Product Saved Sucessfully");
		}
     session.setAttribute("productList", service.getAllProducts());
		
		ModelAndView mv=new ModelAndView("admin/Product");
		mv.addObject("product",product);
		return mv;
	 }
	
	}
	
	
	
	@RequestMapping(value="/admin/editProduct/{id}", method=RequestMethod.GET)
	public ModelAndView edit(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("/admin/Product");
		Product pro =service.getProductById(id);
		mv.addObject("product", pro);
		mv.addObject("isEdit",true);	
		return mv;		
	}
	
	@RequestMapping(value="/admin/editProduct", method=RequestMethod.POST)
	public ModelAndView edit(@ModelAttribute("product") @Valid Product pro, BindingResult  result,Model model){
		 if(result.hasErrors())
		 {
			 return new ModelAndView("/admin/Product");
		 }
		 else{
			 pro.setImage(pro.getFile().getOriginalFilename());
			boolean saved= service.updateProduct(pro);
			if(saved)
			{
				model.addAttribute("msg","Product Updated Sucessfully");
			}
	session.setAttribute("productList", service.getAllProducts());
			
			ModelAndView mv=new ModelAndView("admin/Product");
			mv.addObject("product",product);
			return mv;
		 }
		
		}
	
	@RequestMapping(value="/admin/deleteProduct/{id}", method=RequestMethod.GET)
	public ModelAndView delete (@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("/admin/Product");
		Product pro =service.getProductById(id);
		if(service.deleteProduct(pro))
		{
			mv.addObject("msg","Product Deleted Sucessfully");
			session.setAttribute("productList", service.getAllProducts());
			
		}
		mv.addObject("Product", new Product());
		return mv;		
	}
}
