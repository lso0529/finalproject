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
	public MemberVO login(MemberVO vo) {
		MemberVO resultvo = mapper.login(vo);
		System.out.println("MemberServiceImpl -> login()");
		return resultvo;
	}


	@Override
	public MemberVO emailCheck(MemberVO vo) throws Exception {
		MemberVO resultvo = mapper.emailCheck(vo);
		return resultvo;
	}

	@Override
	public int pwUpdate(MemberVO vo) throws Exception {
		int result = mapper.pwUpdate(vo);
		return result;
	}

	@Override
	public int deleteMember(MemberVO vo) {
		int result = mapper.deleteMember(vo);
		
		return result;
	}


}
