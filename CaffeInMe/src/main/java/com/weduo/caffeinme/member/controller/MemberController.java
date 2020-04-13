package com.weduo.caffeinme.member.controller;

import java.text.DateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.weduo.caffeinme.member.Member;
import com.weduo.caffeinme.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	@Qualifier("memberService")
	MemberService service;

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

	// login Get
	@RequestMapping("/loginForm")
	public String loginForm(Member member) {
		System.out.println("login get방식 호출");
		return "/member/loginForm";
	}

	// login Post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member member, Model model, HttpSession session) {

		Member login = service.memberSearch(member);

		if (login == null)
			return "/member/loginForm";
		
		session.setAttribute("loginMember", login);
		//model.addAttribute("mem", searchedMember);
		
		return "/index";
	}
	
	// logout
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/index";
	}

	// join Get
	@RequestMapping("/joinForm")
	public String joinForm(Member member) {
		System.out.println("join get방식 호출");
		return "/member/joinForm";
	}

	// join Post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Member member) {
		System.out.println("join post방식 호출");
		service.memberRegister(member);

		return "member/joinOk";
	}

	// ID Check Post
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(HttpServletRequest request ) {
		System.out.println("idCheck post 호출");
		String MID = request.getParameter("MID");

		int result = 0;
		Member idChecked = service.idCheck(MID);

		if (idChecked != null) // 가입불가
			result = 1;
		return result;
	}

}
