package com.sise.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AppContent {
	
	private static ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");

	/**
	 * ªÒ»° bean
	 * @param id
	 * @return
	 */
	public static Object getBean(String id) {
		return ac.getBean(id);
	}
	public static void main(String[] args) {
		System.out.println(getBean("dataSource"));
	}
	
	
	
}
