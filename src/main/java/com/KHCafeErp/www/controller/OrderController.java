package com.KHCafeErp.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class OrderController {


	@RequestMapping(value="/order/orderlist" ,method=RequestMethod.GET)
	public void Orderlist(Model model) {
		
	}
	
}
