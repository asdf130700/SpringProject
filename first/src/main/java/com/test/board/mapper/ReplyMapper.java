package com.test.board.mapper;

import java.util.List;

import com.test.board.board.vo.ReplyVO;

public interface ReplyMapper {

	public List<ReplyVO> replyList();
	
	public ReplyVO viewReply(int no);
}
