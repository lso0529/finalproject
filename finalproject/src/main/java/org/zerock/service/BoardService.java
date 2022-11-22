package org.zerock.service;

import java.util.ArrayList;

import org.zerock.command.BoardVO;
import org.zerock.command.TopicVO;

public interface BoardService {
	public ArrayList<TopicVO> topicAll();
	public ArrayList<BoardVO> boardAll(String topic);
	public int register(BoardVO vo);
	public TopicVO selectTopic(int tno);
	public ArrayList<BoardVO> mylist(String name);
	public BoardVO mycontent(int bno);
	public int delete(int bno);
	public int updateform(BoardVO vo);
	public int mycount(String name);
}
