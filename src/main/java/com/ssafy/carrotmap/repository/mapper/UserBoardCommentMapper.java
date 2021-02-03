package com.ssafy.carrotmap.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.carrotmap.repository.dto.NoticeBoardComment;
import com.ssafy.carrotmap.repository.dto.UserBoardComment;

@Mapper
public interface UserBoardCommentMapper {

	
	
	void insertNoticeBoardComment(UserBoardComment comment);
	
//	void deleteNoticeBoardComment(int no);
//	void updateNoticeBoardComment(int no);
	

	List<UserBoardComment> selectUserBaordCommentByboardNo(int no);

	
	
}

