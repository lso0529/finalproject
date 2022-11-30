package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.command.AttachFileDTO;
import org.zerock.mapper.AttachFileMapper;

@Service("AttachFileService")
public class AttachFileServiceImpl implements AttachFileService{
	
	@Autowired
	AttachFileMapper mapper;
	
	@Override
	public void insert(AttachFileDTO dto) {
		int result = mapper.profileCheck(dto.getEmail()); 
		if(result > 0) {
			mapper.delete(dto.getEmail());
			mapper.insert(dto);
		}else {
			mapper.insert(dto);
		}
		
	}
	
	@Override
	public AttachFileDTO findByEmail(AttachFileDTO dto) {
		AttachFileDTO resultDTO = new AttachFileDTO();
		
		int result = mapper.profileCheck(dto.getEmail()); 
		
		if(result == 0) {
			resultDTO.setUuid("70d9eb1d-b926-4ef3-97c4-9230568354b7");
			resultDTO.setUploadPath("basic");
			resultDTO.setFileName("basic_user_profile.jpg");
			return resultDTO;
		}else {
			resultDTO = mapper.findByEmail(dto.getEmail());
			return resultDTO;
		}
	}
}
