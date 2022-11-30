package org.zerock.command;

import lombok.Data;

@Data
public class AttachFileDTO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private String email;
	// 추후 이메일을 넣어서 이메일에 맞는 이미지를 불러오면?

}
