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

import com.sise.model.Admin;
import com.sise.model.Teacher;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class AdminDaoTest {

	@Autowired
	private AdminDao adminDao;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testSaveAdmin() {
		
		Admin t = new Admin();
		t.setUser("XXOOsdfsdfsdfsdfsdf");
		t.setPassword("123456");
		t.setAdmin("admin");
		t.setName("测试管理员11sdfsdfsdfsdfs");
		try {
			adminDao.save(t);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int i=0;i<1;i++) {
			
		}
	}

	@Test
	public void testSearchAdmin() throws Exception{
		Admin cls = new Admin();
		cls.setUser("XXOO");
		//cls.setCode("");
			List<Admin> list = adminDao.search(cls);
			for(Admin s : list) {
				System.out.println(s.toString());
			}
	}

	@Test
	public void testDeleteAdmin() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateAdmin() throws Exception {
		Admin cls = new Admin();
		cls.setUser("admin");
		cls.setPassword("admin");
		cls.setId(1);
		cls.setName("是路名");
		adminDao.update(cls);
	}

	@Test
	public void testFindByIdAdmin() {
		fail("Not yet implemented");
	}

}
