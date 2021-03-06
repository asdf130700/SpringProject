package com.test.borad.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.board.board.vo.BoardVO;
import com.test.board.board.vo.Criteria;
import com.test.board.board.vo.PageMarker;
import com.test.board.board.vo.ReplyVO;
import com.test.board.board.vo.SearchCriteria;
import com.test.borad.service.BoardService;
import com.test.borad.service.ReplyService;

import lombok.AllArgsConstructor;



@Controller
@RequestMapping("/board/*")
//@AllArgsConstructor
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService replyService;
	
	// 게시판 글 작성 화면
	@RequestMapping(value ="board/write", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("write");
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value ="board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("write");
		
		service.write(boardVO, mpRequest);
		
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
		model.addAttribute("scri", scri);
	
		
		return "board/list";
	}
	// 게시판 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("view");
		model.addAttribute("view", service.view(boardVO.getNo()));
		model.addAttribute("scri", scri);
		
		//댓글
		List<ReplyVO> replyList = replyService.viewReply(boardVO.getNo());
		model.addAttribute("replyList", replyList);
		
		return "board/view";
	}
	// 게시판 수정화면
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("update");
		
		model.addAttribute("update", service.view(boardVO.getNo()));
		model.addAttribute("scri", scri);
		return "board/update";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rdattr) throws Exception{
		logger.info("update");
		
		service.update(boardVO);
		
		rdattr.addAttribute("page", scri.getPage());
		rdattr.addAttribute("pageNum", scri.getPageNum());
		rdattr.addAttribute("searchType", scri.getSearchType());
		rdattr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/board/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rdattr) throws Exception{
		logger.info("delete");
		
		service.delete(boardVO.getNo());
		
		rdattr.addAttribute("page", scri.getPage());
		rdattr.addAttribute("pageNum", scri.getPageNum());
		rdattr.addAttribute("searchType", scri.getSearchType());
		rdattr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	//댓글작성 POST 메소드
	@RequestMapping(value = "/viewReply", method = RequestMethod.POST)
	public String writeReply(ReplyVO vo, SearchCriteria scri, RedirectAttributes rdattr) throws Exception{
		logger.info("writeReply");
		
		replyService.writeReply(vo);
		
		rdattr.addAttribute("no", vo.getNo());
		rdattr.addAttribute("page", scri.getPage());
		rdattr.addAttribute("pageNum", scri.getPageNum());
		rdattr.addAttribute("searchType", scri.getSearchType());
		rdattr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/view";
	}

	//댓글 수정 GET
	@RequestMapping(value="/replyUpdate", method = RequestMethod.GET)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
		
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "board/replyUpdate";
	}
		
		//댓글 수정 POST
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String updateReply(ReplyVO vo, SearchCriteria scri, RedirectAttributes radttr) throws Exception {
			logger.info("updateReply");
			
		
					replyService.updateReply(vo);
					
					radttr.addAttribute("rno", vo.getRno());
					radttr.addAttribute("no", vo.getNo());
					radttr.addAttribute("page", scri.getPage());
					radttr.addAttribute("pageNum", scri.getPageNum());
					radttr.addAttribute("searchType", scri.getSearchType());
					radttr.addAttribute("keyword", scri.getKeyword());

		

			return "redirect:/board/view";
		}
		
		//댓글 삭제 GET
		@RequestMapping(value="/replyDelete", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
			model.addAttribute("scri", scri);
			

			return "board/replyDelete";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("no", vo.getNo());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("pageNum", scri.getPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/view";
		}
		
}
 