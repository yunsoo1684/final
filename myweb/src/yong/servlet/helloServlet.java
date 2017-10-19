package yong.servlet;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class helloServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) //req = 요청 // resp = 응답
	throws ServletException, IOException 
	{
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
	{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head><title>");
		pw.println("이것은 서블릿!");
		pw.println("</title></head>");
		pw.println("<body>");
		pw.println("<h2>나의 첫 서블릿!!</h2>");
		Calendar now = Calendar.getInstance();
		int y = now.get(Calendar.YEAR);
		int m = now.get(Calendar.MONTH) + 1;
		int d = now.get(Calendar.DATE);
		pw.println("<h2>"+y+"년 "+m+"월 "+d+"일</h2>");
		pw.println("</body></html>");
		pw.close();
	}
}