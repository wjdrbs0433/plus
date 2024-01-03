package com.fa.plus.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.service.CommunityManageService;
import com.fa.plus.admin.service.DeclarationManageService;
import com.fa.plus.admin.service.EventManageService;
import com.fa.plus.admin.service.LessonManageService;
import com.fa.plus.admin.service.MemberManageService;
import com.fa.plus.admin.service.NoticeManageService;
import com.fa.plus.admin.service.PlusManageService;

@Controller
public class MainManageController {
	@Autowired	
	private MemberManageService Memberservice;
	@Autowired
	private PlusManageService Plusservice;
	@Autowired
	private CommunityManageService Communityservice;
	@Autowired
	private LessonManageService Lessonservice;
	@Autowired
	private NoticeManageService Noticeservice;
	@Autowired
	private DeclarationManageService Declarationservice;	
	
	@Autowired
	private EventManageService Eventservice;
		
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String pluslist(
			@RequestParam(defaultValue = "") String enabled,
			Model model) throws Exception {
		int memberDataCount = 0;
		int plusDataCount = 0;
		int communityDataCount = 0;
		int lessonDataCount = 0;
		int noticeDataCount = 0;
		int declarationDataCount = 0;
		int eventDataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enabled", enabled);
		
		memberDataCount = Memberservice.dataCount(map);
		plusDataCount = Plusservice.dataCount(map);
		communityDataCount = Communityservice.dataCount(map);
		map.put("schType", "all");
		map.put("kwd",  "");
		map.put("approvalCode", "1");
		lessonDataCount = Lessonservice.dataCount(map);
		noticeDataCount = Noticeservice.dataCount(map);
		declarationDataCount = Declarationservice.dataCount(map);
		map.put("schType", "all");
		map.put("kwd", "");
		map.put("category", "progress");
		eventDataCount = Eventservice.dataCount(map);
		
		model.addAttribute("memberDataCount", memberDataCount);
		model.addAttribute("plusDataCount", plusDataCount);
		model.addAttribute("communityDataCount", communityDataCount);
		model.addAttribute("lessonDataCount", lessonDataCount);
		model.addAttribute("noticeDataCount", noticeDataCount);
		model.addAttribute("declarationDataCount", declarationDataCount);
		model.addAttribute("eventDataCount", eventDataCount);
		
		return ".adminLayout";
	}

}