package com.commodity_details.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commodity_details.model.CdService;
import com.commodity_details.model.CdVO;
import com.obuy.model.ObuyService;
import com.obuy.model.ObuyVO;


@WebServlet("/CdServlet")
public class CdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public CdServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.getWriter().append("Served at: ").append(req.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("GET_ALL_STMT".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

				Integer cdoId = new Integer(req.getParameter("cdoId").trim());
				CdService cSvc = new CdService();
				List<CdVO> cdVO = cSvc.getAll(); 
				
				if (cdVO == null) {
					errorMsgs.add("沒有這筆資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("");
					failureView.forward(req, res);
					return;
				}

				req.setAttribute("cdVO", cdVO); 
				String url = "";
				RequestDispatcher successView = req.getRequestDispatcher(url); //
				successView.forward(req, res);

		}

		if ("GET_ONE_STMT".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer cdoId = new Integer(req.getParameter("cdoId").trim());


				CdService cSvc = new CdService();
				CdVO cdVO = cSvc.findByPrimaryKey(cdoId);
				req.setAttribute("cdVO", cdVO); 
				String url = "/Pet/listonePet.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("搜尋資料失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Member/login.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			Integer cdoId = new Integer(req.getParameter("cdoId").trim());
			Integer cdItemId = new Integer(req.getParameter("cdItemId").trim());
			Integer cdAmount= new Integer(req.getParameter("cdAmount").trim());
			Integer cdMoney = new Integer(req.getParameter("cdMoney").trim());

			
			CdVO cdVO = new CdVO();
			cdVO.setCdoId(cdoId);
			cdVO.setCdItemId(cdItemId);
			cdVO.setCdAmount(cdAmount);
			cdVO.setCdMoney(cdMoney);

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("cdVO", cdVO);
				RequestDispatcher failureView = req.getRequestDispatcher("/Member/login.jsp");
				failureView.forward(req, res);
				return; 
			}

			CdService cSvc = new CdService();
			cdVO = cSvc.update(cdoId, cdItemId, cdAmount, cdMoney);

			req.setAttribute("cdVO", cdVO); 
			String url = "/Member/login.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);

		}			
		
		
			//商品訂單跟明細同時新增↓↓
			if ("insert".equals(action)) { 

				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {

					Integer cdoId = new Integer(req.getParameter("cdoId").trim());
					Integer cdItemId = new Integer(req.getParameter("cdItemId").trim());
					Integer cdAmount = new Integer(req.getParameter("cdAmount").trim());
					Integer cdMoney = new Integer(req.getParameter("cdMoney").trim());

					CdVO cdVO = new CdVO();
					cdVO.setCdItemId(cdItemId);
					cdVO.setCdItemId(cdItemId);
					cdVO.setCdAmount(cdAmount);
					cdVO.setCdMoney(cdMoney);

					CdService cSvc = new CdService();
					cSvc.insert2(cdItemId, cdItemId, cdAmount, cdMoney);


					res.sendRedirect(req.getContextPath() + "/front-end/Obuy/ObuyAll.jsp"); // 	沒看到有這支JSP ?
							
//					String url = req.getContextPath() + "/back-end/Obuy/ObuyAll.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url);
//					successView.forward(req, res);

				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/Obuy/ObuyAll.jsp");	 // 為什麼導向後台 ?
					failureView.forward(req, res);
				}
			}

			if ("delete".equals(action)) { 

				List<String> errorMsgs = new LinkedList<String>();

				req.setAttribute("errorMsgs", errorMsgs);

				try {
					Integer cdoId = new Integer(req.getParameter("cdoId"));

					CdService cSvc = new CdService();
					cSvc.delete(cdoId);

					String url = "/emp/listAllEmp.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);

				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/emp/listAllEmp.jsp");	// 為什麼導向後台 ?
					failureView.forward(req, res);
				}
			}
		}
	}

