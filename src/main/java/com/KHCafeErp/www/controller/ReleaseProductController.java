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

import com.KHCafeErp.www.dto.Ingredient;
import com.KHCafeErp.www.dto.PlacingOrder;
import com.KHCafeErp.www.dto.Release;
import com.KHCafeErp.www.dto.ReleaseProduct;
import com.KHCafeErp.www.dto.Shop;
import com.KHCafeErp.www.service.face.ReleaseProductService;
import com.KHCafeErp.www.util.ExcelWriter;

@Controller
public class ReleaseProductController {
	
	@Autowired ReleaseProductService releaseProductService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReleaseProductController.class);

	@RequestMapping(value="/release/list" ,method=RequestMethod.GET)
	public void releaseList(Model model) {
		logger.info("releaseList()");
		List<Shop> shopList = releaseProductService.getShopList();
		model.addAttribute(shopList);
		List released = new ArrayList();
		
		List<Integer> placingOrderNoList = releaseProductService.getPlacingOrderNo();
		System.out.println(placingOrderNoList);
		
		for(int i=0; i<placingOrderNoList.size(); i++) {
//			System.out.println(placingOrderNoList.get(i));
			int placingOrderNo = placingOrderNoList.get(i);
			releaseProductService.insertRelease(placingOrderNo);
//			System.out.println(placingOrderNoList.get(i));
			
			int releaseNo = releaseProductService.getReleaseNo(placingOrderNo);
//			System.out.println("releaseNo "+releaseNo);
			List<Ingredient> releaseProductList = releaseProductService.getReleaseProductList(placingOrderNo);
//			System.out.println(releaseProductList);
			for(int j=0;j<releaseProductList.size();j++) {
//				System.out.println(releaseProductList.get(j));
				Ingredient ingredient = releaseProductList.get(j);
				ingredient.setReleaseNo(releaseNo);
//				System.out.println(ingredient);
				releaseProductService.insertReleaseProduct(ingredient);
			}
			
			String releaseProductCnt = releaseProductService.getReleaseTotalCnt(releaseNo);
//			System.out.println(releaseProductCnt);
			String afterReleaseCnt = releaseProductService.getAfterReleaseCnt(releaseNo);
//			System.out.println(afterReleaseCnt);
			
			if(releaseProductCnt==null) {
				releaseProductService.updateReleaseTotalCnt(releaseNo);				
			} else {
				if(Integer.parseInt(afterReleaseCnt)==0) {
					releaseProductService.updateReleaseStatus1(releaseNo);
					releaseProductService.updatePlacingOrderStatus(placingOrderNo);
					released.add(releaseNo);
				} else if(Integer.parseInt(releaseProductCnt) > Integer.parseInt(afterReleaseCnt)) {
					releaseProductService.updateReleaseStatus2(releaseNo);
				}
			}
			
		}
		model.addAttribute("release", released);
	}
	
	@RequestMapping(value="/release/search" ,method=RequestMethod.GET)
	public ModelAndView releaseSearch(Release release, ModelAndView mav, @RequestParam(defaultValue = "1") int curPage) {
		logger.info("releaseSearch()");
		System.out.println(release);
		List<Release> releaseList = releaseProductService.getReleaseList(release);
//		System.out.println(releaseList);
		
		List llist = new ArrayList();
		List list = null;
		
		for(Release r : releaseList) {
			list = new ArrayList();
			list.add(r.getReleaseNo());
			list.add(r.getPlacingOrderNo());
			list.add(r.getShopName());
			if(r.getReleaseStatus()==0) {
				list.add("출고 전");
			} else if(r.getReleaseStatus()==1) {
				list.add("출고 완료");
			} else if(r.getReleaseStatus()==2) {
				list.add("부분 출고");				
			}
			list.add(r.getReleaseDate());
			
			llist.add(list);
		}
		
		mav.addObject("data",llist);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value = "/release/popExcel", method = RequestMethod.GET)
	public void popExcel() {
	}
	
	// 19-12-31 유진 - 엑셀 업로드
	@RequestMapping(value = "/release/upload", method=RequestMethod.POST)
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
        
        view.setViewName("/release/excel-success");
        
        return view;
	}
	

	//출고 등록 페이지
	@RequestMapping(value="/release/add", method=RequestMethod.GET)
	public void addRelease(Release release, Model model) {
		logger.info("addRelease()");
		logger.info(release.toString());
		
		PlacingOrder releaseInfo = releaseProductService.getReleaseInfo(release);
//		System.out.println(releaseInfo);
		model.addAttribute("releaseInfo", releaseInfo);
		
		List<ReleaseProduct> releaseProductList = releaseProductService.getReleseProduct(release);
//		System.out.println(releaseProductList);
		model.addAttribute("releaseProductList", releaseProductList);
		
	}
	
	@RequestMapping(value = "/release/add", method=RequestMethod.POST)
	public String addRelease(ReleaseProduct releaseProduct, HttpServletRequest req) {
		logger.info("addRelease POST");
//		System.out.println(releaseProduct);
		String[] releeaseProductNo = req.getParameterValues("releeaseProductNo");
		String[] releaseProductCnt = req.getParameterValues("productCnt");
		String[] releaseStatus = req.getParameterValues("productStatus");
		String[] releaseRemark = req.getParameterValues("remark");
		
		List releaselist = new ArrayList();
		List list = null;
		
		for(int i=0; i<releaseStatus.length;i++) {
//			System.out.println("releeaseProductNo : "+releeaseProductNo[i]);			
//			System.out.println("releaseProductCnt : "+releaseProductCnt[i]);			
//			System.out.println("releaseStatus : "+releaseStatus[i]);			
//			System.out.println("releaseRemark : "+releaseRemark[i]);
			list = new ArrayList();
			list.add(releeaseProductNo[i]);
			list.add(releaseProductCnt[i]);
			list.add(releaseStatus[i]);
			list.add(releaseRemark[i]);
			
			releaselist.add(list);
		}
		
//		System.out.println(releaselist);
		
		releaseProductService.updateRelease(releaselist);
		
//		int releaseCnt = releaseProductService.getCnt()
		
		return "redirect:/release/list";
	}
	
	//출고가 페이지
	@RequestMapping(value="/release/releaseCost", method=RequestMethod.GET)
	public void releaseCostList() {
	}
	
	@RequestMapping(value = "/release/exceldown")
	public String excelDown() {
		
		List<Release> releaseList = releaseProductService.getList();

//		System.out.println(releaseList);
		 
		 ExcelWriter excelWriter=new ExcelWriter();
		 excelWriter.releasetXls(releaseList);
		 
		 logger.info("엑셀 다운 완료");
		 
		 return "redirect:/release/list";
	}
}
