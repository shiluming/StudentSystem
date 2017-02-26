package com.sise.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.sise.constant.APPCONFIG;
import com.sise.constant.UserType;
import com.sise.dao.TeacherDao;
import com.sise.model.Teacher;

@Controller
@RequestMapping("/tea")
public class TeacherController {

	
	@Autowired
	private TeacherDao teacherDao;
	
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
	 * ������Ϣҳ��
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
	 * δͨ��������Ϣ����
	 * @return
	 */
	@RequestMapping("/noPassList")
	public ModelAndView noPassList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("page/index");
		mav.addObject("mainPage","doAudit_noPass.jsp");
		return mav;
	}
	
	@RequestMapping("/addTeacher")
	public ModelAndView goAddTeacher(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mainPage","addTeacher.jsp");
		mav.setViewName("page/index");
		return mav;
	}
	
	/**
	 * �����ʦ��Ϣ
	 * @param request
	 * @param teacher
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/saveTeacher")
	@ResponseBody
	public String saveTeacher(HttpServletRequest request,Teacher teacher,@RequestParam(value="type",required=false)String type) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		if(type!=null) {//����
			String code = teacher.getCode();
			Teacher dbTeacher = teacherDao.findById(teacher);
			teacher.setId(dbTeacher.getId());
			//������Ϣ���£�
			dbTeacher.setAge(teacher.getAge());
			dbTeacher.setEmail(teacher.getEmail());
			dbTeacher.setSex(teacher.getSex());
			dbTeacher.setTell(teacher.getTell());
			dbTeacher.setAddress(teacher.getAddress());
			try {
				teacherDao.update(dbTeacher);
			} catch (Exception e) {
				System.out.println("����ʧ��");
				result.put("success", false);
				result.put("data", "");
			}
			result.put("success", true);
			return JSON.toJSONString(result);
			
		} else {//����
			//����Զ����ɣ���ְʱ��
			int genId = teacherDao.genernatorId();
			teacher.setCode(APPCONFIG.TEA_SUFFIX+""+String.valueOf(genId));
			teacher.setJoinTime(new Date());
			teacher.setPassword(APPCONFIG.DEFAULT_PASSWORD);
			teacher.setPrivilege(UserType.U_TEACHER);
			try{
				teacherDao.save(teacher);
			}catch(Exception e) {
				System.out.println("�����ʦ��Ϣʧ�ܣ�������");
				result.put("success", false);
				result.put("data", "�����ʦ��Ϣʧ�ܣ�������");
			}
		}
		
		result.put("success", true);
		result.put("data", "����ɹ�");
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/delTea")
	@ResponseBody
	public String delTea(HttpServletRequest request,@RequestParam(value="id")String code) {
		Map<String, Object> result = new HashMap<String, Object>();
		Teacher cls = new Teacher();
		cls.setCode(code);
		try {
			teacherDao.deleteByCode(code);//
		} catch(Exception e){
			System.out.println("ɾ����ʦʧ��");
			result.put("success", false);
			result.put("data","");
		}
		result.put("success", true);
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("/goEditTeacher")
	public ModelAndView goEditTEacher(@RequestParam(value="id")String code) {
		ModelAndView mav = new ModelAndView();
		Teacher cls = new Teacher();
		cls.setCode(code);;
		try {
			cls = teacherDao.findById(cls);
			mav.addObject("teaObj",cls);
		} catch (Exception e) {
			System.out.println("��ȡ��ʦʧ��");
		}
		mav.addObject("mainPage","editTeacher.jsp");
		mav.setViewName("page/index");
		return mav;
	}
}
