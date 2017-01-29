package com.sise.dao;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sise.model.Student;
import com.sise.model.Teacher;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class TeacherDaoTest {

	@Autowired
	private TeacherDao teacherDao;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testSaveTeacher() {
		for(int i=0;i<100;i++) {
			Teacher t = new Teacher();
			t.setCode("A100000"+i);
			t.setPassword("123456");
			t.setName("华软计算机系老师 "+i);
			t.setJoinTime(new Date());
			t.setSex("男");
			try {
				teacherDao.save(t);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Test
	public void testSearchTeacher() {
		Teacher cls = new Teacher();
		cls.setName("老师");
		//cls.setCode("");
		try {
			List<Teacher> list = teacherDao.search(cls);
			for(Teacher s : list) {
				System.out.println(s.getName());
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testDeleteTeacher() throws Exception{
		Teacher s = new Teacher();
		s.setId(100);
		teacherDao.delete(s);
	}

	@Test
	public void testUpdateTeacher() throws Exception{
		Teacher cls = new Teacher();
		cls.setName("是路名");
		cls.setId(1);
		teacherDao.update(cls);
	}

	@Test
	public void testFindByIdTeacher() throws Exception{
		Teacher cls = new Teacher();
		cls.setId(1);
		Teacher t = teacherDao.findById(cls);
		System.out.println(t.getName());
	}

}
