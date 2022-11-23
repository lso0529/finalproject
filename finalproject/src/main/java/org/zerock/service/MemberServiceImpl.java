package org.zerock.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.command.BoardVO;
import org.zerock.command.MemberVO;
import org.zerock.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	// 회원가입
	@Override
	public int join(MemberVO vo) {
		
		int result = mapper.join(vo);
		System.out.println("성공? 실패? "+ result);
		
		return result;
	}
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) {
		MemberVO resultvo = mapper.login(vo);
		System.out.println("MemberServiceImpl -> login()");
		return resultvo;
	}

	// 이메일 체크
	@Override
	public MemberVO emailCheck(MemberVO vo) throws Exception {
		MemberVO resultvo = mapper.emailCheck(vo);
		return resultvo;
	}
	
	// 비밀번호 변경
	@Override
	public int pwUpdate(MemberVO vo) throws Exception {
		int result = mapper.pwUpdate(vo);
		return result;
	}
	
	// 회원 탈퇴
	@Override
	public int deleteMember(MemberVO vo) {
		int result = mapper.deleteMember(vo);
		
		return result;
	}

	@Override
	public int checkName(String checkName) {
		int result = mapper.checkName(checkName);
		return result;
	}


}
