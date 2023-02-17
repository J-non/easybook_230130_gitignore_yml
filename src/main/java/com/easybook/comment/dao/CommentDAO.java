package com.easybook.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.easybook.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("userId") int userId,
			@Param("itemId") int itemId,
			@Param("rating") double rating,
			@Param("comment") String comment);
	
	public List<Comment> selectCommentListByItemId(int itemId);
	
	public int updateCommentByIdUserIdItemId(
			@Param("commentId") int commentId,
			@Param("userId") int userId,
			@Param("itemId") int itemId,
			@Param("rating") double rating,
			@Param("comment") String comment);
	
	public int deleteCommentByIdUserIdItemId(
			@Param("commentId") int commentId,
			@Param("userId") int userId,
			@Param("itemId") int itemId);
	
}
