package com.test.board.board.dao;

import java.util.List;

import com.test.board.board.vo.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> viewReply(int no) throws Exception;
	
	public void writeReply(ReplyVO vo) throws Exception;
}
