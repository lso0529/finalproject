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

	@Override
	public int join(MemberVO vo) {
		
		int result = mapper.join(vo);
		System.out.println("성공? 실패? "+ result);
		
		return result;
	}

	@Override
	public int login(MemberVO vo) {
		int result = mapper.login(vo);
		System.out.println("성공? 실패?: "+result);
		return result;
	}


	@Override
	public int emailCheck(String email) {
		int result = mapper.emailCheck(email);
		System.out.println("이메일 개수 : "+result);
		return 0;
	}
	
	@Override
	public MemberVO pwCheck(MemberVO vo) throws Exception {
		MemberVO resultvo = mapper.pwCheck(vo);
		return resultvo;
	}

	@Override
	public int pwUpdate(MemberVO vo) throws Exception {
		int result = mapper.pwUpdate(vo);
		return result;
	}


}
