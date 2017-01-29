package com.sise.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ResponseUtils {

	public static void write(Object o,HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(o.toString());
		out.flush();
		out.close();
	}
}
