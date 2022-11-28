package org.zerock.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.zerock.command.BoardVO;
import org.zerock.command.LikeVO;
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
	public int register(BoardVO vo) {
		int result = mapper.register(vo);
		
		return result;
	}
	
	@Override
	public TopicVO selectTopic(int tno) {
		TopicVO vo = mapper.selectTopic(tno);
		return vo;
	}
	
	@Override
	public ArrayList<BoardVO> mylist(String name) {

		ArrayList<BoardVO> mylist = mapper.mylist(name);
		
		return mylist;
	}
	
	@Override
	public BoardVO mycontent(int bno) {
		BoardVO vo = mapper.mycontent(bno);
		
		return vo;
	}
	
	@Override
	public int delete(int bno) {
		int result = mapper.delete(bno);
		return result;
	}
	
	@Override
	public int updateform(BoardVO vo) {
		int result = mapper.updateform(vo);
		return result;
	}
	
	@Override
	public int mycount(String name) {
		int count = mapper.mycount(name);
		
		return count;
	}
	
	@Override
	public Integer liketotal(int bno) {
		Integer total = mapper.liketotal(bno);
		return total;
	}
	
	@Override
	public Integer mylike(String name) {
		System.out.println("서비스 부분");
		Integer result = (Integer) mapper.mylike(name);
		return result;
	}
	
	@Override
	public Integer findLike(int bno, String name) {
		Integer findlike = mapper.findLike(bno, name);
		return findlike;
	}
	
	@Override
	public void likeup(int bno, String name) {
		mapper.likeup(bno, name);
		
	}
	
	@Override
	public void likedown(int bno, String name) {
		mapper.likedown(bno, name);		
	}
}
