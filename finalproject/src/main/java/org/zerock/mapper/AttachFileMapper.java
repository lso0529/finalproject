package org.zerock.mapper;

import org.zerock.command.AttachFileDTO;

public interface AttachFileMapper {
	
	public void insert(AttachFileDTO dto);			// 프로필 사진 추가
	public void delete(String email);				// 프로필 삭제
	public AttachFileDTO findByEmail(String email);	// 프로필 사진 불러오기
	public int profileCheck(String email);						// 프로필 등록시에 DB에 이전데이터가 있는지 확인하기 위한 메서드
}
