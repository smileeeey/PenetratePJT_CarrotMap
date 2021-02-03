package com.ssafy.carrotmap.repository.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.ssafy.carrotmap.repository.dto.BoardSearchType;
import com.ssafy.carrotmap.repository.dto.Like;
import com.ssafy.carrotmap.repository.dto.UserBoard;

@Mapper
public interface UserBoardMapper {

	UserBoard selectByNo(int no);

//	List<String> selectCategoryByNo(int no);

	int selectBoardListCnt();
	
	List<UserBoard> selectBoardList(BoardSearchType searchType);


	void insert(UserBoard board);

	void update(UserBoard board);

	void delete(int no);

	void increaseViewCnt(int no);

	int selectUserBoardLikeCnt(int no);
	
	int selectUserBoardDisLikeCnt(int no);
	
	int selectLike(Like like);
	
	void insertLike(Like like);

	void deleteLiked(Like like);



	
//	void increaseLikeCnt(int no);
//
//	void increaseDislikeCnt(int no);
//
//	void decreaseLikeCnt(int no);
//
//	void decreaseDislikeCnt(int no);

	

}
