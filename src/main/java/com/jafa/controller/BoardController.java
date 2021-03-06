package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.dto.Board;
import com.jafa.dto.Criteria;
import com.jafa.dto.PageMarker;
import com.jafa.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public String getBoardlist(Criteria criteria, Model model) {
		PageMarker pageMarker = new PageMarker();
		pageMarker.setCriteria(criteria);
		pageMarker.setTotalCount(service.totalCount(criteria));
		System.out.println("시작페이지 : " + pageMarker.getStartPage());
		System.out.println("끝 페이지 : " + pageMarker.getEndPage());
		// ?page=1 시작페이지 : 1 - 끝페이지 10 ?page=1 시작페이지 : 9 - 끝페이지 10
		// ?page=2 시작페이지 : 11 - 끝페이지 20
		
		List<Board> list = service.getList(criteria);
		model.addAttribute("list", list);
		model.addAttribute("pageMarker",pageMarker);
		return "board/list";
	}
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public String get(Long bno, Model model) {
		Board board = service.get(bno);
		model.addAttribute("board", board);
		return "board/get";
	}
	@PostMapping("/remove")
	public String delete(Long bno, RedirectAttributes rttr) {
		service.remove(bno);
		rttr.addFlashAttribute("message", bno + "번 삭제함");
		return "redirect:list";
	}
	
	@GetMapping("/register")
	public String registerForm() {
		return "board/register";
	}
	
	@PostMapping("/register")
	public String register(Board board, RedirectAttributes rttr) {
		service.register(board);	
		rttr.addFlashAttribute("message", board.getBno() + "번 글 등록함");
		return "redirect:list";
	}
	
	@GetMapping("/modify")
	public String modify(Long bno, Model model) {
		model.addAttribute("board", service.get(bno));
		return "board/modify";
	}
	
	@PostMapping("/update")
	public String update(Board board) {
		service.update(board);
		return "redirect:list";
	}
}
