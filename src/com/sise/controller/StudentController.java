package com.sise.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.sise.dao.GradeDao;
import com.sise.dao.StudentDao;
import com.sise.dao.TeacherDao;
import com.sise.model.AuditVO;
import com.sise.model.Grade;
import com.sise.model.Student;
import com.sise.model.Teacher;
import com.sise.utils.ResponseUtils;

@Controller
@RequestMapping("/stu")
public class StudentController {

	
	@Autowired
	private GradeDao gradeDao;
	
	@Autowired
	private TeacherDao teacherDao;
	
	@Autowired
	private StudentDao studentDao;
	
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
	 * @throws Exception 
	 */
	@RequestMapping("/personal")
	public ModelAndView personal(@RequestParam(value="id",required=false)Integer id,HttpServletRequest request) throws Exception
	{
	
		Student loginUser = (Student)request.getSession().getAttribute("loginUser");
		int gradeId = loginUser.getGrade();
		Grade cls = new Grade();
		cls.setId(gradeId);
		Grade stuGrade = gradeDao.findById(cls);
		
		Integer teacherId = loginUser.getMasterTeacher();
		Teacher stuTeacher = teacherDao.findById(teacherId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("page/index");
		mav.addObject("loginUser",loginUser);
		mav.addObject("stuGrade",stuGrade);
		mav.addObject("stuTeacher",stuTeacher);
		mav.addObject("mainPage","personal.jsp");
		return mav;
	}
	
	@RequestMapping("/audit")
	public String requestAudit(HttpServletRequest request,AuditVO auditVO) {
		System.out.println("ss");
		return null;
	}
	
	@RequestMapping("/requestDeal")
	public ModelAndView requestDeal() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("page/index");
		mav.addObject("mainPage","requestDeal.jsp");
		return mav;
	}
	
	/**
	 * 未通过申请信息管理
	 * @return
	 */
	@RequestMapping("/noPass")
	public ModelAndView noPass() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("page/index");
		mav.addObject("mainPage","noPass.jsp");
		return mav;
	}
	
	/**
	 * 学生列表显示
	 * @param offset
	 * @param limit
	 * @param search
	 * @param response
	 */
	@RequestMapping("/getStuListByCls")
	public void getStuList(@RequestParam(value="offset")Integer offset
			,@RequestParam(value="limit")Integer limit,@RequestParam(value="search",required=false)String search
			,HttpServletResponse response) {
			try {
				List<Student> list = studentDao.findByLimit(offset, limit,search);
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
				JSONObject obj = new JSONObject();
				obj.put("total", count);
				obj.put("rows", list);
				ResponseUtils.write(obj, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
}
