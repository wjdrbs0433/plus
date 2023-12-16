package com.fa.plus.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Lesson;
import com.fa.plus.service.LessonService;

@Controller
@RequestMapping("/product/*")
public class LessonController {
	@Autowired
	private LessonService lessonService;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
				@RequestParam(defaultValue = "all") String schType,
				@RequestParam(defaultValue = "") String kwd, 
				@RequestParam(defaultValue = "0") long subNum,
				@RequestParam(defaultValue = "0") long mainNum, HttpServletRequest req, Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 9;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		List<Lesson> listMainCategory = lessonService.listMainCategory();
		/*
		if(mainNum == 0 && listMainCategory.size() != 0) {
			mainNum = listMainCategory.get(0).getMainNum();
		}
		*/
		
		//List<Lesson> listSubCategory = lessonService.listSubCategory(mainNum);
		/*
		if(subNum == 0 && listSubCategory.size() != 0) {
			subNum = listSubCategory.get(0).getSubNum();
		}
		*/
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subNum", subNum);
		map.put("mainNum", mainNum);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = lessonService.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		map.put("mainNum", mainNum);
		map.put("subNum", subNum);
		
		// 글 리스트
		List<Lesson> list = lessonService.allLessonList(map);
		
		String listUrl = cp + "/product/lessonList";
		String articleUrl = cp + "/product/article?page=" + current_page;
		
		String query = "mainNum=" + mainNum + "&subNum=" + subNum;
		
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/product/list?" + query;
			articleUrl = cp + "/product/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("listMainCategory", listMainCategory);
		//model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".product.lessonList";
	}
	
	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(@RequestParam long mainNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Lesson> listSubCategory = lessonService.listSubCategory(mainNum);
		model.put("listSubCategory", listSubCategory);
		return model;
	}
	
	@GetMapping("lessonDetail")
	public String buyRequest(Model model
			) throws Exception{
		
		try {
			
		} catch (Exception e) {
			return "redirect:/product/list";
		}
		
		return ".product.buy";
	}
}