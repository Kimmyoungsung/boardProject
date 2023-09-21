package com.kosa.pro1.comment;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class CommentDTO {
	
	private int commentid;
	private int boardid;
	private String contents;
	private String writer_uid;
	private Date reg_date;
	private String delete_yn;
}