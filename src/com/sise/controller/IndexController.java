package com.sise.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sise.constant.UserType;
import com.sise.model.User;
/**
 * Index 控制器
 * @author rola
 * 2016年12月17日
 */
@Controller
@RequestMapping("/index")
public class IndexController {
	
	
	@RequestMapping("/goIndex")
	public ModelAndView goIndex() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("loginUser", "shiluming");
		mav.setViewName("page/sign-in");
		return mav;
	}
	@RequestMapping("/login")
	public ModelAndView login(User user, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(UserType.U_ADMIN.equals(user.getRola())) {
			
		} else if(UserType.U_TEACHER.equals(user.getRola())) {
			
		} else if(UserType.U_STUDENT.equals(user.getRola())) {
			
		} else {
			
		}
		mav.addObject("loginUser", "shiluming");
		mav.setViewName("page/index");
		return mav;
	}
}
