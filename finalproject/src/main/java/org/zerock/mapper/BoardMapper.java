package org.zerock.mapper;

import java.util.ArrayList;

import org.zerock.command.BoardVO;
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
	public void likeup(int like1, int bno);
	public void likedown(int like2, int bno);
	public int liketotal(int bno);
	public int mylike(String name);
}
