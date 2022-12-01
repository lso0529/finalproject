package org.zerock.command;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class LikeVO {
	private int bno;
	private String name;
	private int likecount;
	
	public LikeVO() {

	}
}
