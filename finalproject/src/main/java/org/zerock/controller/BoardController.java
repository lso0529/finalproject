package org.zerock.controller;

import java.util.ArrayList;

import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.command.BoardVO;
import org.zerock.command.LikeVO;
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
		
		for (int i=0;i<boardlist.size();i++) {
			BoardVO vo = boardlist.get(i);
			
			Integer likes = service.liketotal(vo.getBno());
			
			if (likes == null) {
				likes=0;
			}
			
			vo.setLikes(likes);
			boardlist.set(i, vo);
		}
		
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("topic", topic);
		
		return "/board/list";
	}
	
	@RequestMapping("/listcontent")
	public String listcontent(@RequestParam("bno") int bno,
			Model model,
			HttpSession session) {
		
		BoardVO vo = service.mycontent(bno);
		model.addAttribute("vo", vo);

		session.setAttribute("secret", vo.getSecret());
		
		LikeVO like = new LikeVO();
		like.setBno(bno);
		like.setName(vo.getName());
		
		String name = (String)session.getAttribute("user_name");
		
		if(name==null) {
			name = "";
		}
		
		Integer findlike = service.findLike(vo.getBno(), name);
		
		if (findlike==null) {
			findlike=0;
		}
		
		model.addAttribute("like", findlike);
		
		return "/board/listcontent";
	}
	
	
	// 좋아요 수 가져오기
	@RequestMapping("/checklike")
	@ResponseBody
	public String get(@RequestParam("bno") int bno) {
		System.out.println("get : "+ bno);
		
		Integer total = service.liketotal(bno);
		
		if(total==null) {
			total=0;
		}
		
		String total2 = Integer.toString(total);
		
		System.out.println(total2);
		
		return total2;
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

		String name = (String) session.getAttribute("user_name");
		session.setAttribute("user_name", name);
		ArrayList<BoardVO> mylist = service.mylist(name);
		int count = service.mycount(name);
		
		for (int i=0;i<mylist.size();i++) {
			BoardVO vo = mylist.get(i);
			
			Integer likes = service.liketotal(vo.getBno());
			
			if (likes == null) {
				likes=0;
			}
			
			vo.setLikes(likes);
			mylist.set(i, vo);
		}

		
		session.setAttribute("mycount", count);
		session.setAttribute("mylist", mylist);
		
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
	
	//좋아요
	@ResponseBody 
	@PostMapping("/likeup")
	public void likeup(@RequestBody LikeVO vo) {
		System.out.println("컨트롤러 연결 성공");
		System.out.println(vo.getBno());
		System.out.println(vo.getName());
		service.likeup(vo.getBno(), vo.getName());
	
	}
	
	@ResponseBody
	@PostMapping("/likedown")
	public void likedown(@RequestBody LikeVO vo) {
		System.out.println("좋아요 싫어요!");
		service.likedown(vo.getBno(), vo.getName());
	}
}
