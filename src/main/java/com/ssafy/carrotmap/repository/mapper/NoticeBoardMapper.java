package com.ssafy.carrotmap.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.carrotmap.repository.dto.BoardSearchType;
import com.ssafy.carrotmap.repository.dto.NoticeBoard;

@Mapper
public interface NoticeBoardMapper {
	void increaseViewCnt(int no);

	NoticeBoard selectByNo(int no);

	List<String> selectCategoryByNo(int no);

	List<NoticeBoard> selectBoardList(BoardSearchType searchType);

	int selectBoardListCnt();

	List<NoticeBoard> selectBoardListByImportance();

//	void insert(NoticeBoard board);

//	void update(NoticeBoard board);

}
