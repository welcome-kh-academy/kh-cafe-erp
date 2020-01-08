package com.KHCafeErp.www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.OrderService;


@Controller
public class ManageStaffController {

@Autowired OrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);


	@RequestMapping(value="/manageStaff/staff" ,method=RequestMethod.GET)
	public void Orderlist(Model model) {
//		List<Shop> shopList = orderService.getShopList();
//		model.addAttribute(shopList);
		
	}
	
	
	
	
	
}
