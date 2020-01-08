package com.KHCafeErp.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHCafeErp.www.dto.CounselBoard;
import com.KHCafeErp.www.service.face.CsService;
import com.KHCafeErp.www.util.Paging;

@Controller
public class CsController {
	
	@Autowired CsService csService;
	
	private static final Logger logger = LoggerFactory.getLogger(CsController.class);
	
	@RequestMapping(value = "/cs/list")
	public String list(Paging data, Model model, HttpSession session) {
		logger.info("list()");
		System.out.println("로그인 리스트"
				+ " : "+session.getAttribute("staffNo"));

		Paging paging = csService.getPaging(data);
		logger.info("inData: " + paging);

		model.addAttribute("paging",paging);
		
		List<CounselBoard> list = csService.list(paging);
		model.addAttribute("list",list);
		
		return "/cs/list";
	}
	
	@RequestMapping(value = "/cs/view", method=RequestMethod.GET)
	public String view(CounselBoard cBoard, Model model) {
		
		if(cBoard.getcBoardNo()<1) {
			return "redirect:/cs/list";
		}
		
		cBoard = csService.boardView(cBoard);
		model.addAttribute("view", cBoard);
		
		return "/cs/view";
	}
	
	@RequestMapping(value = "/cs/write", method = RequestMethod.GET)
	public void write(HttpSession session, Model model) {
		int staffNo = (int)session.getAttribute("staffNo");
		System.out.println("1223134142344 : "+staffNo);
		String staffName = csService.getStaffName(staffNo);
		CounselBoard cBoard = new CounselBoard();
		cBoard.setStaffName(staffName);
		
		model.addAttribute("staffName", staffName);
	}
	
	@RequestMapping(value = "/cs/write", method=RequestMethod.POST)
	public String writeProc(CounselBoard cBoard, HttpSession session ) {
		int staffNo = (int)session.getAttribute("staffNo");
		cBoard.setStaffNo(staffNo);
		
		if(cBoard.getCusId()!=null && !"".equals(cBoard.getCusId())) {
			CounselBoard cusNo = csService.getCusNo(cBoard.getCusId());
			cBoard.setCusNo(cusNo.getCusNo());			
		} else {
			cBoard.setCusNo(0);
		}

		csService.write(cBoard);
		
		return "redirect:/cs/list";
	}
	
	@RequestMapping(value = "/cs/update", method=RequestMethod.GET)
	public void update(CounselBoard cBoard, Model model) {
		cBoard = csService.boardView(cBoard);
		model.addAttribute("update",cBoard);
	}

	@RequestMapping(value = "/cs/update", method = RequestMethod.POST)
	public String updateProc(CounselBoard cBoard) {
		
		csService.update(cBoard);
		
		return "redirect:/cs/list";
	}
	
	@RequestMapping(value = "/cs/delete", method=RequestMethod.GET)
	public String delete(CounselBoard counselBoard) {
		csService.delete(counselBoard);
		
		return "redirect:/cs/list";
	}
}
