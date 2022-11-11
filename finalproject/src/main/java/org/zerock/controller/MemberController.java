package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "/member/mypage";
	}
	
	@RequestMapping("/login")
	public String loginPage() {
		return"member/login";
	}
}
