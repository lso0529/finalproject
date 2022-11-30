package org.zerock.service;

import org.zerock.command.AttachFileDTO;

public interface AttachFileService {
	
	public void insert(AttachFileDTO dto);					// 프로필 사진 추가
	public AttachFileDTO findByEmail(AttachFileDTO dto);  	// 프로필 사진 불러오기
	
}
