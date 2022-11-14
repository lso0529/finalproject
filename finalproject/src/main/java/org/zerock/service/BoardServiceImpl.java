package org.zerock.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.command.BoardVO;
import org.zerock.command.TopicVO;
import org.zerock.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper mapper;

	@Override
	public ArrayList<TopicVO> topicAll() {
		ArrayList<TopicVO> list = mapper.topicAll();
		
		return list;
	}
	
	@Override
	public ArrayList<BoardVO> boardAll(String topic) {
		
		ArrayList<BoardVO> boardlist = mapper.boardAll(topic);
		
		return boardlist;
	}
	
	@Override
	public void register(BoardVO vo) {
		mapper.register(vo);		
	}

}
