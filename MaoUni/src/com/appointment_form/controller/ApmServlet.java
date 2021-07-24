package com.appointment_form.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.addressGeo.model.GeocodingService;
import com.appointment_form.model.ApmService;
import com.appointment_form.model.ApmVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize =  5 * 5 * 1024 * 1024)
public class ApmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		res.setContentType("text/html; charset=UTF-8");
		
		if("addAppointment".equals(action)) {
			Integer memId = new Integer(req.getParameter("memId"));
			Integer groomerId = new Integer(req.getParameter("groomerId"));
			Integer pid = new Integer(req.getParameter("pid"));
			Integer schId = new Integer(req.getParameter("schId"));
			Integer stime = new Integer(req.getParameter("stime"));
			Integer etime = new Integer(req.getParameter("etime"));
			Integer total = new Integer(req.getParameter("total"));
			String address = req.getParameter("address");
			
			List<Integer> svcIdList = new ArrayList<Integer>();
			String[] list = req.getParameterValues("svcId");
			for(String i:list) {
				Integer svcId = new Integer(i);
				svcIdList.add(svcId);
			}
			
			try {
				// add appointment into mySQL
				ApmService apmSvc = new ApmService();
				apmSvc.addAppointment(memId, groomerId, pid, schId, stime, etime, total, svcIdList);
				
				// add geocode into Redis
				GeocodingService geocodingSvc = new GeocodingService();
				geocodingSvc.addGeo(memId, address);
				
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
			
		}
		
		if("getAll".equals(action)) {
			Map<String, String[]> map = req.getParameterMap();
			ApmService apmSvc = new ApmService();
			try {
				List<ApmVO> list = apmSvc.getAll(map);
				String apmList = new JSONArray(list).toString();
				PrintWriter out = res.getWriter();
				out.print(apmList);
			} catch (IOException e) {
				e.printStackTrace(System.err);
			}
			
		}
		
		if("updateStatus".equals(action)) {
			Integer apmId = new Integer(req.getParameter("apmId"));
			Integer apmStatus = new Integer(req.getParameter("apmStatus"));
			ApmService apmSvc = new ApmService();
			try {
				apmSvc.updateStatus(apmId, apmStatus);
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
	
		if("addComment".equals(action)) {			
			Integer apmId = new Integer(req.getParameter("apmId"));
			Integer groomerId = new Integer(req.getParameter("groomerId"));
			Integer star = new Integer(req.getParameter("star"));
			String apmComment = req.getParameter("apmComment");
			InputStream photoin = req.getPart("photo").getInputStream();
			byte[] photo = new byte[photoin.available()];
			photoin.read(photo);
			
			Integer completeNum = null;
			
			try {
				ApmService apmSvc = new ApmService();
				completeNum = apmSvc.addComment(apmId, groomerId, star, apmComment, photo);
				
				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.write(completeNum.toString());
				
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
			
		}
	
		if("cancel".equals(action)) {
			Integer apmId = new Integer(req.getParameter("apmId"));
			Integer apmStatus = new Integer(req.getParameter("sapmStatus"));
			ApmService apmSvc = new ApmService();
			Integer completeNum = apmSvc.updateStatus(apmId, apmStatus);
			
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(completeNum.toString());
			
		}
		
		
	}
}
