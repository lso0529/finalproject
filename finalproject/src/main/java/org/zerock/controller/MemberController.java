package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//마이페이지 화면 처리 
	@RequestMapping("/mypage")
	public String mypage() {
		return "/member/mypage";
	}
	
	//로그인 화면 처리 
	@RequestMapping("/login")
	public String loginPage() {
		return"member/login";
	}
	//회원가입 화면 처리 
	@RequestMapping("/join")
	public String join() {
		return "member/join";
		
	}
	
	@RequestMapping(value = "/checkEmail", method=RequestMethod.POST)
	@ResponseBody
	public int checkEmail(@RequestParam("eamil") String email) {
		System.out.println(email);
		int result = service.emailCheck(email);
		
		return result;
	}
	
}
