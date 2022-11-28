package org.zerock.mapper;

import java.util.ArrayList;

import org.springframework.http.ResponseEntity;
import org.zerock.command.BoardVO;
import org.zerock.command.LikeVO;
import org.zerock.command.TopicVO;

public interface BoardMapper {
	public ArrayList<TopicVO> topicAll();
	public ArrayList<BoardVO> boardAll(String topic);
	public int register(BoardVO vo);
	public TopicVO selectTopic(int tno);
	public ArrayList<BoardVO> mylist(String name);
	public BoardVO mycontent(int bno);
	public int delete(int bno);
	public int updateform(BoardVO vo);
	public int mycount(String name);
	
	public int likeup(int bno, String name);
	public int likedown(int bno, String name);
	
	public Integer liketotal(int bno);
	public Integer mylike(String name);
	public Integer findLike(int bno, String name);
}
