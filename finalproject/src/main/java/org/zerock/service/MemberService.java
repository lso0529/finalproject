package org.zerock.service;

import org.zerock.command.MemberVO;

public interface MemberService {

	public int join(MemberVO vo); 
	public MemberVO login(MemberVO vo); 
	public MemberVO emailCheck(MemberVO vo) throws Exception;
	public int pwUpdate(MemberVO vo) throws Exception;
	public int deleteMember(MemberVO vo);
}
