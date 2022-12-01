package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.command.TopicVO;
import org.zerock.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	BoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		// 글감 랜덤 출력
		Random random = new Random();
		
		int tno = (int)(random.nextInt(10));
		
		TopicVO vo = service.selectTopic(tno);
		
		while(true) {
			if(vo==null) {
				vo = service.selectTopic(tno);
			} else {
				break;
			}
		}
		
		System.out.println(vo.getTno());
		System.out.println(vo.getTname());
		
		model.addAttribute("topic", vo.getTname());
		
		return "home";
	}
	
}
