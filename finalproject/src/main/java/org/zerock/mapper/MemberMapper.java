package org.zerock.mapper;

import org.zerock.command.MemberVO;

public interface MemberMapper {

	public int join(MemberVO vo);
	public int login(MemberVO vo);
	public int emailCheck(String email);

}