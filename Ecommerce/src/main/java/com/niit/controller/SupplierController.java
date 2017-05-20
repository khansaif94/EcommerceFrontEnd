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

import com.niit.model.Supplier;
import com.niit.services.SupplierService;



@Controller
public class SupplierController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	SupplierService service;
	@Autowired
	Supplier supplier;
	
	@RequestMapping(value="/admin/saveSupplier", method=RequestMethod.POST)
	public ModelAndView addSupplier(@ModelAttribute("supplier") @Valid Supplier sup, BindingResult  result,Model model){
	 if(result.hasErrors())
	 {
		 return new ModelAndView("/admin/Supplier");
	 }
	 else{
		boolean saved= service.saveSupplier(sup);
		if(saved)
		{
			model.addAttribute("msg","Supplier Saved Sucessfully");
		}
session.setAttribute("supplierList", service.getAllSupplier());
		
		ModelAndView mv=new ModelAndView("admin/Supplier");
		mv.addObject("supplier",supplier);
		return mv;
	 }
	
	}
	
	@RequestMapping(value="/admin/editSupplier/{id}", method=RequestMethod.GET)
	public ModelAndView edit(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("/admin/Supplier");
		Supplier sup =service.getSupplierById(id);
		mv.addObject("supplier", sup);
		mv.addObject("isEdit",true);
		
		return mv;		
	}
	@RequestMapping(value="/admin/editSupplier", method=RequestMethod.POST)
	public ModelAndView edit(@ModelAttribute("supplier") @Valid Supplier sup, BindingResult  result,Model model){
		 if(result.hasErrors())
		 {
			 return new ModelAndView("/admin/Supplier");
		 }
		 else{
			boolean saved= service.updateSupplier(supplier);
			if(saved)
			{
				model.addAttribute("msg","Supplier Updated Sucessfully");
			}
	session.setAttribute("supplierList", service.getAllSupplier());
			
			ModelAndView mv=new ModelAndView("admin/Supplier");
			mv.addObject("supplier",supplier);
			return mv;
		 }
		
		}
	@RequestMapping(value="/admin/deleteSupplier/{id}", method=RequestMethod.GET)
	public ModelAndView ModelAndView (@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("/admin/Supplier");
		Supplier sup =service.getSupplierById(id);
		if(service.deleteSupplier(sup))
		{
			mv.addObject("msg","Supplier Deleted Sucessfully");
			session.setAttribute("supplierList", service.getAllSupplier());
			
		}
		mv.addObject("supplier", new Supplier());
		
		
		return mv;		
	}

}
