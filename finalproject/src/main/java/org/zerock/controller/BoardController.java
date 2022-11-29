package org.zerock.controller;

import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
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
//		System.out.println(bno+" 상세보기");
		
		BoardVO vo = service.mycontent(bno);
		model.addAttribute("vo", vo);
//		System.out.println(vo);
//		System.out.println(vo.getSecret());
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
	
//	//댓글 조회 및 삭제
//	@GetMapping(value="/{bno}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
//	public ResponseEntity<LikeVO> get(@PathVariable("bno") int bno) {
//		System.out.println("get : "+ bno);
//		
//		return new ResponseEntity<>(service.liketotal(bno),HttpStatus.OK);
//	}
	
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
		
//		if (total2.equals(null)) {
//			total2 = "0";
//		}
		
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
//		String name = "name";
		String name = (String) session.getAttribute("user_name");
		session.setAttribute("user_name", name);
		ArrayList<BoardVO> mylist = service.mylist(name);
		int count = service.mycount(name);
		
		//받은 좋아요 수 가져오기
		Integer mylike = service.mylike(name);
		
		if (mylike==null) {
			mylike = 0;
		}
		
		session.setAttribute("mycount", count);
		session.setAttribute("mylist", mylist);
		session.setAttribute("mylike", mylike);
		
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
	
//	@ResponseBody
//	@PostMapping(value="/like", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> like(HttpServletRequest request,
//			HttpServletResponse response, 
//			@RequestParam("bno") int bno,
//			@RequestParam("name") String name){
//		
//		System.out.println(bno);
//		System.out.println("좋아요 컨트롤러 영역");
//		
//		//좋아요 총 수 가져오기
//		int total = service.liketotal(bno);
//		
//		Cookie[] cookies = request.getCookies();
//		
//		for (int i=0; i<cookies.length; i++) {
//			System.out.println(cookies[i].getName()+" : "+cookies[i].getValue());
//			if(cookies[i].getValue().equals("like"+bno+name)) {
//				//좋아요 쿠키가 있는 경우(좋아요 1 down)
//				System.out.println("좋아요 이미 있음");
//				
//				//쿠키 지우는  함수 찾아보기
//				Cookie delete = new Cookie("like"+bno+name, null);
//				delete.setMaxAge(0);
//				response.addCookie(delete);
//				
//				if (total<=0) {
//					return new ResponseEntity<>("success", HttpStatus.OK);
//				}
//				
//				int like2 = total-1;
//				int insertCount = service.likedown(like2, bno);
//				
//				return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
//						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//			}
//		}
//		
//		//좋아요 쿠키가 없는 경우(좋아요 1 up)
//		System.out.println("좋아요 처리");
//		int like1 = total+1;
//		int insertCount = service.likeup(like1, bno);
//		Cookie like = new Cookie("like"+bno+name, "like"+bno+name);
//		like.setMaxAge(86400);	
//		response.addCookie(like);
//		
//		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
//								: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
//	@RequestMapping("/like")
//	public String like(HttpServletRequest request,
//			HttpServletResponse response, 
//			@RequestParam("bno") int bno,
//			@RequestParam("name") String name) {
//		System.out.println(bno);
//		System.out.println("좋아요 컨트롤러 영역");
//		
//		//좋아요 총 수 가져오기
//		int total = service.liketotal(bno);
//		
//		Cookie[] cookies = request.getCookies();
//		
//		for (int i=0; i<cookies.length; i++) {
//			System.out.println(cookies[i].getName()+" : "+cookies[i].getValue());
//			if(cookies[i].getValue().equals("like"+bno+name)) {
//				//좋아요 쿠키가 있는 경우(좋아요 1 down)
//				System.out.println("좋아요 이미 있음");
//				int like2 = total-1;
//				service.likedown(like2, bno);
//				
//				//쿠키 지우는  함수 찾아보기
//				
//				return "";
//			}
//		}
//		
//		//좋아요 쿠키가 없는 경우(좋아요 1 up)
//		System.out.println("좋아요 처리");
//		int like1 = total+1;
//		service.likeup(like1, bno);
//		Cookie like = new Cookie("like"+bno+name, "like"+bno+name);
//		like.setMaxAge(86400);	
//		response.addCookie(like);
//		
//		return "";
//	}
}
