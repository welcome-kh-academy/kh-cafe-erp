package com.KHCafeErp.www.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.dto.OrderBase;
import com.KHCafeErp.www.dto.OrderProduct;
import com.KHCafeErp.www.dto.Product;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.OrderService;
import com.KHCafeErp.www.util.ExcelWriter;
import com.KHCafeErp.www.util.Paging;


@Controller
public class OrderController {

   @Autowired OrderService orderService;
   
   private static final Logger logger = LoggerFactory.getLogger(OrderController.class);


   @RequestMapping(value="/order/orderlist" ,method=RequestMethod.GET)
   public void Orderlist(Model model) {
      List<Shop> shopList = orderService.getShopList();
      model.addAttribute(shopList);
      
   }
      
   @RequestMapping(value = "/order/popExcel", method = RequestMethod.GET)
   public void popExcel() {
      
   }
   
   @RequestMapping(value="/order/search" ,method=RequestMethod.GET)
   public ModelAndView releaseSearch(OrderBase orderBase, ModelAndView mav) {
      
      List<OrderBase> orderBaseList = orderService.getOrderList(orderBase);

      List llist = new ArrayList();
      List list = null;
      
      for(OrderBase r : orderBaseList) {
         list = new ArrayList();
         list.add(r.getOrderNo());
         list.add(r.getCusNo());
         list.add(r.getshopName());
         list.add(r.getOrderDate());      
         list.add(r.getCusReq());
         if(r.getOrderStatus()==0){
            list.add("장바구니");
         }else if (r.getOrderStatus()==1) {
            list.add("주문완료");
         }else  {
            list.add("결제완료");
         }
         llist.add(list);
      }

      mav.addObject("data",llist);
//      mav.addObject("data",data);
      mav.setViewName("jsonView");
      
      return mav;
   }
   
   @RequestMapping(value = "/order/detailview" , method = RequestMethod.GET)
   public void detailview(OrderBase orderBase, OrderProduct orderproduct, Model model) {      
      
      List<OrderProduct> orderProductlist =orderService.selectorderProduct(orderBase);
   
//      System.out.println(orderBase);
      model.addAttribute("orderProductlist",orderProductlist);

      logger.info(orderProductlist.toString());
      
   }
   // 19-12-31 유진 - 엑셀 업로드
   @RequestMapping(value = "/order/upload", method = RequestMethod.POST)
   public ModelAndView uploadExcel(MultipartHttpServletRequest request) {
      logger.info("uploadExcel()");
      
      MultipartFile excelFile = request.getFile("excelFile");
        if(excelFile==null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀파일을 선택해 주세요");
        }
 
        File destFile = new File("D:\\"+excelFile.getOriginalFilename());
        try {
            excelFile.transferTo(destFile);
        } catch (IllegalStateException | IOException e) {
            throw new RuntimeException(e.getMessage(),e);
 
        }
        
        orderService.insertMassiveProduct(destFile);
        
        ModelAndView view = new ModelAndView();
        
        view.setViewName("/release/excel-success");
        
        return view;
   }
   
   @RequestMapping(value = "/order/exceldown")
   public String orderDown() {
      List<OrderBase> orderList = orderService.getList();
      System.out.println(orderList);
      
      ExcelWriter excelWriter = new ExcelWriter();
      excelWriter.orderXls(orderList);
      
      logger.info("엑셀 다운 완료");
      
      return "redirect:/order/orderlist";
   }
}