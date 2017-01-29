package com.sise.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sise.dao.GradeDao;
import com.sise.model.Grade;

@Controller
@RequestMapping("/cls")
public class ClassController {

	
	@Autowired
	private GradeDao gradeDao;
	
	@RequestMapping("/goSearch")
	public ModelAndView goSearch() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mainPage","search.jsp");
		mav.setViewName("page/index");
		return mav;
	}
	
	@RequestMapping("/searchList")
	public ModelAndView searchList(@RequestParam(value= "searchKey",required=false)String searchKey) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mainPage","searchList.jsp");
		mav.setViewName("page/index");
		return mav;
	}
	
	@RequestMapping(value = "/clsInfo",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getCls() {
		JSONObject o = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<Grade> list = gradeDao.search(new Grade());
			
			map.put("result", true);
			map.put("data", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return JSON.toJSONString(map);
	}
	
}
