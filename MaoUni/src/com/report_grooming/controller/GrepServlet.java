package com.report_grooming.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.report_grooming.model.GrepService;


public class GrepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if("addGreport".equals(action)) {
			Integer apmId = new Integer(req.getParameter("apmId"));
			Integer memId = new Integer(req.getParameter("memId"));
			Integer groomerId = new Integer(req.getParameter("groomerId"));
			String content = req.getParameter("content");
			
			GrepService grepSvc = new GrepService();
			Integer completeNum = null;

			System.out.println("apmId: " + action);
			System.out.println("memId: " + action);
			System.out.println("groomerId: " + action);
			System.out.println("content: " + action);
			
			
			
			
			try {
				completeNum = grepSvc.addGreport(apmId, memId, groomerId, content);
				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				
				out.write(completeNum.toString());
				
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
			
		}
System.out.println("action: " + action);		
		if("update".equals(action)) {
			System.out.println("rptId: " + req.getParameter("rptId"));			
			System.out.println("rptStatus: " + req.getParameter("rptStatus"));			
			System.out.println("groomerId: " + req.getParameter("groomerId"));			
			Integer rptId = new Integer(req.getParameter("rptId"));
			Integer rptStatus = new Integer(req.getParameter("rptStatus"));
			Integer groomerId = new Integer(req.getParameter("groomerId"));
			String message = "";
			GrepService grepSvc = new GrepService();
			try {
				message += grepSvc.update(rptId, rptStatus, groomerId);
				
				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				
				PrintWriter out = res.getWriter();
				out.write(message);
				
				
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
		
		
		
		
	}

}
