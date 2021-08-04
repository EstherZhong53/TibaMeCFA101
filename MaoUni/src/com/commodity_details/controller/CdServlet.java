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
		// TODO Auto-generated method stub
		res.getWriter().append("Served at: ").append(req.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("GET_ALL_STMT".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

				Integer cdoId = new Integer(req.getParameter("cdoId").trim());
				/*************************** 2.開始查詢資料 *****************************************/
				CdService cSvc = new CdService();
				List<CdVO> cdVO = cSvc.getAll(); 
				
				if (cdVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("");
					failureView.forward(req, res);
					return;// 程式中斷
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

				res.sendRedirect(req.getContextPath() + "/back-end/obuy/obuyAll.jsp");

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				res.sendRedirect(req.getContextPath() + "/back-end/obuy/obuyAll.jsp");
			}
		}
		
		if ("cdpush".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer cdoId = new Integer(req.getParameter("cdoId").trim());
				System.out.println(cdoId);

				CdService cSvc = new CdService();
				List<CdVO> cdVO = cSvc.cdpush(cdoId);
				System.out.println(cdVO);	
				req.setAttribute("cdVO", cdVO); 

				res.sendRedirect(req.getContextPath() + "/back-end/obuy/obuyAll.jsp");

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				res.sendRedirect(req.getContextPath() + "/back-end/obuy/obuyAll.jsp");
			}
		}		

		if ("update".equals(action)) { // 來自jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			Integer cdoId = new Integer(req.getParameter("cdoId").trim());
			Integer cdItemId = new Integer(req.getParameter("cdItemId").trim());
			Integer cdAmount= new Integer(req.getParameter("cdAmount").trim());
			Integer cdMoney = new Integer(req.getParameter("cdMoney").trim());

			
			CdVO cdVO = new CdVO();
			cdVO.setCdoId(cdoId);
			cdVO.setCdItemId(cdItemId);//商品不會只有一個要怎麼全抓?
			cdVO.setCdAmount(cdAmount);
			cdVO.setCdMoney(cdMoney);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("cdVO", cdVO); // 含有輸入格式錯誤的VO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/Member/login.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始修改資料 *****************************************/
			CdService cSvc = new CdService();
			cdVO = cSvc.update(cdoId, cdItemId, cdAmount, cdMoney);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("cdVO", cdVO); // 資料庫update成功後,正確的的VO物件,存入req
			String url = "/Member/login.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);

		}			
			
			if ("insert".equals(action)) { 

				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				
				try { //商品訂單明細
					/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
					Integer cdoId = new Integer(req.getParameter("cdoId").trim());
					Integer cdItemId = new Integer(req.getParameter("cdItemId").trim());
					Integer cdAmount = new Integer(req.getParameter("cdAmount").trim());
					Integer cdMoney = new Integer(req.getParameter("cdMoney").trim());

					CdVO cdVO = new CdVO();
					cdVO.setCdItemId(cdItemId);
					cdVO.setCdItemId(cdItemId);
					cdVO.setCdAmount(cdAmount);
					cdVO.setCdMoney(cdMoney);


					/*************************** 2.開始新增資料 ***************************************/
					CdService cSvc = new CdService();
					cSvc.insert2(cdItemId, cdItemId, cdAmount, cdMoney);

					/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/

					res.sendRedirect(req.getContextPath() + "/front-end/Obuy/ObuyAll.jsp");
							
//					String url = req.getContextPath() + "/back-end/Obuy/ObuyAll.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url);
//					successView.forward(req, res);

					/*************************** 其他可能的錯誤處理 **********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/Obuy/ObuyAll.jsp");
					failureView.forward(req, res);
				}
			}

			if ("delete".equals(action)) { // 來自listAll.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/*************************** 1.接收請求參數 ***************************************/
					Integer cdoId = new Integer(req.getParameter("cdoId"));

					/*************************** 2.開始刪除資料 ***************************************/
					CdService cSvc = new CdService();
					cSvc.delete(cdoId);

					/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
					String url = "/emp/listAllEmp.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);

					/*************************** 其他可能的錯誤處理 **********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/emp/listAllEmp.jsp");
					failureView.forward(req, res);
				}
			}
		}
	}