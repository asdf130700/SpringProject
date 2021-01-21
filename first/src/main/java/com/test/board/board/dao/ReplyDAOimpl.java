package com.test.board.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.board.board.vo.ReplyVO;

@Repository
public class ReplyDAOimpl implements ReplyDAO {

	@Inject
	SqlSession sql;

	@Override
	public List<ReplyVO> viewReply(int no) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("com.test.board.mapper.ReplyMapper.viewReply", no);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("com.test.board.mapper.ReplyMapper.writeReply", vo);
	}

	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update("com.test.board.mapper.ReplyMapper.updateReply", vo);

	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete("com.test.board.mapper.ReplyMapper.deleteReply", vo);
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception { // TODO

		return sql.selectOne("com.test.board.mapper.ReplyMapper.selectReply", rno);

	}

}
