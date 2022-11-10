package org.zerock.mapper;

import java.util.ArrayList;

import org.zerock.command.BoardVO;
import org.zerock.command.TopicVO;

public interface BoardMapper {
	public ArrayList<TopicVO> topicAll();
	public ArrayList<BoardVO> boardAll(String topic);
}
