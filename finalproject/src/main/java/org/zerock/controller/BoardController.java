package org.zerock.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.command.BoardVO;
import org.zerock.command.TopicVO;
import org.zerock.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/")
@Log4j
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/topics")
	public String topic(Model model) {
		
		ArrayList<TopicVO> list = service.topicAll();
		
		model.addAttribute("list", list);
		
		return "/board/topics";
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam("topic") String topic, Model model) {
		
		ArrayList<BoardVO> boardlist = service.boardAll(topic);
		
//		System.out.println(boardlist);
		
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("topic", topic);
		
		return "/board/list";
	}
	
	@RequestMapping("/register")
	public String register(@RequestParam("topic") String topic, Model model, HttpSession session) {
		String name = (String) session.getAttribute("user_name");
		System.out.println(name);
		
		model.addAttribute("name", name);
		model.addAttribute("topic", topic);
		
		return "/board/register";
	}
	
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
//		String name = "name";
		String name = (String) session.getAttribute("user_name");
		session.setAttribute("user_name", name);
		ArrayList<BoardVO> mylist = service.mylist(name);
		int count = service.mycount(name);
		session.setAttribute("mycount", count);
		session.setAttribute("mylist", mylist);
		
//		System.out.println("여기"+count+mylist.toString());
		
//		model.addAttribute("mylist", mylist);
//		model.addAttribute("mycount", count);
//		model.addAttribute("name", name);
		
		return "/board/mypage";
	}
	
	@RequestMapping("/regiform")
	public String regiform(BoardVO vo, RedirectAttributes ra) {
		
		System.out.println("글쓰기 메서드");
		System.out.println("주제: "+vo.getTopic());
		System.out.println("내용: "+vo.getContent());
		System.out.println("이름: "+vo.getName());
		
		if (vo.getSecret()==null) {
			vo.setSecret("0");
		}
		
		System.out.println("비밀글(0-공개, 1-비밀):"+vo.getSecret());
		
		int result = service.register(vo);
		if (result==1) {
			System.out.println("등록 성공");
			ra.addFlashAttribute("msg", "등록이 완료되었습니다.");
		} else {
			System.out.println("등록 실패");
			ra.addFlashAttribute("msg", "등록에 실패했습니다.");
		}
		
		return "redirect:/board/mypage";
	}
	
	@RequestMapping("/register_result")
	public void register_result(RedirectAttributes ra) {
		ra.addFlashAttribute("msg", "글 등록이 완료되었습니다.");
	}
	
	@RequestMapping("/content")
	public String content(@RequestParam("bno") int bno,
			Model model,
			HttpSession session) {
		System.out.println(bno);
		// 글 상세 페이지 보기
		BoardVO vo = service.mycontent(bno);
		model.addAttribute("vo", vo);
		
		//비밀글인지 여부
		System.out.println(vo.getSecret());
		session.setAttribute("secret", vo.getSecret());
		return "/board/content";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("bno") int bno,
			@RequestParam("name") String name,
			Model model) {
		System.out.println("삭제 영역");
		
		int result = service.delete(bno);
		System.out.println("삭제 결과(성공-1, 실패-0):"+result);
		
		return "redirect: mypage";
	}
	
	@RequestMapping("/update")
	public String update(@RequestParam("bno") int bno, Model model) {
		
		// 글 수정 페이지
		BoardVO vo = service.mycontent(bno);
		model.addAttribute("vo", vo);
				
		return "/board/update";
	}
	
	@RequestMapping("/updateform")
	public String updateform(BoardVO vo, RedirectAttributes ra, Model model) {
		
		//수정 실행 
		System.out.println(vo.getBno());
		System.out.println(vo.getTopic());
		System.out.println(vo.getContent());
		
		if(vo.getSecret()==null) {
			vo.setSecret("0");
		}
		
		System.out.println(vo.getSecret());
		
		int result = service.updateform(vo);
		
		if (result==1) {
			System.out.println("수정 성공");
			ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
		} else {
			System.out.println("수정 실패");
			ra.addFlashAttribute("msg", "수정에 실패했습니다.");
		}
		
		System.out.println("수정 결과(1-성공, 0-실패): "+result);
		
		return "redirect:/board/content?bno="+vo.getBno();
	}
}
