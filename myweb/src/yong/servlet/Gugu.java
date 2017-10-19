package yong.servlet;

import java.io.*;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Gugu extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		gugudan(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		gugudan(req, resp);
	}
	//HttpServletRequest = 요청객체, HttpServletResponse = 응답객체
	
	protected void gugudan(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8"); //브라우저가 해당 문서를 html형식으로 인식
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head><title>");
		pw.println("구구단!");
		pw.println("</title></head>");
		pw.println("<body>");
		pw.println("<h2 align=center>구구단</h2>");
		pw.println("<form name=fm>");
		pw.println("<table border=1 cellspacing=0 width=500 heigth=500 align=center>");
		pw.println("<tr>");
		for(int i = 2; i <= 9; i++) {
			pw.println("<td align=center>"+i+"단</td>");
		}
		pw.println("</tr>");
		for(int i = 1; i <= 9; i++) {
			pw.println("<tr>");
			for(int j = 2; j <= 9; j++) {
				pw.println("<td align=center>"+j+"*"+i+"="+(i*j)+"</td>");
			}
			pw.println("</tr>");
		}
		pw.println("</table>");
		pw.println("</body></html>");
		
		pw.close(); //자원은 닫아야함
	}
}
