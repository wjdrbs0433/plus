package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.EventManage;

public interface EventManageService {

	public void insertEvent(EventManage dto, String pathname) throws Exception;
	public void updateEvent(EventManage dto, String pathname) throws Exception;
	public void deleteEvent(long eventNum, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<EventManage> listEvent(Map<String, Object> map);
	
	public EventManage findById(long eventNum);
	public void updateHitCount(long eventNum) throws Exception;
	public EventManage findByPrev(Map<String, Object> map);
	public EventManage findByNext(Map<String, Object> map);
	
	public List<EventManage> classList(Map<String, Object> map);
	public List<EventManage> eventClassList(Map<String, Object> map);
	public int classDataCount(Map<String, Object> map);
	public void deleteEventClass(long classNum) throws Exception;
	public void insertEventClass(EventManage dto) throws Exception;
	
	public void updateClassPrice(EventManage dto) throws Exception;
}
