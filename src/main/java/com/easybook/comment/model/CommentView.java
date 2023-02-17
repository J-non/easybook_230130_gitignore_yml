package com.easybook.comment.model;

import com.easybook.user.model.User;

public class CommentView {
	
	private Comment comment;
	private User user;
	private double averageRating;
	
	
	
	public double getAverageRating() {
		return averageRating;
	}
	public void setAverageRating(double averageRating) {
		this.averageRating = averageRating;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
