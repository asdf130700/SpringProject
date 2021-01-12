package com.test.borad.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.board.board.dao.BoardDAO;
import com.test.board.board.vo.BoardVO;
import com.test.board.board.vo.Criteria;
import com.test.board.board.vo.SearchCriteria;


@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Override
	public void write(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		dao.write(boardVO);
	}
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception{
		return dao.list(scri);
	}
	
	public BoardVO view(int no) throws Exception{
		return dao.view(no);
	}
	@Override
	public void update(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		dao.update(boardVO);
		
	}
	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(no);
	}
	@Override
	public int getCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getCount(scri);
	}

}
