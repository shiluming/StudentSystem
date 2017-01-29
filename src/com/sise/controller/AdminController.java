package com.sise.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.sise.dao.AdminDao;
import com.sise.dao.GradeDao;
import com.sise.dao.StudentDao;
import com.sise.dao.TeacherDao;
import com.sise.model.Admin;
import com.sise.model.Grade;
import com.sise.model.Student;
import com.sise.model.Teacher;
import com.sise.utils.ResponseUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private StudentDao studentDao;
	@Autowired
	private TeacherDao teacherDao;
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private GradeDao gradeDao;
	
	@RequestMapping("/goStu")
	public ModelAndView goStu() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mainPage","student.jsp");
		
		mav.setViewName("page/index");
		return mav;
	}
	
	@RequestMapping("/goTea")
	public ModelAndView goTea() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mainPage","teacher.jsp");
		
		mav.setViewName("page/index");
		return mav;
	}
	@RequestMapping("/goClass")
	public ModelAndView goClass() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mainPage","class.jsp");
		
		mav.setViewName("page/index");
		return mav;
	}
	
	@RequestMapping("/goEditUser")
	public ModelAndView goEditUser(@RequestParam(value="id",required=false)Integer id) {
		ModelAndView mav = new ModelAndView();
		if(id!=null) {
			Student cls = new Student();
			Grade g = new Grade();
			cls.setId(id);
			try {
				Student result = studentDao.findById(cls);
				mav.addObject("stu",result);
				g.setId(result.getGrade());
				Grade gres = gradeDao.findById(g);
				mav.addObject("grade",gres);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mav.addObject("mainPage","addUser.jsp");
		
		mav.setViewName("page/index");
		return mav;
	}
	
	
	@RequestMapping("/getStuList")
	public void getStuList(@RequestParam(value="offset")Integer offset
			,@RequestParam(value="limit")Integer limit,@RequestParam(value="search",required=false)String search
			,HttpServletResponse response) {
			try {
				List<Student> list = studentDao.findByLimit(offset, limit,search);
				Integer count = studentDao.count();
				JSONObject obj = new JSONObject();
				obj.put("total", count);
				obj.put("rows", list);
				ResponseUtils.write(obj, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
	
	
	@RequestMapping("/getTeaList")
	public void getTeaList(@RequestParam(value="offset")Integer offset
			,@RequestParam(value="limit")Integer limit
			,HttpServletResponse response) {
			try {
				List<Teacher> list = teacherDao.findByLimit(offset, limit);
				Integer count = teacherDao.count();
				JSONObject obj = new JSONObject();
				obj.put("total", count);
				obj.put("rows", list);
				ResponseUtils.write(obj, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
	@RequestMapping("/getAdminList")
	public void getAdminList(@RequestParam(value="offset")Integer offset
			,@RequestParam(value="limit")Integer limit
			,HttpServletResponse response) {
			try {
				List<Admin> list = adminDao.findByLimit(offset, limit);
				Integer count = teacherDao.count();
				JSONObject obj = new JSONObject();
				obj.put("total", count);
				obj.put("rows", list);
				ResponseUtils.write(obj, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
	@RequestMapping("/getClassList")
	public void getClassList(@RequestParam(value="offset")Integer offset
			,@RequestParam(value="limit")Integer limit
			,HttpServletResponse response) {
			try {
				List<Grade> list = gradeDao.findByLimit(offset, limit);
				for(int i=0;i<list.size();i++) {
					int tmpId = list.get(i).getTeacher();
					Teacher tmpT = new Teacher();
					tmpT.setId(tmpId);;
					tmpT = teacherDao.findById(tmpT);
					list.get(i).setTeacherName(tmpT.getName());
				}
				Integer count = gradeDao.count();
				JSONObject obj = new JSONObject();
				obj.put("total", count);
				obj.put("rows", list);
				ResponseUtils.write(obj, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	/**
	 */
	@RequestMapping("/saveStu")
	public ModelAndView saveStu() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mainPage","addUser.jsp");
		
		mav.setViewName("page/index");
		return mav;
	}
	
	/**
	 */
	@RequestMapping("/delStu")
	public ModelAndView delStu() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mainPage","addUser.jsp");
		
		mav.setViewName("page/index");
		return mav;
	}
	
}
