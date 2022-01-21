package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.BoardService;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.PageMaker;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 게시판 글 작성 화면
	@GetMapping("/board/writeView")
	public String writeView() throws Exception {
		logger.info("writeView");
		
		return "board/writeView";
	}
	
	// 게시판 글 작성
	@PostMapping("/board/write")
	public String write(BoardVO boardVO) throws Exception {
		logger.info("write");
		service.write(boardVO);
		
		return "redirect:/board/list";
	}
	
	// 게시판 목록 조회
	@GetMapping("/board/list")
	public String list(Model model, Criteria cri) throws Exception {
		logger.info("list");
		
		model.addAttribute("list", service.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
	}
	
	// 게시판 조회
	@GetMapping("/board/readView")
	public String read(BoardVO boardVO, Model model) throws Exception {
		logger.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBno()));
		
		return "board/readView";
	}
	
	// 게시판 수정뷰
	@GetMapping("/board/updateView")
	public String update(BoardVO boardVO, Model model) throws Exception {
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		
		return "board/updateView";
	}
	
	// 게시판 수정
	@PostMapping("/board/update")
	public String update(BoardVO boardVO) throws Exception {
		logger.info("update");
		
		service.update(boardVO);
		
		return "redirect:/board/list";
	}
	
	// 게시판 삭제
	@PostMapping("/board/delete")
	public String delete(BoardVO boardVO) throws Exception {
		logger.info("delete");
		
		service.delete(boardVO.getBno());
		
		return "redirect:/board/list";
	}
}
