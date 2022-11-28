package org.zerock.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.group.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.command.MemberVO;
import org.zerock.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 페이지 연결
	@RequestMapping("/loginPage")
	public String loginPage() {
		System.out.println("MemberController -> loginPage()");
		return"member/loginPage";
	}
	
	// 회원가입 처리
	@RequestMapping("/signUp")
	public String signUp(MemberVO vo) {
		System.out.println("MemberController -> signUp()");
		int result = service.join(vo);
		return "/member/loginPage";
	}
	
	//아이디 중복체크 
	@ResponseBody
	@RequestMapping("/checkEmail")
	public String checkEmail(@RequestParam("checkEmail") String checkEmail) {
		System.out.println("MemberController -> checkEmail()");
		String result = Integer.toString(service.checkEmail(checkEmail));
		
		return result;
	}
	
	// 닉네임 중복체크 
	@ResponseBody
	@RequestMapping("/checkName")
	public String checkName(@RequestParam("checkName") String checkName) {
		System.out.println("MemberController -> checkName()");
		String result = Integer.toString(service.checkName(checkName));
		
		return result;
	}
	
	// 로그인 처리 
	@RequestMapping("login")
	public String login(MemberVO vo, HttpSession session, RedirectAttributes RA) {
		System.out.println("MemberController -> login()");
		MemberVO resultvo = service.login(vo);
		
		if(resultvo == null) {
			RA.addFlashAttribute("msg", "아이디 또는 패스워드를 확인해주세요.");
			return "redirect:/member/loginPage";
		}else {
			session.setAttribute("user_email", resultvo.getEmail());
			session.setAttribute("user_name", resultvo.getName());
			return "redirect:/";
		}
		
	}
	
	//비밀번호 찾기 - 이메일 입력 페이지 연결
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findpw() throws Exception{
		System.out.println("MemberController -> findpw()");
		return "/member/findPw";
	}
	
	//비밀번호 찾기 - 이메일 인증 처리
	@RequestMapping(value = "/emailCheckAndfindPwPage")
	public String emailCheckAndfindPwPage(MemberVO vo, HttpSession session , RedirectAttributes RA)throws Exception{
		System.out.println("MemberController -> emailCheckAndfindPwPage()");
		MemberVO resultvo = service.emailCheck(vo);
		if(resultvo != null) {
			session.setAttribute("user_email", resultvo.getEmail());
			return "/member/pwUpdatePage"; // 비밀번호 수정 페이지
		}else {
			RA.addFlashAttribute("msg", "이메일을 확인해주세요.");
			return "redirect:/member/findPw"; // 다시 이메일 입력 페이지
		}
	}
	
	//비밀번호 찾기 - 새 비밀번호 입력 페이지
	@RequestMapping(value = "/pwUpdatePage")
	public String pwUpdatePage(MemberVO vo, HttpSession session) throws Exception{
		System.out.println("MemberController -> pwUpdatePage()");
		System.out.println("pwUpdatePage -> "+vo.getEmail());
		
		session.setAttribute("user_email", (String)session.getAttribute("user_email"));
		return "/member/pwUpdatePage";
	}
	
	//비밀번호 변경 처리
	@RequestMapping(value = "/pwUpdate")
	public String pwUpdate(MemberVO vo, RedirectAttributes RA, HttpSession session)throws Exception{
		System.out.println("MemberController -> pwUpdate()");
		System.out.println("pwUpdate() -> "+ vo.toString());
		vo.setEmail((String)session.getAttribute("user_email"));
		int result = service.pwUpdate(vo);
		if(result == 1) {
			System.out.println("y");
			session.invalidate();
			return "member/loginPage"; // 로그인 화면으로
		}else {
			System.out.println("n");
			session.invalidate();
			return "member/loginPage";
		}
	}
	
	//로그아웃 처리 
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController -> logout()");
		session.invalidate();
		return "redirect:/";
	}
	
	//회원정보 페이지 연결
	@RequestMapping(value = "/userEditPage")
	public String userEditPage() {
		return "member/userEditPage";
	}
	
	//회원탈퇴 동의 페이지 연결
	@RequestMapping(value = "/deleteCheck")
	public String deleteCheck() {
		return "member/deleteCheck";
	}
	
	//회원탈퇴 처리
	@RequestMapping(value = "/deleteMember")
	public String deleteMember(MemberVO vo ,HttpSession session) {
		vo.setEmail((String)session.getAttribute("user_email"));
		System.out.println("MemberController -> deleteMember()");
		int result = service.deleteMember(vo);
		System.out.println(result);
		if(result == 1) {
			System.out.println("if동작");
			session.invalidate();
		}
		return "redirect:/member/loginPage";
	}
    
}
