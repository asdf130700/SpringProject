package com.test.borad.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.test.board.board.vo.BoardVO;
import com.test.board.board.vo.Criteria;
import com.test.board.mapper.BoardMapper;


@Service
public interface BoardService {
	  
	  
	  public void write(BoardVO boardVO) throws Exception;

	  public List<BoardVO> list(Criteria cri) throws Exception;
	  
	  public int getCount() throws Exception;

	  public BoardVO view(int no) throws Exception;
	  
	  public void update(BoardVO boardVO) throws Exception;
	  
	  public void delete(int no) throws Exception;
}
