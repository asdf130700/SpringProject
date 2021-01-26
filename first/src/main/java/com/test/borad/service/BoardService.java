package com.test.borad.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.board.board.vo.BoardVO;
import com.test.board.board.vo.Criteria;
import com.test.board.board.vo.SearchCriteria;
import com.test.board.mapper.BoardMapper;


@Service
public interface BoardService {
	  
	  
	  public void write(BoardVO boardVO, MultipartHttpServletRequest mpRequesst) throws Exception;

	  public List<BoardVO> list(SearchCriteria scri) throws Exception;
	  
	  public int getCount(SearchCriteria scri) throws Exception;

	  public BoardVO view(int no) throws Exception;
	  
	  public void update(BoardVO boardVO) throws Exception;
	  
	  public void delete(int no) throws Exception;
	  
	  public void increase(int no) throws Exception;
}
