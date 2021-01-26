package com.test.board.board.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.board.board.vo.BoardVO;
import com.test.board.board.vo.Criteria;
import com.test.board.board.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("com.test.board.mapper.BoardMapper.insert", boardVO);
		
	}

	/*
	 * @Override public List<BoardVO> list(SearchCriteria scri) throws Exception {
	 * // TODO Auto-generated method stub return
	 * sqlSession.selectList("com.test.board.mapper.BoardMapper.list", scri); }
	 */
	@Override
	public BoardVO view(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.test.board.mapper.BoardMapper.view", no);
	}
	@Override
	public void update(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("com.test.board.mapper.BoardMapper.update", boardVO);
		
	}
	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("com.test.board.mapper.BoardMapper.delete", no);
	}

	/*
	 * @Override public int getCount() throws Exception { // TODO Auto-generated
	 * method stub return
	 * sqlSession.selectOne("com.test.board.mapper.BoardMapper.getCount"); }
	 */
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.test.board.mapper.BoardMapper.list", scri);
	}
	@Override
	public int getCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.test.board.mapper.BoardMapper.getCount", scri);
	}

	@Override
	public void increase(int no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("com.test.board.mapper.BoardMapper.increase", no);
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("com.test.board.mapper.BoardMapper.insertFile", map);
	}

}
