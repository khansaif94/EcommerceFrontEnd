package com.niit.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CartDao;
import com.niit.dao.ProductDao;
import com.niit.model.Cart;
import com.niit.model.Product;

@Controller
public class CartController {

	Logger log = LoggerFactory.getLogger(CartController.class);
	@Autowired
	private CartDao cartDao;

	
	private Cart cart= new Cart();

	@Autowired
	ProductDao productDao;
	
	@Autowired
	HttpSession session;

	
	@RequestMapping(value = "/Cart", method = RequestMethod.GET)
	public String cart(Model model) {
		
		
		// get the logged-in user id
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");

		if (loggedInUserid == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserid = auth.getName();
			@SuppressWarnings("unchecked")
			Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>)   auth.getAuthorities();
			authorities.contains("ROLE_USER");
			
		}
		if(loggedInUserid!=null)
		{

		int cartSize = cartDao.list(loggedInUserid).size();

		if (cartSize == 0) {
			model.addAttribute("msg", "You do not have any products in your Cart");
		} 
		else
		{
			model.addAttribute("cartList", cartDao.list(loggedInUserid));
			model.addAttribute("totalAmount", cartDao.getTotalAmount(loggedInUserid));
			model.addAttribute("displayCart", "true");
		}
		
		}
		
		return "/Cart";
	}

	// For add and update Cart both
	@RequestMapping(value = "/cart/add/{id}", method = RequestMethod.GET)
	public ModelAndView addToCart(@PathVariable("id") String id) {
		log.debug("Starting of the method addToCart");
		// get the product based on product id
		Product product = productDao.getProductById(id);
		cart.setPrice(product.getPrice());
		cart.setProduct_name(product.getProductname());
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");
		if (loggedInUserid == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserid = auth.getName();
		}
		cart.setUser_name(loggedInUserid);
		//It is not required if you given default value while creating the table
		cart.setStatus('N'); // Status is New. Once it is dispatched, we can
								// changed to 'D'
		
		//To get sequence number, you can do programmatically in DAOImpl
		//myCart.setId(ThreadLocalRandom.current().nextLong(100, 1000000 + 1));

		
		cartDao.save(cart);

		ModelAndView mv = new ModelAndView("redirect:/Cart");
		mv.addObject("msg", " Successfuly added the product to Cart");
		mv.addObject("product",product);  
		log.debug("Ending of the method addToCart");
		return mv;

	}
	
	@RequestMapping("/cart/delete/{id}")
	public String deletecart(@PathVariable("id") int id, Model model){
       
		
			boolean flag=cartDao.delete(id);
			
		if(flag == true)
		model.addAttribute("msg","Product Removed from cart Successfully");
		else
			model.addAttribute("msg","Product not Removed");
		
		return cart(model);
		
	}
}

