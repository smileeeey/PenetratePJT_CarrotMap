package com.ssafy.carrotmap.board.service;

import java.util.List;

import com.ssafy.carrotmap.repository.dto.BoardSearchType;
import com.ssafy.carrotmap.repository.dto.NoticeBoard;
import com.ssafy.carrotmap.repository.dto.NoticeBoardComment;

public interface NoticeBoardService {

//	void insert(NoticeBoard board);
//
//	void update(NoticeBoard board);

	int selectBoardListCnt();

	List<NoticeBoard> selectBoardList(BoardSearchType searchType);

	NoticeBoard select(int no);

	void commentInsert(NoticeBoardComment comment);

	List<NoticeBoardComment> selectNoticeCommentByNoticeNo(int no);

	List<NoticeBoard> selectBoardListByImportance();
	

}
