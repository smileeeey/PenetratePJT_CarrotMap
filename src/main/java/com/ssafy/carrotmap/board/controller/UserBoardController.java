package com.ssafy.carrotmap.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.ssafy.carrotmap.board.service.UserBoardService;
import com.ssafy.carrotmap.repository.dto.BoardSearchType;
import com.ssafy.carrotmap.repository.dto.NoticeBoardComment;
import com.ssafy.carrotmap.repository.dto.Pagination;
import com.ssafy.carrotmap.repository.dto.User;
import com.ssafy.carrotmap.repository.dto.UserBoard;
import com.ssafy.carrotmap.repository.dto.UserBoardComment;

@Controller
@RequestMapping("/board/user")
public class UserBoardController {

	@Autowired
	UserBoardService userBoardService;

	@Autowired
	NoticeBoardService noticeBoardService;

	@GetMapping("/insert")
	public String insert() {
		return "/board/user/userboardwriteform";
	}

	@PostMapping("/insert")
	public String insert(UserBoard board) {
		System.out.println(board);
		userBoardService.insert(board);
		return "redirect:list";
	}

	@PutMapping
	public String update(UserBoard board) {
		userBoardService.update(board);
		return "redirect:list";
	}

	@GetMapping("/select")
	public String select(int no, Model model, HttpSession session) {
		model.addAttribute("listcnt", userBoardService.selectBoardListCnt());
		System.out.println(model.getAttribute("listcnt"));
		model.addAttribute("comments", userBoardService.selectUserBaordCommentByboardNo(no));
		System.out.println(model.getAttribute("comments"));
		model.addAttribute("board", userBoardService.select(no));
		System.out.println(model.getAttribute("board"));
		model.addAttribute("likeCnt", userBoardService.selectUserBoardLikeCnt(no));
		System.out.println(model.getAttribute("likeCnt"));
		if (session.getAttribute("userinfo") != null) {
			String id = ((User) session.getAttribute("userinfo")).getId();
			model.addAttribute("userLiked", userBoardService.selectIsLiked(no, id));
			System.out.println("liked" + model.getAttribute("userLiked"));
		} else {
			model.addAttribute("userLiked", 0);
			System.out.println("liked" + 0);
		}

//		model.addAttribute("dislikeCnt",userBoardService.selectUserBoardDisLikeCnt(no) );

		// 중요 공지사항
		model.addAttribute("impboard", noticeBoardService.selectBoardListByImportance());
		System.out.println(" importances " + ((List<NoticeBoardComment>) model.getAttribute("impboard")).size());
		
		return "board/user/userboarddetail";
	}

	@GetMapping("/delete")
	public String delete(int no, Model model) {
		userBoardService.delete(no);
		return "redirect:list";
	}

	@GetMapping("/list")
	public String boardList(@ModelAttribute("Uesrboard") BoardSearchType SearchType,
			@RequestParam(defaultValue = "1") int curPage, Model model) throws Exception {

		if (SearchType.getSearchWord() != null)
			SearchType.setSearchCondition("check");
		System.out.println("/board/notice/list Searchword : " + SearchType);
		// 전체리스트 개수
		int listCnt = userBoardService.selectBoardListCnt();
		System.out.println("list cnt " + listCnt);
		Pagination pagination = new Pagination(listCnt, curPage);

		// noticeMapper.selectBoardList() 찾는 범위는
		// SearchType.startIndex~SearchType.StartIndex+SearchType.cntPerPage
		SearchType.setStartIndex(pagination.getStartIndex());
		SearchType.setCntPerPage(pagination.getPageSize());

		// 전체리스트 출력
		List<UserBoard> list = userBoardService.selectBoardList(SearchType);

		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);

		System.out.println("list  " + list.size());

		// 중요 공지사항
		model.addAttribute("impboard", noticeBoardService.selectBoardListByImportance());
		System.out.println(" importances " + ((List<NoticeBoardComment>) model.getAttribute("impboard")).size());
		return "board/user/userboard";
	}

	@PostMapping("/comment/insert")
	public String commentInsert(UserBoardComment comment, RedirectAttributes redirect) {
		System.out.println("comment"+comment);
		userBoardService.commentInsert(comment);
		redirect.addAttribute("no", comment.getBoardNo());
		return "redirect:/board/user/select";
	}

	@PostMapping("/comment/insert-rest")
	@ResponseBody
	public UserBoardComment commentInsert2(UserBoardComment comment, Model model) {
		System.out.println("comment-rest-reply  " + comment);
		
		
		return comment;
	}

	@PostMapping("/check-like")
	@ResponseBody
	public int checkLiked(int no, String id, Model model) {
		System.out.println("update-like  " + no + " " + id);
		return userBoardService.checkLiked(no, id);
	}

	@PostMapping("/update-like")
	@ResponseBody
	public int updateLiked(int no, String id, Model model) {
		System.out.println("update-like  " + no + " " + id);
		return userBoardService.updateLike(no, id);
	}

	@PostMapping("/delete-like")
	@ResponseBody
	public int deleteLiked(int no, String id, Model model) {
		System.out.println("delete-like  " + no + " " + id);
		return userBoardService.deleteLiked(no, id);
	}

}
