package org.zerock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.command.MemberVO;
import org.zerock.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 마이페이지 연결
	@RequestMapping("/mypage")
	public String mypage() {
		System.out.println("MemberController -> mypage()");
		return "/member/mypage";
	}
	
	// 로그인 페이지 연결
	@RequestMapping("/loginPage")
	public String loginPage() {
		System.out.println("MemberController -> loginPage()");
		return"member/loginPage";
	}
	
	// 회원가입 
	@RequestMapping("/signUp")
	public String signUp(MemberVO vo) {
		System.out.println("MemberController -> signUp()");
		int result = service.join(vo);
		return "/member/loginPage";
	}
	
	// 로그인
	@RequestMapping("login")
	public String login(MemberVO vo, HttpSession session, RedirectAttributes RA) {
		System.out.println("MemberController -> login()");
		int result = service.login(vo);
		
		if(result == 1) {
			session.setAttribute("user_email", vo.getEmail());
			session.setAttribute("user_name", vo.getName());
			session.setAttribute("user_pw", vo.getPw());
		}else {
			RA.addFlashAttribute("msg", "아이디 또는 패스워드를 확인해주세요.");
		}
		return "redirect:/";
	}
	
}
