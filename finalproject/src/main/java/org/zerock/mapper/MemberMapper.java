package org.zerock.mapper;

import org.zerock.command.MemberVO;

public interface MemberMapper {

	public int join(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public MemberVO emailCheck(MemberVO vo); 
	public int pwUpdate(MemberVO vo);
	public int deleteMember(MemberVO vo);

}
