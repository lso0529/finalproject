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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.command.AttachFileDTO;
import org.zerock.command.BoardVO;
import org.zerock.command.LikeVO;
import org.zerock.command.MemberVO;
import org.zerock.command.TopicVO;
import org.zerock.service.AttachFileService;
import org.zerock.service.BoardService;
import org.zerock.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/")
@Log4j
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	MemberService memberservice;
	
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
	
	
	// ????????? ??? ????????????
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
		
		System.out.println("????????? ?????????");
		System.out.println("??????: "+vo.getTopic());
		System.out.println("??????: "+vo.getContent());
		System.out.println("??????: "+vo.getName());
		
		if (vo.getSecret()==null) {
			vo.setSecret("0");
		}
		
		System.out.println("?????????(0-??????, 1-??????):"+vo.getSecret());
		
		int result = service.register(vo);
		if (result==1) {
			System.out.println("?????? ??????");
			ra.addFlashAttribute("msg", "????????? ?????????????????????.");
		} else {
			System.out.println("?????? ??????");
			ra.addFlashAttribute("msg", "????????? ??????????????????.");
		}
		
		return "redirect:/board/mypage";
	}
	
	@RequestMapping("/register_result")
	public void register_result(RedirectAttributes ra) {
		ra.addFlashAttribute("msg", "??? ????????? ?????????????????????.");
	}
	
	@RequestMapping("/content")
	public String content(@RequestParam("bno") int bno,
			Model model,
			HttpSession session) {
		System.out.println(bno);
		// ??? ?????? ????????? ??????
		BoardVO vo = service.mycontent(bno);
		model.addAttribute("vo", vo);
		
		//??????????????? ??????
		System.out.println(vo.getSecret());
		session.setAttribute("secret", vo.getSecret());
		return "/board/content";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("bno") int bno,
			@RequestParam("name") String name,
			Model model) {
		System.out.println("?????? ??????");
		
		int result = service.delete(bno);
		System.out.println("?????? ??????(??????-1, ??????-0):"+result);
		
		return "redirect: mypage";
	}
	
	@RequestMapping("/update")
	public String update(@RequestParam("bno") int bno, Model model) {
		
		// ??? ?????? ?????????
		BoardVO vo = service.mycontent(bno);
		model.addAttribute("vo", vo);
				
		return "/board/update";
	}
	
	@RequestMapping("/updateform")
	public String updateform(BoardVO vo, RedirectAttributes ra, Model model) {
		
		//?????? ?????? 
		System.out.println(vo.getBno());
		System.out.println(vo.getTopic());
		System.out.println(vo.getContent());
		
		if(vo.getSecret()==null) {
			vo.setSecret("0");
		}
		
		System.out.println(vo.getSecret());
		
		int result = service.updateform(vo);
		
		if (result==1) {
			System.out.println("?????? ??????");
			ra.addFlashAttribute("msg", "????????? ?????????????????????.");
		} else {
			System.out.println("?????? ??????");
			ra.addFlashAttribute("msg", "????????? ??????????????????.");
		}
		
		System.out.println("?????? ??????(1-??????, 0-??????): "+result);
		
		return "redirect:/board/content?bno="+vo.getBno();
	}
	
	//?????????
	@ResponseBody 
	@PostMapping("/likeup")
	public void likeup(@RequestBody LikeVO vo) {
		System.out.println("???????????? ?????? ??????");
		System.out.println(vo.getBno());
		System.out.println(vo.getName());
		service.likeup(vo.getBno(), vo.getName());
	
	}
	
	@ResponseBody
	@PostMapping("/likedown")
	public void likedown(@RequestBody LikeVO vo) {
		System.out.println("????????? ?????????!");
		service.likedown(vo.getBno(), vo.getName());
	}
	
	@RequestMapping("/otherUsersPage")
	public String otherUsersPage(@RequestParam("name") String name, HttpSession session) {
		
		MemberVO member_vo = new MemberVO();
		
		member_vo = memberservice.lookUpMember(name);
		
		// ??? ????????? ???????????? ????????????
		session.setAttribute("otherUser_name", name);
		ArrayList<BoardVO> yourlist = service.yourlist(name);
		int count = service.mycount(name);
		
		for (int i=0;i<yourlist.size();i++) {
			BoardVO vo = yourlist.get(i);
			
			Integer likes = service.liketotal(vo.getBno());
			
			if (likes == null) {
				likes=0;
			}
			
			vo.setLikes(likes);
			yourlist.set(i, vo);
		}
		// ??? ????????? ???????????? ????????? ??????
		session.setAttribute("otherUser_count", count);
		session.setAttribute("otherUser_list", yourlist);
		session.setAttribute("otherUser_VO", member_vo);
		
		return "board/other_userspage";
	}
}
