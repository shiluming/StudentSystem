package com.sise.dao;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class GradeDaoTest {

	@Autowired
	private GradeDao gradeDao;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testCount() {
		fail("Not yet implemented");
	}

	@Test
	public void testSaveGrade() {
		String[] cls = new String[]{"web开发","物联网开发","计算机科学与技术"};
		for(String s : cls) {
			
		}
	}

	@Test
	public void testSearchGrade() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteGrade() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateGrade() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindByIdGrade() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindByLimitIntegerInteger() {
		fail("Not yet implemented");
	}

}
