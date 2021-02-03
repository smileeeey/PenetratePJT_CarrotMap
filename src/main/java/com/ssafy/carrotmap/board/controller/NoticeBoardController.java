package com.ssafy.carrotmap.board.controller;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.carrotmap.board.service.NoticeBoardService;
import com.ssafy.carrotmap.repository.dto.BoardSearchType;
import com.ssafy.carrotmap.repository.dto.NoticeBoard;
import com.ssafy.carrotmap.repository.dto.NoticeBoardComment;
import com.ssafy.carrotmap.repository.dto.Pagination;

@Controller
@RequestMapping("/board/notice")
public class NoticeBoardController {

	@Autowired
	NoticeBoardService noticeBoardService;

	@GetMapping("/insert")
	public String insert() {		
		return "/board/notice/writeform";
	}	
	
	@PostMapping("/insert")
	public String insert(NoticeBoard board) {
//		noticeBoardService.insert(board);
		return "redirect:list";
	}	
	

	@PutMapping
	public String update(NoticeBoard board) {
//		noticeBoardService.update(board);
		return "redirect:list";
	}

	@GetMapping("/select")
	public String select(int no, Model model) {
		System.out.println("/board/notice/select");
		model.addAttribute("listcnt",noticeBoardService.selectBoardListCnt());
		System.out.println("1");
		model.addAttribute("board",noticeBoardService.select(no));
		System.out.println("2");
//		model.addAttribute("user",);
		model.addAttribute("comments",noticeBoardService.selectNoticeCommentByNoticeNo(no));
		
		// 중요 공지사항
				model.addAttribute("impboard", noticeBoardService.selectBoardListByImportance());
				System.out.println(" importances " + ((List<NoticeBoardComment>) model.getAttribute("impboard")).size());
		
		return "board/notice/noticeboarddetail";
	}
	

	@GetMapping("/list")
	public String boardList(@ModelAttribute("NoticeBoard") BoardSearchType SearchType, @RequestParam(defaultValue = "1") int curPage,
			 Model model) throws Exception {

		if(SearchType.getSearchWord()!=null) SearchType.setSearchCondition("check");
		System.out.println("/board/notice/list Searchword : "+SearchType);
		// 전체리스트 개수
		int listCnt = noticeBoardService.selectBoardListCnt();
		Pagination pagination = new Pagination(listCnt, curPage);

		//noticeMapper.selectBoardList() 찾는 범위는 SearchType.startIndex~SearchType.StartIndex+SearchType.cntPerPage
		SearchType.setStartIndex(pagination.getStartIndex());
		SearchType.setCntPerPage(pagination.getPageSize());
		
		System.out.println("SearchType : "+SearchType);
		
		// 전체리스트 출력
		SearchType.setBoardType("title");
		List<NoticeBoard> list = noticeBoardService.selectBoardList(SearchType);
		
		System.out.println("list is size : "+list.size());
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		
		
		
		// 중요 공지사항
				model.addAttribute("impboard", noticeBoardService.selectBoardListByImportance());
				System.out.println(" importances " + ((List<NoticeBoardComment>) model.getAttribute("impboard")).size());

		return "board/notice/noticeboard";
	}
	
	@PostMapping("/comment/insert")
	public String commentInsert(NoticeBoardComment comment,RedirectAttributes redirect) {
		System.out.println("comment  "+comment);
		noticeBoardService.commentInsert(comment);
		redirect.addAttribute("no",comment.getNoticeNo());
		return "redirect:/board/notice/select";
	}
	
	@PostMapping("/comment/insert-rest")
	@ResponseBody
	public NoticeBoardComment commentInsert2(NoticeBoardComment comment,Model model) {
		System.out.println("comment-rest  "+comment);
		noticeBoardService.commentInsert(comment);
		
		return comment;
	}
	

}
