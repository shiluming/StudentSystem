package com.sise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/tea")
public class TeacherController {

	
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
	
	/**
	 * 个人信息页面
	 * @param id
	 * @return
	 */
	@RequestMapping("/personal")
	public ModelAndView personal(@RequestParam(value="id",required=false)Integer id)
	{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("page/index");
		mav.addObject("mainPage","personal_teacher.jsp");
		return mav;
	}
	
	@RequestMapping("/doAudit")
	public ModelAndView requestDeal() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("page/index");
		mav.addObject("mainPage","doAudit.jsp");
		return mav;
	}
	
	/**
	 * 未通过申请信息管理
	 * @return
	 */
	@RequestMapping("/noPassList")
	public ModelAndView noPassList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("page/index");
		mav.addObject("mainPage","doAudit_noPass.jsp");
		return mav;
	}
	
}
