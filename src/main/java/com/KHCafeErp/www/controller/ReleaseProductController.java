package com.KHCafeErp.www.controller;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.KHCafeErp.www.service.face.ReleaseProductService;

@Controller
public class ReleaseProductController {
	
	@Autowired ReleaseProductService releaseProductService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReleaseProductController.class);


	@RequestMapping(value="/release/list" ,method=RequestMethod.GET)
	public String releaseList() {
		logger.info("releaseList()");
		
		return "/release/releaseList";
	}
	
	// 19-12-31 유진 - 엑셀 업로드
	@RequestMapping(value = "/release/upload")
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
        
        releaseProductService.insertMassiveProduct(destFile);
        
        ModelAndView view = new ModelAndView();
        
        view.setViewName("redirect:/release/list");
        
        return view;
	}
}
