package com.easybook.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easybook.comment.dao.CommentDAO;
import com.easybook.comment.model.Comment;
import com.easybook.comment.model.CommentView;
import com.easybook.user.bo.UserBO;
import com.easybook.user.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addComment(int userId, int itemId, double rating, String comment) {
		return commentDAO.insertComment(userId, itemId, rating, comment);
	}
	
	private List<Comment> getCommentListByItemId(int itemId) {
		return commentDAO.selectCommentListByItemId(itemId);
	}
	
	public List<CommentView> generateCommentViewByItemId(int itemId) {
		List<CommentView> commentViewList = new ArrayList<>();
		
		List<Comment> commentList = getCommentListByItemId(itemId);
		
		Double sumRating = 0.0;
		int count = 0;
		for (Comment comment : commentList) {
			CommentView commentView = new CommentView();
			
			commentView.setComment(comment);
			User user = userBO.getUserById(comment.getUserId());
			commentView.setUser(user);
			
			sumRating += comment.getRating();
			count++;
			commentView.setAverageRating(sumRating / count);
			
			commentViewList.add(commentView);
		}
		
		return commentViewList;
	}
	
	public int updateCommentByIdUserIdItemId(int commentId, int userId, int itemId, double rating, String comment) {
		return commentDAO.updateCommentByIdUserIdItemId(commentId, userId, itemId, rating, comment);
	}
	
	public int deleteCommentByIdUserIdItemId(int commentId, int userId, int itemId) {
		return commentDAO.deleteCommentByIdUserIdItemId(commentId, userId, itemId);
	}
}
