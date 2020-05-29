package com.weduo.caffeinme.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weduo.caffeinme.board.Cafe;
import com.weduo.caffeinme.board.CafeReviewDTO;
import com.weduo.caffeinme.board.CafeReviewVO;
import com.weduo.caffeinme.board.service.CafeService;
import com.weduo.caffeinme.member.Member;

@Controller
@RequestMapping("/board/cafe")
public class CafeController {
	
	@Autowired
	CafeService service;
	
	@ModelAttribute("serverTime")
	public String getServerTime(Locale locale) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		return dateFormat.format(date);
	}

	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
	@RequestMapping("/searchCafe")
	public String getCafeListByKeyword(@RequestParam("keyword") String keyword, Model model, HttpSession session) {
		
		List<Cafe> searchedCafes = service.searchCafeList(keyword);
		model.addAttribute("keyword", keyword);
		model.addAttribute("cafeListByKeyword", searchedCafes);
		session.setAttribute("cafeListByKeyword", searchedCafes);
		
		
		return "/board/cafe/cafeList";
	}
	
	//카페 정보 불러오기
	@RequestMapping(value = "/cafeRead", method = RequestMethod.GET)
	public void cafeRead(CafeReviewDTO cafeReviewDTO, @RequestParam("CNO") int cno, Model model, HttpSession session) {
		
		//카페 정보 불러오기
		Cafe selectCafe = service.selectCafe(cno);
		session.setAttribute("scafe", selectCafe);
		
		//return "/board/cafe/cafeRead";
	}
	
	//리뷰 불러오기
	@ResponseBody
	@RequestMapping("/cafeRead/reviewList")
	public List<CafeReviewVO> getReviewList(@RequestParam("CNO") int cno){
		
		List<CafeReviewVO> reviews = null;
		reviews = service.getCafeReviews(cno);
		
		return reviews;
	}
	
/*	//리뷰남기기 처리
	@RequestMapping(value = "/writeCafeReview", method = RequestMethod.POST)
	public String cafeReviewWrite(CafeReviewDTO cafeReviewDTO, HttpSession session) {
		
		service.writeCafeReview(cafeReviewDTO);
		
		return "redirect:/board/cafe/cafeRead?CNO="+cafeReviewDTO.getCNO();
	}*/
	
	@ResponseBody
	@RequestMapping(value = "/writeCafeReview", method = RequestMethod.POST)
	public void writeCafeReview(CafeReviewDTO cafeReviewDTO, HttpSession session) {
		
		Member login = (Member)session.getAttribute("loginMember");
		Cafe selectedCafe = (Cafe)session.getAttribute("scafe");
		
		cafeReviewDTO.setMID(login.getMID());
		cafeReviewDTO.setCNO(selectedCafe.getCNO());
		
		service.writeCafeReview(cafeReviewDTO);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteCafeReview", method = RequestMethod.POST)
	public void deleteCafeReview(@RequestParam("rno") int rno) {
		
		service.deleteCafeReview(rno);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyCafeReview", method = RequestMethod.POST)
	public void modifyCafeReview(@RequestParam("RNO") int rno, @RequestParam("CONTENT") String content) {
		
		CafeReviewVO cReviewVO = new CafeReviewVO();
		
		cReviewVO.setRNO(rno);
		cReviewVO.setCONTENT(content);
		
		service.modifyCafeReview(cReviewVO);
		
	}
	


}
