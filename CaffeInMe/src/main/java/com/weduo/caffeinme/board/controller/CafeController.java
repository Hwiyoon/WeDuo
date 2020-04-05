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
import org.springframework.web.bind.annotation.RequestParam;

import com.weduo.caffeinme.board.Cafe;
import com.weduo.caffeinme.board.service.CafeService;

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
		System.out.println("입력받은 키워드 = "+keyword);
		
		model.addAttribute("cafeListByKeyword", searchedCafes);
		session.setAttribute("cafeListByKeyword", searchedCafes);
		
		System.out.println("검색완료");
		
		return "/board/cafe/cafeList";
	}
	

}
