package com.test.borad.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.board.board.dao.ReplyDAO;
import com.test.board.board.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject ReplyDAO dao;
	
	@Override
	public List<ReplyVO> viewReply(int no) throws Exception {
		// TODO Auto-generated method stub
		return dao.viewReply(no);
	}

}
