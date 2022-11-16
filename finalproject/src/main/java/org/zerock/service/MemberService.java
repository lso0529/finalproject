package org.zerock.service;

import org.zerock.command.MemberVO;

public interface MemberService {

	public int join(MemberVO vo); 
	public int login(MemberVO vo); 
	public int emailCheck(String email); 
	public MemberVO pwCheck(MemberVO vo) throws Exception;
	public int pwUpdate(MemberVO vo) throws Exception;
}
