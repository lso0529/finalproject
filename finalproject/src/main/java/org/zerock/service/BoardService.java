package org.zerock.service;

import java.util.ArrayList;

import org.zerock.command.BoardVO;
import org.zerock.command.TopicVO;

public interface BoardService {
	public ArrayList<TopicVO> topicAll();
	public ArrayList<BoardVO> boardAll(String topic);
	public void register(BoardVO vo);
	public TopicVO selectTopic(int tno);
	public ArrayList<BoardVO> mylist(String name);
}
