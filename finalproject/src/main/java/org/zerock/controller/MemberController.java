package org.zerock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		return "/board/mypage";
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
		MemberVO resultvo = service.login(vo);
		
		if(resultvo == null) {
			RA.addFlashAttribute("msg", "아이디 또는 패스워드를 확인해주세요.");
		}else {
			session.setAttribute("user_email", resultvo.getEmail());
			session.setAttribute("user_name", resultvo.getName());
			session.setAttribute("user_pw", resultvo.getPw());
		}
		return "redirect:/";
	}
	
	//비밀번호 찾기 이메일 입력 페이지
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findpw() throws Exception{
		return "/member/findPw";
	}
	
	//비밀번호 찾기 페이지 연결 
	@RequestMapping(value = "/emailCheckAndfindPwPage")
	public String emailCheckAndfindPwPage(MemberVO vo, HttpSession session , RedirectAttributes RA)throws Exception{
		MemberVO resultvo = service.emailCheck(vo);
		if(resultvo != null) {
			session.setAttribute("email", resultvo.getEmail());
			return "/member/pwUpdatePage"; // 비밀번호 수정 
		}else {
			RA.addFlashAttribute("msg", "이메일을 확인해주세요.");
			return "redirect:/"; // 로그인
		}
	}
	//비밀번호 찾기 이메일 입력 페이지
	@RequestMapping(value = "/pwUpdatePage")
	public String pwUpdatePage() throws Exception{
		System.out.println("MemberController -> pwUpdatePage()");
		return "/member/pwUpdatePage";
	}
	//비밀번호 수정 
	@RequestMapping(value = "/pwUpdate")
	public String pwUpdate(MemberVO vo)throws Exception{
		System.out.println("MemberController -> pwUpdate()");
		System.out.println(vo.toString());
		int result = service.pwUpdate(vo);
		if(result == 1) {
			System.out.println("y");
			return "redirect:/"; //메인으로
		}else {
			System.out.println("n");
			return "redirect:/member/login"; //로그인 
		}
	}
	
	//로그아웃 처리 
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
}
