package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Declaration;

public interface DeclarationManageService {

	// 신고 리스트
	public List<Declaration> listDeclarations(Map<String, Object> map);
	
	// 페이지 개수
	public int dataCount(Map<String, Object> map);
	
	// 숨김여부, showClass 변경
	public void updateResult(Declaration dto);
	
	// 신고하면 showClass 변경
	public void updateShowClass(Long classNum);		
}
