package com.sise.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
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
	/**
	 * 教师跳转
	 * @return
	 */
	@RequestMapping("/goTea")
	public ModelAndView goTea() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mainPage","teacher.jsp");
		
		mav.setViewName("page/index");
		return mav;
	}
	/**
	 * 学生跳转
	 * @return
	 */
	@RequestMapping("/goClass")
	public ModelAndView goClass() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mainPage","class.jsp");
		
		mav.setViewName("page/index");
		return mav;
	}
	/**
	 * 学生编辑
	 * @param id
	 * @return
	 */
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
	/**
	 * 学生删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/goDelUser")
	@ResponseBody
	public String goDelUser(@RequestParam(value="id",required=false)Integer id) {
		Map<String, Object> json = new HashMap<String, Object>();
		if(id!=null) {
			Student cls = new Student();
			cls.setId(id);
			try {
				Student result = studentDao.findById(cls);
				studentDao.delete(result);
				json.put("success", true);
				json.put("data", "");
			} catch (Exception e) {
				json.put("success", false);
				e.printStackTrace();
			}
		}
		return JSON.toJSONString(json);
	}
	/**
	 * 教师删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/goDelTea")
	@ResponseBody
	public String goDelTea(@RequestParam(value="id",required=false)String id) {
		Map<String, Object> json = new HashMap<String, Object>();
		if(id!=null) {
			Teacher cls = new Teacher();
			cls.setCode(id);
			try {
				Teacher result = teacherDao.findById(cls);
				teacherDao.delete(result);
				json.put("success", true);
				json.put("data", "");
			} catch (Exception e) {
				json.put("success", false);
				e.printStackTrace();
			}
		}
		return JSON.toJSONString(json);
	}
	
	/**
	 * 班级删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/goDelClass")
	@ResponseBody
	public String goDelClass(@RequestParam(value="id",required=false)Integer id) {
		Map<String, Object> json = new HashMap<String, Object>();
		if(id!=null) {
			Grade cls = new Grade();
			cls.setId(id);
			try {
				Grade result = gradeDao.findById(cls);
				gradeDao.delete(result);
				json.put("success", true);
				json.put("data", "");
			} catch (Exception e) {
				json.put("success", false);
				e.printStackTrace();
			}
		}
		return JSON.toJSONString(json);
	}
	/**
	 * 学生列表显示
	 * @param offset
	 * @param limit
	 * @param search
	 * @param response
	 */
	@RequestMapping("/getStuList")
	public void getStuList(@RequestParam(value="offset")Integer offset
			,@RequestParam(value="limit")Integer limit,@RequestParam(value="search",required=false)String search
			,HttpServletResponse response,@RequestParam(value="classId",required=false)Integer classId) {
			try {
				List<Student> list = studentDao.findByLimit(offset, limit,search);
				if(classId!=null) {
					list = studentDao.findByLimit(offset, limit, search, classId);
				}
				//为了填充年级和班级,班主任信息所做的
				for(int i=0;i<list.size();i++) {
					int masterId = list.get(i).getMasterTeacher();
					Teacher tcls = new Teacher();
					tcls.setId(masterId);
					tcls = teacherDao.findById(masterId);
					if(tcls!=null) {
						list.get(i).setMasterTeacherText(tcls.getName());
					}
					
					int gradeId = list.get(i).getGrade();
					Grade grcls = new Grade();
					grcls.setId(gradeId);
					grcls = gradeDao.findById(grcls);
					if(grcls!=null) {
						list.get(i).setGradeText(grcls.getGrade()+"/"+grcls.getGradeName());
					}
				}
				Integer count = studentDao.count();
				if(classId!=null || search!=null) {
					count=studentDao.count(search,classId);
				}
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
	 * 教师列表显示
	 * @param offset
	 * @param limit
	 * @param response
	 */
	@RequestMapping("/getTeaList")
	public void getTeaList(@RequestParam(value="offset")Integer offset
			,@RequestParam(value="limit")Integer limit,@RequestParam(value="search",required=false)String search
			,HttpServletResponse response) {
			try {
				List<Teacher> list = teacherDao.findByLimit(offset, limit,search);
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
	/**
	 * admin 用户列表显示
	 * @param offset
	 * @param limit
	 * @param response
	 */
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
	
	/**
	 * 学生列表显示
	 * @param offset
	 * @param limit
	 * @param response
	 */
	@RequestMapping("/getClassList")
	public void getClassList(@RequestParam(value="offset")Integer offset
			,@RequestParam(value="limit")Integer limit,@RequestParam(value="search",required=false)String search
			,HttpServletResponse response) {
			try {
				List<Grade> list = gradeDao.findByLimit(offset, limit,search);
				for(int i=0;i<list.size();i++) {
					int tmpId = list.get(i).getTeacher();
					Teacher tmpT = new Teacher();
					tmpT.setId(tmpId);;
					tmpT = teacherDao.findById(tmpId);
					if(tmpT==null) {
						list.get(i).setTeacherName("");
					}else {
						list.get(i).setTeacherName(tmpT.getName());
					}
					
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
	 * 保存学生
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
