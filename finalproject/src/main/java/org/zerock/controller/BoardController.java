package org.zerock.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		System.out.println(boardlist);
		
		model.addAttribute("boardlist", boardlist);
		
		return "/board/list";
	}
	
	@RequestMapping("/register")
	public String register(Model model) {
		
		return "/board/register";
	}
}
