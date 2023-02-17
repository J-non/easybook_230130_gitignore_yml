package com.easybook.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.easybook.comment.bo.CommentBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/comment")
@RestController
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	
	/**
	 * 댓글 생성 API
	 * @param model
	 * @param itemId
	 * @param rating
	 * @param comment
	 * @param session
	 * @return
	 */
	@PostMapping("/create")
	public Map<String, Object> createComment(
			@RequestParam("itemId") int itemId
			, @RequestParam("rating") double rating 
			, @RequestParam("comment") String comment
			, HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		int row = commentBO.addComment(userId, itemId, rating, comment);
		Map<String, Object> result = new HashMap<>();
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "댓글 작성 실패. 관리자에게 문의하세요.");
		}
		return result;
	}
	
	/**
	 * 댓글 및 평점 수정 API
	 * @param commentId
	 * @param itemId
	 * @param rating
	 * @param comment
	 * @param session
	 * @return
	 */
	@PostMapping("/update")
	public Map<String, Object> updateComment(
			@RequestParam("commentId") int commentId
			, @RequestParam("itemId") int itemId
			, @RequestParam("rating") double rating 
			, @RequestParam("comment") String comment
			, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		int row = commentBO.updateCommentByIdUserIdItemId(commentId, userId, itemId, rating, comment);
		Map<String, Object> result = new HashMap<>();
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "댓글 및 평점 수정 실패. 관리자에게 문의하세요.");
		}
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> deleteComment(
			@RequestParam("commentId") int commentId
			, @RequestParam("itemId") int itemId
			, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		int row = commentBO.deleteCommentByIdUserIdItemId(commentId, userId, itemId);
		Map<String, Object> result = new HashMap<>();
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "댓글 삭제 실패. 관리자에게 문의하세요.");
		}
		return result;
	}
	
}
