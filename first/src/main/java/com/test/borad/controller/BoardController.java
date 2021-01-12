package com.test.borad.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.board.board.vo.BoardVO;
import com.test.board.board.vo.Criteria;
import com.test.board.board.vo.PageMarker;
import com.test.board.board.vo.SearchCriteria;
import com.test.borad.service.BoardService;


import lombok.AllArgsConstructor;



@Controller
@RequestMapping("/board/*")
//@AllArgsConstructor
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value ="board/write", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("write");
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value ="board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		logger.info("write");
		
		service.write(boardVO);
		
		return "redirect:/board/list";
	}
	//게시판 목록보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, SearchCriteria scri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		PageMarker pageMarker = new PageMarker();
		pageMarker.setCri(scri);
		pageMarker.setTotalCount(service.getCount(scri));
		
		model.addAttribute("pageMarker", pageMarker);
	
		
		return "board/list";
	}
	// 게시판 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(BoardVO boardVO, Model model) throws Exception{
		logger.info("view");
		model.addAttribute("view", service.view(boardVO.getNo()));
		return "board/view";
	}
	// 게시판 수정화면
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, Model model) throws Exception{
		logger.info("update");
		
		model.addAttribute("update", service.view(boardVO.getNo()));
		return "board/update";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		logger.info("update");
		
		service.update(boardVO);
		return "redirect:/board/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO) throws Exception{
		logger.info("delete");
		
		service.delete(boardVO.getNo());
		return "redirect:/board/list";
	}
}
 