package org.zerock.mapper;

import org.zerock.command.MemberVO;

public interface MemberMapper {

	public int join(MemberVO vo);				// 회원가입
	public MemberVO login(MemberVO vo);			// 로그인
	public MemberVO emailCheck(MemberVO vo); 	// 이메일 체크
	public int pwUpdate(MemberVO vo);			// 비밀번호 변경
	public int deleteMember(MemberVO vo);		// 회원 탈퇴
	public int checkName(String checkName);     //아이디 체크 

}
