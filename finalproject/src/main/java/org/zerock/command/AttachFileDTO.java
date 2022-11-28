package org.zerock.command;

import lombok.Data;

@Data
public class AttachFileDTO {
	
	private String FileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
	// 추후 이메일을 넣어서 이메일에 맞는 이미지를 불러오면?

}
