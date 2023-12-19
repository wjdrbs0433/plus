package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Lesson;

@Mapper
public interface LessonMapper {
	public List<Lesson> allLessonList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public List<Lesson> listMainCategory();
	public List<Lesson> listSubCategory(long mainNum);
	public Lesson findById(long classNum);
	public List<Lesson> listLessonPhoto(long classNum);
	
	public void insertLessonLike(Map<String, Object> map) throws SQLException;  // 게시글 좋아요 추가
	public void deleteLessonLike(Map<String, Object> map) throws SQLException;  // 게시글 좋아요 삭제
	public int lessonLikeCount(long classNum);  // 게시글 좋아요 개수
	public Lesson userLessonLiked(Map<String, Object> map);  // 게시글 좋아요 여부
}
