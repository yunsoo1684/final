package yong.servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletLifeCycle extends HttpServlet
{
	public ServletLifeCycle() 
	{
		System.out.println("1) 생성자가 호출됨!");
	}
	
	@Override
	public void init() throws ServletException 
	{
		System.out.println("2) init() 메소드 호출됨");
	}
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) 
	throws ServletException, IOException 
	{
		System.out.println("3) service() 메소드 호출됨");
	}
	
	@Override
	public void destroy()
	{
		System.out.println("4) destroy() 메소드 호출됨");
	}
}