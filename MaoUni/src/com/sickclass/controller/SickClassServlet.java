package com.sickclass.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sick_class.model.ClassService;
import com.sick_class.model.ClassVO;

@WebServlet("/SickClassServlet")
public class SickClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("GET_ALL_STMT".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			Integer scId = new Integer(req.getParameter("scId").trim());
			ClassService cSvc = new ClassService();
			List<ClassVO> classVO = cSvc.getAll();

			if (classVO == null) {
				errorMsgs.add("沒有這筆資料");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("");
				failureView.forward(req, res);
				return;
			}

			req.setAttribute("classVO", classVO);
			String url = "";
			RequestDispatcher successView = req.getRequestDispatcher(url); //
			successView.forward(req, res);

		}

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String scPain = req.getParameter("scPain").trim();

				ClassVO classVO = new ClassVO();
				classVO.setScPain(scPain);

				ClassService cSvc = new ClassService();
				cSvc.insert(scPain);

				String url = "/member/login.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/login.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
