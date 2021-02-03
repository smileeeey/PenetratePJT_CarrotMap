package com.ssafy.carrotmap.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.carrotmap.repository.dto.NoticeBoardComment;

@Mapper
public interface NoticeBoardCommentMapper {

	List<NoticeBoardComment> selectNoticeCommentByNoticeNo(int no);
	
	void insertNoticeBoardComment(NoticeBoardComment comment);
	
	void deleteNoticeBoardComment(int no);
	
	void updateNoticeBoardComment(int no);
	
}
