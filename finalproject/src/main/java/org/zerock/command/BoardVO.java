package org.zerock.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardVO {
	private int bno;
	private String name;
	private String topic;
	private String content;
	private String secret;
	private int likes;
}
