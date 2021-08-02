package com.adopt_imf.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adopt_imf.model.ImfService;
import com.adopt_imf.model.ImfVO;
import com.adopt_mechanism.model.MechanismService;
import com.adopt_mechanism.model.MechanismVO;
import com.backstage_staff.model.StaffService;
import com.backstage_staff.model.StaffVO;
import com.message.model.MessageService;
import com.message.model.MessageVO;
import com.tracking_adopt.model.TrackingService;
import com.tracking_adopt.model.TrackingVO;

/**
 * Servlet implementation class ImfServlet
 */
@WebServlet("/MaoUni/ImfServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ImfServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getAll".equals("action")) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer id = new Integer(req.getParameter("id"));
				System.out.println(id);
				ImfService imfSvc = new ImfService();
				ImfVO imfVO = (ImfVO) imfSvc.getAll();

				req.setAttribute("ImfVO", "ImfVO");
				String url = "";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("�瘜�����" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("");
				failureView.forward(req, res);
			}
		}
			HttpSession session = req.getSession();
			Vector<ImfVO> track = (Vector<ImfVO>) session.getAttribute("id");
			
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			try {
				System.out.println(action);
				
				Integer id = new Integer(req.getParameter("id"));
				Integer det = new Integer(req.getParameter("det"));
				System.out.print(id);				
				
				TrackingService trackingSvc = new TrackingService();
				Integer trackingVO = trackingSvc.addTracking(id, det);

				req.setAttribute("TrackingVO", trackingVO);
				String url = "/front-end/imf/allImf.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/staff/wrong.jsp");
				failureView.forward(req, res);
			}
		}
		if("inserImf".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
	    	req.setAttribute("errorMsgs", errorMsgs);
				System.out.println(action);
	    	try {	
				
				Integer adopt = new Integer(req.getParameter("adopt"));
				System.out.println(adopt);
				Integer mech = new Integer(req.getParameter("mech"));
				System.out.println(mech);
				String name = new String(req.getParameter("name"));
				System.out.println(name);
				Integer year = new Integer(req.getParameter("year"));
				System.out.println(year);
				String sit = new String(req.getParameter("sit"));
				System.out.println(sit);
				
				InputStream ImfPhoto = req.getPart("photo").getInputStream();
				byte[] photo = new byte[ImfPhoto.available()];
				ImfPhoto.read(photo);
				ImfPhoto.close();
				
				ImfVO imfVO= new ImfVO();
				imfVO.setPhoto(photo);
				imfVO.setAdopt(adopt);
				imfVO.setMech(mech);
				imfVO.setName(name);
				imfVO.setYear(year);
				imfVO.setSit(sit);
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("ImfVo", imfVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/adopt/add_adopt.jsp");
					failureView.forward(req, res);
				}
				
				ImfService ImfSvc = new ImfService();
				imfVO = ImfSvc.addImf(adopt, mech, name, year, sit, photo);

				req.setAttribute("imfVO", imfVO);
				String url ="/front-end/adopt/add_adopt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
		
			}catch(Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/adopt/add_adopt.jsp");
				failureView.forward(req, res);
			}
		}
		if("getOnecheck".equals("action")) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
			Integer id=new Integer(req.getParameter("id"));
			Integer adopt= new Integer(req.getParameter("adopt"));
			req.setAttribute("id", id);
			req.setAttribute("adopt", adopt);
			
			ImfService imfSvc = new ImfService();
			ImfVO imfVO = imfSvc.getOneImf(id);

			req.setAttribute("imfVO", imfVO);
			
			String url ="/front-end/adopt/getonetracking.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		
		} catch (Exception e) {
			errorMsgs.add("無法取得資料" + e.getMessage());
			RequestDispatcher failureView = req.getRequestDispatcher("/front-end/staff/adop_home.jsp");
			failureView.forward(req, res);
		}
	}
		

//		if("getVariety".equals(action)) {
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			try {
//			Integer id = new Integer(req.getParameter("id"));
//			System.out.println(id);
//			String Variety = new String(req.getParameter("Variety"));
//			VarietyService VarietySvc = new VarietyService();
//			
//			MechanismVO mechanismVO = mechanismSvc.getOneMechanism(id);
//			
//			req.setAttribute("mechanismVO", "mechanismVO");
//			String url = "";
//			RequestDispatcher successView = req.getRequestDispatcher(url);
//			 successView.forward(req, res);
//		}catch(Exception e) {
//			e.printStackTrace();
//			errorMsgs.add("請輸入正確"+e.getMessage());
//			RequestDispatcher failureView = req.getRequestDispatcher("");
//			failureView.forward(req, res);
//		}
	}
	


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

}
