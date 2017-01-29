package com.sise.dao;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sise.model.Student;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class StudentDaoTest {

	
	@Autowired
	private StudentDao studentDao;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testSaveStudent() {
		for(int i=1;i<99;i++) {
			Student student = new Student();
			student.setCode("1340"+i);
			student.setPassword("123456");
			student.setName("华软计算机系学生 "+i);
			student.setJoinTime(new Date());
			student.setSex("男");
			try {
				studentDao.save(student);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}

	@Test
	public void testSearchStudent() {
		Student cls = new Student();
		cls.setName("学生1s");
		cls.setCode("1240702160");
		try {
			List<Student> list = studentDao.search(cls);
			for(Student s : list) {
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Test
	public void testDeleteStudent() throws Exception{
		Student s = new Student();
		s.setId(100);
		studentDao.delete(s);
	}

	@Test
	public void testUpdateStudent() throws Exception{
		Student cls = new Student();
		cls.setName("是路名");
		cls.setId(1);
		studentDao.update(cls);
	}
	
	@Test
	public void testFindById() throws Exception {
		Student cls = new Student();
		cls.setId(1);
		Student s = studentDao.findById(cls);
		System.out.println(s);
	}

}
