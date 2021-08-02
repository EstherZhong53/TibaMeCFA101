package com.announcemet.controller;

import java.io.*;
import java.util.*;
import java.io.InputStream;

import javax.servlet.*;
import javax.servlet.http.*;

import javax.servlet.annotation.MultipartConfig;
//import com.announcement.model.*;
import com.announcemet.model.AnnService;
import com.announcemet.model.AnnVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class AnnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AnnServlet() {
		super();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

// 單一查詢_來自select_page.jsp的請求 (後台首頁單一查詢)
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// 將集合儲存在請求範圍中
			// 發送錯誤.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接收請求參數 - 輸入格式的錯誤處理
				String str = req.getParameter("id");
				// trim() 字串開頭及結尾去除空格用
				// 返回一個新的字串。這個字串將刪除了原始字串頭部和尾部的空格
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入公告編號");
				}
				// 如果有錯誤，請將再次發送回表單
				// isEmpty() 如果length()為0此方法返回true，否則返回false
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcemet/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer id = null;
				try {
					id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("公告編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcemet/select_page.jsp");
					failureView.forward(req, res);
					// 程式中斷
					return;
				}
				// 2.抓查詢資料 getOne_For_Display
				AnnService annSvc = new AnnService();
				AnnVO annVO = annSvc.getOneAnn(id);
				if (annVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcemet/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				// 3.查詢完成,準備轉交(Send the Success view)
				req.setAttribute("annVO", annVO);
				// 成功轉交 listOneEmp.jsp
				String url = "/back-end/announcemet/listOneAnn.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他查詢可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add("無法取得公告編號資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcemet/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		// 單一查詢 => 前台_ listAllAnnf.jsp的請求 (前台首頁單一查詢)
		if ("getOne_For_front".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入公告編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/announcemet/listAllAnnf.jsp");
					failureView.forward(req, res);
					return;
				}

				Integer id = null;
				try {
					id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("公告編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/announcemet/listAllAnnf.jsp");
					failureView.forward(req, res);

					return;
				}
				// 2.抓查詢資料 getOne_For_Display
				AnnService annSvc = new AnnService();
				AnnVO annVO = annSvc.getOneAnn(id);
				if (annVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/announcemet/listAllAnnf.jsp");
					failureView.forward(req, res);
					return;
				}
				// 3.查詢完成,準備轉交(Send the Success view)
				req.setAttribute("annVO", annVO);
				// 轉交
				String url = "/front-end/announcemet/listOneAnnf.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他查詢可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add("無法取得公告編號資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/announcemet/listAllAnnf.jsp");
				failureView.forward(req, res);
			}
		}

		// 修改用 => 後台_listAllAnn.jsp的請求
		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接收請求參數
				Integer id = new Integer(req.getParameter("id"));

				// 2.開始查詢資料
				AnnService annSvc = new AnnService();
				AnnVO annVO = annSvc.getOneAnn(id);

				// 3.查詢完成,準備轉交
				req.setAttribute("annVO", annVO);
				String url = "/back-end/announcemet/update_ann_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcemet/listAllAnn.jsp");
				failureView.forward(req, res);
			}
		}

		// 後台 =>修改 _來自update_ann_input.jsp的請求
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接收請求參數 - 輸入格式的錯誤處理
				Integer id = new Integer(req.getParameter("id").trim());

				String content = req.getParameter("content");
				String contentReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,8500}$";

				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("公告內容: 請勿空白");
				} else if (!content.trim().matches(contentReg)) {
					errorMsgs.add("公告內容: 只能是中、英文字母、數字和_ , 且長度必需在2到500之間");
				}

				java.sql.Date update = null;

				try {
					update = java.sql.Date.valueOf(req.getParameter("update").trim());
				} catch (IllegalArgumentException e) {
					update = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				// 圖片處理上傳
				InputStream inP = req.getPart("pic").getInputStream();
				byte[] pic = new byte[inP.available()];

				inP.read(pic);
				inP.close();

				AnnVO annVO = new AnnVO();
				annVO.setId(id);
				annVO.setContent(content);
				annVO.setUpdate(update);
				annVO.setPic(pic);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("annVO", annVO); // 含有輸入格式錯誤的annVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/announcemet/update_ann_input.jsp");
					failureView.forward(req, res);
					return;
				}

				// 2.開始修改資料
				AnnService annSvc = new AnnService();
				annVO = annSvc.updateAnn(id, content, update, pic);

				// 3.修改完成,準備轉交
				req.setAttribute("annVO", annVO);
				String url = "/back-end/announcemet/listOneAnn.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcemet/update_ann_input.jsp");
				failureView.forward(req, res);
			}
		}

		// 後台 =>新增用_來自addAnn.jsp的請求
		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接收請求參數 - 輸入格式的錯誤處理
				String content = req.getParameter("content");
				String contentReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,8500}$";

				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("公告內容: 請勿空白");
				} else if (!content.trim().matches(contentReg)) {
					errorMsgs.add("公告內容: 只能是中、英文字母、數字和_ , 且長度必需在2到500之間");
				}

				java.sql.Date update = null;

				try {
					update = java.sql.Date.valueOf(req.getParameter("update").trim());
				} catch (IllegalArgumentException e) {
					update = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請選擇日期!");
				}
				// 圖片上傳
				InputStream inP = req.getPart("pic").getInputStream();

				byte[] pic = new byte[inP.available()];

				inP.read(pic);
				inP.close();

				AnnVO annVO = new AnnVO();
				annVO.setContent(content);
				annVO.setUpdate(update);
				annVO.setPic(pic);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("annVO", annVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcemet/addAnn.jsp");
					failureView.forward(req, res);
					return;
				}

				// 2.開始新增資料
				AnnService annSvc = new AnnService();
				annVO = annSvc.addAnn(content, update, pic);
				// 3.新增完成,準備轉交
				String url = "/back-end/announcemet/listAllAnn.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他新增可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcemet/addAnn.jsp");
				failureView.forward(req, res);
			}

		}

		// 後台 =>刪除_頁面用_listAllAnn.jsp請求
		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接收請求參數
				Integer id = new Integer(req.getParameter("id"));

				// 2.開始刪除資料
				AnnService annSvc = new AnnService();
				annSvc.deleteAnn(id);

				// 3.刪除完成,準備轉交
				String url = "/back-end/announcemet/listAllAnn.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcemet/listAllAnn.jsp");
				failureView.forward(req, res);

			}

		}
	}

}