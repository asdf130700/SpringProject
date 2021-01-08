package com.test.board.board.dao;

import java.util.List;

import com.test.board.board.vo.BoardVO;
import com.test.board.board.vo.Criteria;

public interface BoardDAO {

	//게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	//게시글 목록 조회
	public List<BoardVO> list(Criteria cri) throws Exception;
	
	public int getCount() throws Exception;
	
	//게시물 조회
	public BoardVO view(int no) throws Exception;
	
	//게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	//게시물 삭제
	public void delete(int no) throws Exception;
}