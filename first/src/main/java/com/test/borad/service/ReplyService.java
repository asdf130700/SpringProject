package com.test.borad.service;

import java.util.List;

import com.test.board.board.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> viewReply(int no) throws Exception;
}
