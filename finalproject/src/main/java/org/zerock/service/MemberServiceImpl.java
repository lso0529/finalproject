package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	
	


}
