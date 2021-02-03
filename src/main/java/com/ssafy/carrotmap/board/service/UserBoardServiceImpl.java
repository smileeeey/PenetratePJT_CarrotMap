package com.ssafy.carrotmap.board.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.carrotmap.repository.dto.BoardSearchType;
import com.ssafy.carrotmap.repository.dto.Like;
import com.ssafy.carrotmap.repository.dto.NoticeBoardComment;
import com.ssafy.carrotmap.repository.dto.UserBoard;
import com.ssafy.carrotmap.repository.dto.UserBoardComment;
import com.ssafy.carrotmap.repository.mapper.UserBoardCommentMapper;
import com.ssafy.carrotmap.repository.mapper.UserBoardMapper;

@Service
public class UserBoardServiceImpl implements UserBoardService{

	@Autowired
	UserBoardMapper userBoardMapper; 
	
	@Autowired
	UserBoardCommentMapper UserBoardCommentMapper; 
	
	@Override
	public void insert(UserBoard board) {
		userBoardMapper.insert(board);		
	}

	@Override
	public void update(UserBoard board) {		
		userBoardMapper.update(board);
	}

	@Override
	public UserBoard select(int no) {
		userBoardMapper.increaseViewCnt(no);		
		UserBoard board=userBoardMapper.selectByNo(no);
//		List<String> category=userBoardMapper.selectCategoryByNo(no);
//		board.setCategory(category);
		return board;
	}

	@Override
	public int selectBoardListCnt() {		
		return userBoardMapper.selectBoardListCnt();
	}

	@Override
	public List<UserBoard> selectBoardList(BoardSearchType searchType) {
		return userBoardMapper.selectBoardList(searchType);
	}

	@Override
	public void delete(int no) {
		userBoardMapper.delete(no);
		
	}

	@Override
	public List<UserBoardComment> selectUserBaordCommentByboardNo(int no) {
		
		List<UserBoardComment> list = UserBoardCommentMapper.selectUserBaordCommentByboardNo(no);
		List<UserBoardComment> list2= new LinkedList<UserBoardComment>();
		if (list != null) {
			
			for (UserBoardComment comment : list) {
				if(comment.getClassNo()==0) {
					comment.setList(new LinkedList<UserBoardComment>() );
					list2.add(comment);
				}else {			
					int idx=list2.size()-1;
					list2.get(idx).getList().add(comment);
				}
			}

		}
		for (UserBoardComment comment : list2) {
			System.out.println(comment.getGroupNo()+" "+comment.getClassNo());
			for (UserBoardComment comment2 : comment.getList()) {
				System.out.println("    "+comment2.getGroupNo()+" "+comment2.getClassNo());
			}
		}

		return list2;
//		return UserBoardCommentMapper.selectUserBaordCommentByboardNo(no);
	}

	@Override
	public void commentInsert(UserBoardComment comment) {
		UserBoardCommentMapper.insertNoticeBoardComment(comment);
		
	}

	@Override
	public int selectUserBoardLikeCnt(int no) {
		return userBoardMapper.selectUserBoardLikeCnt(no);
	}

	@Override
	public int selectUserBoardDisLikeCnt(int no) {
		return userBoardMapper.selectUserBoardDisLikeCnt(no);
	}

	@Override
	public int updateLike(int no, String id) {
		if(0 == userBoardMapper.selectLike(new Like(no, id))) {
			System.out.println("종아요 추가");
			userBoardMapper.insertLike(new Like(no, id));			
			return 1;			
		}
		System.out.println("종아요 이미 있음");
		return 0;
		
		
	}

	@Override
	public int selectIsLiked(int no, String id) {
		return userBoardMapper.selectLike(new Like(no, id));
	}

	@Override
	public int deleteLiked(int no, String id) {
		if(1 == userBoardMapper.selectLike(new Like(no, id))) {
			System.out.println("삭제  "+no+" "+id);
			userBoardMapper.deleteLiked(new Like(no, id));			
			return 1;			
		}
		System.out.println("삭제- 해당 데이터 없음");
		return 0;
	}

	@Override
	public int checkLiked(int no, String id) {
		if(0 == userBoardMapper.selectLike(new Like(no, id))) {
			System.out.println("종아요 없음");						
			return 0;			
		}
		System.out.println("종아요 이미 있음");
		return 1;
	}



	

}
