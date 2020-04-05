package com.weduo.caffeinme.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.weduo.caffeinme.board.Bean;
import com.weduo.caffeinme.board.BeanReview;
import com.weduo.caffeinme.board.BeanReviewDTO;
import com.weduo.caffeinme.board.BeanReviewList;
import com.weduo.caffeinme.board.service.BeanService;
import com.weduo.caffeinme.member.Member;

@Controller
@RequestMapping("/board/bean")
public class BeanController {

	@Autowired
	@Qualifier("beanService")
	BeanService service;

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

	// 원두리스트
	@RequestMapping("/beanList")
	public String beanList(Model model, HttpSession session) {
		System.out.println("beanList get방식 호출");
		List<Bean> beans = service.beanList();
		
		session.setAttribute("beans", beans);
		model.addAttribute("beans", beans);
		
		return "/board/bean/beanList";
	}
	
	// 원두읽기
	@RequestMapping("/beanRead")
	public String beanRead(@RequestParam("bno")int bno, Model model, HttpSession session) {
		Bean searchedBean = service.beanSearch(bno);
		
		session.setAttribute("sbean", searchedBean);
		model.addAttribute("sbean", searchedBean);
		return "/board/bean/beanRead";
	}
	
	// 원두리뷰리스트
	@RequestMapping("/reviewList")
	public String beanReviewList(@RequestParam("bno")int bno, Model model, HttpSession session) {
		List<BeanReviewList> reviews = service.beanReviewList(bno);
		
		
		session.setAttribute("beanReviews", reviews);
		model.addAttribute("beanReviews", reviews);
		
		return "/board/bean/reviewList";
	}
	
	//원두리뷰 읽기
	@RequestMapping("/reviewRead")
	public String beanReviewRead(@RequestParam("RNO")int rno, Model model, HttpSession session) {
		BeanReview selectedReview = service.getBeanReview(rno);
		
		session.setAttribute("selectedReview", selectedReview);
		model.addAttribute("selectedReview", selectedReview);
		
		return "/board/bean/reviewRead";
	}

	//원두리뷰 작성페이지 응답 get
	@RequestMapping("/reviewWriteForm")
	public String beanReviewWriteForm(BeanReviewDTO beanReviewDTO) {
		
		return "/board/bean/reviewWriteForm";
	}
	
	//원두리뷰 작성
	@RequestMapping(value="/reviewWrite", method=RequestMethod.POST)
	public String beanReviewWrite(BeanReviewDTO beanReviewDTO, HttpSession session) {
		Member writer = (Member)session.getAttribute("member");
		Bean selectedBean = (Bean)session.getAttribute("sbean");
		String mid = writer.getMID();
		int bno = selectedBean.getBNO();
		
		int result = service.writeBeanReview(mid, bno, beanReviewDTO);
		
		if(result == 0)	return "/";
		
		return "/board/bean/reviewWriteSuccess";
	}
}
