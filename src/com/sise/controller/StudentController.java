package com.sise.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sise.constant.APPCONFIG;
import com.sise.dao.AuditDao;
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
	
	@Autowired
	private AuditDao auditDao;
	
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
	public ModelAndView requestAudit(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,AuditVO auditVO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("page/index");
		mav.addObject("mainPage","requestDeal.jsp");
		Map<String, Object> map = new HashMap<String, Object>();
		File targetFile = null;
		//文件保存在
		if(file.getSize()>0) {
			String fileName = file.getOriginalFilename();
			targetFile = new File(APPCONFIG.AWARD_IMG_PATH+fileName);
			try {
				file.transferTo(targetFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			map.put("success", false);
			map.put("data", "请上传相关文件");
			mav.addObject("msg",map);
			return mav;
		}
		Student stu = (Student) request.getSession().getAttribute("loginUser");
		auditVO.setImg(targetFile.getPath());
		auditVO.setRequestTime(new Date());
		auditVO.setStatus("审核中");
		auditVO.setStu(stu);
		auditVO.setTell(stu.getTell());
		
		auditVO.setType("奖励");
		try {
			auditDao.save(auditVO);
			map.put("success", true);
			map.put("data", "");
		} catch (Exception e) {
			map.put("success", false);
			map.put("data", "保存失败");
		}
		mav.addObject("msg",map);
		return mav;
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
	
	/**
	 * 审核列表显示
	 * @param offset
	 * @param limit
	 * @param search
	 * @param response
	 */
	@RequestMapping("/getAudit")
	public void getAudit(@RequestParam(value="offset")Integer offset
			,@RequestParam(value="limit")Integer limit,@RequestParam(value="search",required=false)String search
			,HttpServletResponse response,@RequestParam(value="status",required=false)String status) {
			try {
				if(status!=null) {
					if(status.equals("1")) {
						status = APPCONFIG.IN_AUDIT;
					}else if(status.equals("0")) {
						status = APPCONFIG.AUDIT_FIAL;
					}
				}
				List<AuditVO> list = auditDao.findByLimit(offset, limit,search,status);
				for(int i=0;i<list.size();i++) {
					Integer stuId = list.get(i).getStuId();
					Student tmp = studentDao.findById(stuId);
					list.get(i).setStu(tmp);
				}
				Integer count = auditDao.count(status,search);
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
