package org.zerock.service;

import java.util.ArrayList;

import org.zerock.command.BoardVO;
import org.zerock.command.MemberVO;

public interface MemberService {

	public int join(MemberVO vo); 
	public int login(MemberVO vo); 
	public int emailCheck(String email); 
}
