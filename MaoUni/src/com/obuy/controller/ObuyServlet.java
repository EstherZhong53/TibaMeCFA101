package com.obuy.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.commodity_details.model.CdVO;
import com.obuy.model.ObuyService;
import com.obuy.model.ObuyVO;
import com.commodity_details.model.CdVO;
import com.commodity_details.model.CdService;

/**
 * Servlet implementation class ObuyServlet
 */
@WebServlet("/ObuyServlet")
public class ObuyServlet extends HttpServlet {
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

				Integer obuyId = new Integer(req.getParameter("obuyId").trim());
				
				ObuyService oSvc = new ObuyService();
				List<ObuyVO> obuyVO = oSvc.getAll(); 
				
				if (obuyVO == null) {
					errorMsgs.add("沒有這筆資料");
				}
			
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("");
					failureView.forward(req, res);
					return;
				}

				
				req.setAttribute("obuyVO", obuyVO); 
				String url = "";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

		}

		if ("GET_ONE_STMT".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				Integer obuyId = new Integer(req.getParameter("obuyId").trim());

			
				ObuyService oSvc = new ObuyService();
				ObuyVO obuyVO = oSvc.findByPrimaryKey(obuyId);

				req.setAttribute("obuyVO", obuyVO);
				String url = "/Pet/listonePet.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 
				successView.forward(req, res);

			
			} catch (Exception e) {
				errorMsgs.add("無法"+ e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Member/login.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {

			System.out.println("11111111111111111111111111111111");
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			Integer oMemId = new Integer(req.getParameter("oMemId").trim());
			Integer oMoney = new Integer(req.getParameter("oMoney").trim());
			Integer oPaying = new Integer(req.getParameter("oPaying").trim());
			Integer oSend = new Integer(req.getParameter("oSend").trim());
			Integer oSurvive = new Integer(req.getParameter("oSurvive").trim());
			String obuyOther = req.getParameter("obuyOther").trim();

			ObuyVO obuyVO = new ObuyVO();
			obuyVO.setoMemId(oMemId);
			obuyVO.setoMoney(oMoney);
			obuyVO.setoPaying(oPaying);
			obuyVO.setoSend(oSend);
			obuyVO.setoSurvive(oSurvive);
			obuyVO.setObuyOther(obuyOther);


			if (!errorMsgs.isEmpty()) {
				req.setAttribute("obuyVO", obuyVO); 
				RequestDispatcher failureView = req.getRequestDispatcher("/Member/login.jsp");
				failureView.forward(req, res);
				return; 
			}

			ObuyService oSvc = new ObuyService();
			oSvc.update(oMemId, oMoney, oPaying, oSend, oSurvive, obuyOther);


			req.setAttribute("obuyVO", obuyVO); 
			String url = "/Member/login.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);

		}			
			
			if ("insertWithco".equals(action)) { 

				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					
					Integer oMemId = new Integer(req.getParameter("oMemId").trim());
					Integer oMoney = new Integer(req.getParameter("oMoney").trim());
					Integer oPaying = new Integer(req.getParameter("oPaying").trim());
					Integer oSend = new Integer(req.getParameter("oSend").trim());
					String obuyOther = req.getParameter("obuyOther").trim();

					ObuyVO obuyVO = new ObuyVO();
					obuyVO.setoMemId(oMemId);
					obuyVO.setoMoney(oMoney);
					obuyVO.setoPaying(oPaying);
					obuyVO.setoSend(oSend);
					obuyVO.setObuyOther(obuyOther);


					
					ObuyService oSvc = new ObuyService();
					List<CdVO> list = new ArrayList<CdVO>();
					CdVO cdVO1 = new CdVO();
					cdVO1.setCdItemId(1);
					cdVO1.setCdAmount(1);
					cdVO1.setCdMoney(222);	
					
					list.add(cdVO1);
					
					CdVO cdVO2 = new CdVO();
					
					cdVO2.setCdItemId(2);
					cdVO2.setCdAmount(1);
					cdVO2.setCdMoney(666);
					
					list.add(cdVO2);
					
					oSvc.insertWithco(oMemId, oMoney, oPaying, oSend,obuyOther,list);
					String url = req.getContextPath() + "/back-end/Obuy/ObuyAll.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);

					
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					res.sendRedirect(req.getContextPath() + "/back-end/Obuy/ObuyAll.jsp");
					
//					String url = "/back-end/Obuy/ObuyAll.jsp";
//					RequestDispatcher failureView = req.getRequestDispatcher(url);
//					failureView.forward(req, res);
				}
			}

			if ("delete".equals(action)) { 

				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					
					Integer obuyId = new Integer(req.getParameter("obuyId"));

					
					ObuyService oSvc = new ObuyService();
					oSvc.delete(obuyId);

					
					String url = "/emp/listAllEmp.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);

					
				} catch (Exception e) {
					errorMsgs.add("錯誤" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/emp/listAllEmp.jsp");
					failureView.forward(req, res);
				}
			}
		}
	}

