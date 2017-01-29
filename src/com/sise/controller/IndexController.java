package com.sise.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.sise.constant.UserType;
import com.sise.dao.AdminDao;
import com.sise.dao.StudentDao;
import com.sise.dao.TeacherDao;
import com.sise.model.Admin;
import com.sise.model.Student;
import com.sise.model.Teacher;
import com.sise.model.User;
import com.sise.utils.ResponseUtils;

/**
 * Index 控制器
 * @author rola
 * 2016年12月17日
 */
@Controller
@RequestMapping("/index")
public class IndexController {
	
	@Resource
	private AdminDao adminDao;
	
	@Resource
	private TeacherDao teacherDao;
	
	@Resource
	private StudentDao studentDao;

	
	
	@RequestMapping("/goIndex")
	public ModelAndView goIndex() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("page/sign-in");
		return mav;
	}
	@RequestMapping("/login")
	public ModelAndView login(User user, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(UserType.U_ADMIN.equals(user.getRola())) {
			Admin cls = new Admin();
			cls.setUser(user.getName());
			cls.setPassword(user.getPassword());
			cls.setAdmin(user.getRola());
			Admin result = adminDao.login(cls);
			if(result!=null) {
				request.getSession().setAttribute("loginUser", result);
			}else {
				mav.addObject("errorMsg", "账号或者密码错误");
				mav.setViewName("page/sign-in");
				return mav;
			}
			mav.addObject("mainPage","rigth.jsp");
		} else if(UserType.U_TEACHER.equals(user.getRola())) {
			
			Teacher cls = new Teacher();
			cls.setCode(user.getName());
			cls.setPassword(user.getPassword());
			Teacher result = teacherDao.login(cls);
			if(result!=null) {
				request.getSession().setAttribute("loginUser", result);
			}else {
				mav.addObject("errorMsg", "工号或者密码错误");
				mav.setViewName("page/sign-in");
				return mav;
			}
			mav.addObject("mainPage","temp.jsp");
		} else if(UserType.U_STUDENT.equals(user.getRola())) {
			Student cls = new Student();
			cls.setCode(user.getName());
			cls.setPassword(user.getPassword());
			Student result = studentDao.login(cls);
			if(result!=null) {
				request.getSession().setAttribute("loginUser", result);
			}else {
				mav.addObject("errorMsg", "学号或者密码错误");
				mav.setViewName("page/sign-in");
				return mav;
			}
			mav.addObject("mainPage","temp.jsp");
		} else {
			mav.addObject("errorMsg", "出现未知错误,请联系管理员");
			mav.setViewName("page/sign-in");
			return mav;
		}
		mav.setViewName("page/index");
		return mav;
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("loginUser");
		return "redirect:/page/sign-in.jsp";
	}
	
	@RequestMapping("/tt")
	public void table(HttpServletResponse response,HttpServletRequest request,@RequestParam(value="limit")Integer limit
			,@RequestParam(value="offset")Integer offset){
		System.out.println("offset : " + offset + "  Limit : " + limit);
		JSONObject result = new JSONObject();
		List<Admin> list =  adminDao.findByLimit(1, 20);
		result.put("rows", list);
		result.put("total", list.size());
		try {
			ResponseUtils.write(result, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
