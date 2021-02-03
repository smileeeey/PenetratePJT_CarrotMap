package com.ssafy.carrotmap.board.service;

import java.util.List;

import com.ssafy.carrotmap.repository.dto.BoardSearchType;
import com.ssafy.carrotmap.repository.dto.NoticeBoardComment;
import com.ssafy.carrotmap.repository.dto.UserBoard;
import com.ssafy.carrotmap.repository.dto.UserBoardComment;

public interface UserBoardService {

	void insert(UserBoard board);

	void update(UserBoard board);

	Object select(int no);

	int selectBoardListCnt();

	List<UserBoard> selectBoardList(BoardSearchType searchType);
	
	void delete(int no);

	public List<UserBoardComment> selectUserBaordCommentByboardNo(int no);

	void commentInsert(UserBoardComment comment);

	int selectUserBoardLikeCnt(int no);
	
	
	int selectUserBoardDisLikeCnt(int no);

	int updateLike(int no, String id);

	int selectIsLiked(int no, String id);

	int deleteLiked(int no, String id);

	int checkLiked(int no, String id);
	
	



}
