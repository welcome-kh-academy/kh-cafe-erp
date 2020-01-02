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

import com.KHCafeErp.www.dto.NoticeBoard;
import com.KHCafeErp.www.service.face.NoticeService;
import com.KHCafeErp.www.util.Paging;

@Controller
public class NoticeController {
	
	@Autowired private NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(JoinStaffController.class);
	
	@RequestMapping(value="/notice/list")
	public String list(Paging inData, Model model) {
		
		//페이징 계산
		Paging paging = noticeService.getPaging(inData);
		
		//페이징 객체를 모델값으로 지정
		model.addAttribute("paging", paging);
		
		//게시글 목록
		List<NoticeBoard> list = noticeService.list(paging);
		model.addAttribute("list", list);
		
		
		return "notice/list";
		
	}
	
	@RequestMapping(value="/notice/write", method = RequestMethod.GET)
	public void writeBoard(HttpSession session, Model model) {
		
//		logger.info(session.getAttribute("staffNo")+"");
		// 작성자 이름 추가
		int staffNo = (int) session.getAttribute("staffNo");
		
		NoticeBoard nBoard = new NoticeBoard();
		nBoard.setStaffNo(staffNo);
		
		String staffName = noticeService.getStaffName(nBoard);
		logger.info("직원이름: " + staffName);

		model.addAttribute("staffName", staffName);
	}
	
	@RequestMapping(value="/notice/write", method = RequestMethod.POST)
	public String writeBoardProc(NoticeBoard board, HttpSession session) {
		
		int staffNo = (int) session.getAttribute("staffNo");
		board.setStaffNo(staffNo);
		
		int shopNo = noticeService.getShopNo(staffNo);
		board.setShopNo(shopNo);
		
		logger.info(board.toString());
		
		noticeService.write(board);
		
		return "redirect:/notice/list";
		
	}
	
	@RequestMapping(value="/notice/view", method=RequestMethod.GET)
	public String view(NoticeBoard viewBoard, Model model) {
		
		// 게시글 번호가 1보다 작으면 목록으로 보내기
		if(viewBoard.getnBoardNo() < 1) {
			return "redirect:/notice/list";
		}
		
		// 게시글 상세 정보 전달
		viewBoard = noticeService.boardView(viewBoard);
		
		model.addAttribute("view", viewBoard);

		return "notice/view";
		
	}
	
//	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
//	public void update(NoticeBoard board, HttpSession session, Model model) {
//		
//		board = noticeService.boardView(board);
//		model.addAttribute("view", board);
//	}
	
	
	
	
	
}
