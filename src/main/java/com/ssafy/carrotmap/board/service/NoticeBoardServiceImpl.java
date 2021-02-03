package com.ssafy.carrotmap.board.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.carrotmap.repository.dto.BoardSearchType;
import com.ssafy.carrotmap.repository.dto.NoticeBoard;
import com.ssafy.carrotmap.repository.dto.NoticeBoardComment;
import com.ssafy.carrotmap.repository.mapper.NoticeBoardCommentMapper;
import com.ssafy.carrotmap.repository.mapper.NoticeBoardMapper;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	NoticeBoardMapper noticeBoardMapper;

	@Autowired
	NoticeBoardCommentMapper noticeBoardCommentMapper;

//	@Override
//	public void insert(NoticeBoard board) {
//		noticeBoardMapper.insert(board);		
//	}
//
//	@Override
//	public void update(NoticeBoard board) {
//		noticeBoardMapper.update(board);
//
//	}

	@Override
	public int selectBoardListCnt() {
		return noticeBoardMapper.selectBoardListCnt();
	}

	@Override
	public List<NoticeBoard> selectBoardList(BoardSearchType searchType) {
		int stIdx = searchType.getStartIndex();
		int perCnt = searchType.getCntPerPage();

		searchType.setCntPerPage(stIdx + perCnt);
		return noticeBoardMapper.selectBoardList(searchType);
	}

	@Override
	public NoticeBoard select(int no) {
		noticeBoardMapper.increaseViewCnt(no);
		NoticeBoard board = noticeBoardMapper.selectByNo(no);
//		List<String> category=noticeBoardMapper.selectCategoryByNo(no);
//		board.setCategory(category);
		return board;
	}

	@Override
	public void commentInsert(NoticeBoardComment comment) {
		noticeBoardCommentMapper.insertNoticeBoardComment(comment);

	}

	@Override
	public List<NoticeBoardComment> selectNoticeCommentByNoticeNo(int no) {
		System.out.println("서비스1");
		List<NoticeBoardComment> list = noticeBoardCommentMapper.selectNoticeCommentByNoticeNo(no);
		System.out.println("서비스2");
		List<NoticeBoardComment> list2= new LinkedList<NoticeBoardComment>();
		if (list != null) {
			
			for (NoticeBoardComment comment : list) {
				if(comment.getClassNo()==0) {
					comment.setList(new LinkedList<NoticeBoardComment>() );
					list2.add(comment);
				}else {			
					int idx=list2.size()-1;
					list2.get(idx).getList().add(comment);
				}
			}

		}
		for (NoticeBoardComment comment : list2) {
			System.out.println(comment.getGroupNo()+" "+comment.getClassNo());
			for (NoticeBoardComment comment2 : comment.getList()) {
				System.out.println("    "+comment2.getGroupNo()+" "+comment2.getClassNo());
			}
		}
		System.out.println(list2.size());
		return list2;
	}

	@Override
	public List<NoticeBoard> selectBoardListByImportance() {
		return noticeBoardMapper.selectBoardListByImportance();
	}

}
