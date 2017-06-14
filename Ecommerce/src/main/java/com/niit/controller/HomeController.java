package com.niit.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.Product;
import com.niit.services.CategoryService;
import com.niit.services.ProductService;


@Controller
public class HomeController 
{
	@Autowired
	CategoryService categoryService;
	@Autowired
	HttpSession session;
	@Autowired
	ProductService productService;
	
	@RequestMapping(value={"/","/Ecommerce"})
	public String Home()
	{
		session.setAttribute("categoryList",categoryService.getAllCategory());
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
	@RequestMapping("/ProductByCategory/{categoryId")
	public ModelAndView productByCategory (@PathVariable("categoryId") String id)
	{
		ModelAndView mv = new ModelAndView("Product");
		List<Product>prdlist =productService.getProductsByCategory(id);
		mv.addObject("productList",prdlist);
		mv.addObject("pro",new Product());
		return mv;
		
	}
	
}
