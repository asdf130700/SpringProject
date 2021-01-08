package com.test.board.mapper;

import java.util.List;

import com.test.board.board.vo.BoardVO;


public interface BoardMapper {

	//게시판 리스트
	public List<BoardVO> list();
	//전체 데이터를 가져옴
	public Integer getCount();
	//게시판 글보기
	//public BoardVO view(int no);
	public BoardVO view(int no);
	//조회수 1 증가
	public void increase(int no);
	//게시판 글 쓰기
	public void write(BoardVO vo);
	//게시판 글 수정
	public void update(BoardVO vo);
	//게시판 글 삭제
	public void delete(BoardVO vo);
	
}
