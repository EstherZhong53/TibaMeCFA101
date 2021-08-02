package com.article.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.article.model.*;
import com.article.model.ArtService;
import com.article.model.ArtVO;

//知識文章
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ArtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ArtServlet() {
		super();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// 後台(單一查詢)_getOne_For_Display => 來自select_page_art.jsp的請求

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 請求參數--輸入格式錯誤處理
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入文章編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/select_page_art.jsp");
					failureView.forward(req, res);
					return;
				}

				Integer id = null;
				try {
					id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("文章編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/select_page_art.jsp");
					failureView.forward(req, res);
					return;
				}

				// 開始查詢資料_getOne_For_Display
				ArtService artSvc = new ArtService();
				ArtVO artVO = artSvc.getOneByID(id);

				if (artVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/select_page_art.jsp");
					failureView.forward(req, res);
					return;
				}

				// 查詢完成 ，準備轉交_getOne_For_Display => listOneArt.jsp
				req.setAttribute("artVO", artVO);
				String url = "/back-end/article/listOneArt.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他可能錯誤的處理_getOne_For_Display
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/select_page_art.jsp");
				failureView.forward(req, res);
			}
		}

		// 後台(修改)_getOne_For_Update => 來自 listAllArt.jsp 的請求

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 接收請求參數_getOne_For_Update

				Integer id = new Integer(req.getParameter("id"));

				// 開始查詢資料_getOne_For_Update

				ArtService artSvc = new ArtService();
				ArtVO artVO = artSvc.getOneByID(id);

				// 查詢完成,準備轉交_getOne_For_Update => update_art_input.jsp

				req.setAttribute("artVO", artVO);
				String url = "/back-end/article/update_art_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他可能的錯誤處理_getOne_For_Update

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/listAllArt.jsp");
				failureView.forward(req, res);
			}
		}

		// 前台(單一查看)_getOne_For_Check => 來自 listAllArt_f.jsp 的請求

		if ("getOne_For_Check".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 接收請求參數_getOne_For_Update

				Integer id = new Integer(req.getParameter("id"));

				// 開始查詢資料_getOne_For_Update

				ArtService artSvc = new ArtService();
				ArtVO artVO = artSvc.getOneByID(id);

				// 查詢完成,準備轉交_getOne_For_Update => update_art_input.jsp

				req.setAttribute("artVO", artVO);
				String url = "/front-end/article/listOneArt_f.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他可能的錯誤處理_getOne_For_Update

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/article/listOneArt_f.jsp");
				failureView.forward(req, res);
			}
		}

		// 後台(修改)_update => 來自 update_art_input.jsp 的請求

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 接收請求參數 - 輸入格式的錯誤處理_update
				// 文章id
				Integer id = new Integer(req.getParameter("id").trim());

				// 分類id
				Integer artt_id = new Integer(req.getParameter("artt_id").trim());

				// 文章名稱
				String name = req.getParameter("name");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,50000}$";

				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("文章名稱: 請勿空白");
				} else if (!name.trim().matches(enameReg)) {
					errorMsgs.add("文章名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到500之間");
				}

				// 文章圖片
				InputStream inP = req.getPart("pic").getInputStream();
				byte[] pic = new byte[inP.available()];

				inP.read(pic);
				inP.close();

				// 文章內容
				String contnt = req.getParameter("contnt");
			    String contntReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,8500}$";

				if (contnt == null || contnt.trim().length() == 0) {
					errorMsgs.add("文章內容: 請勿空白");
				} else if (!contnt.trim().matches(contntReg)) {
					errorMsgs.add("文章內容: 只能是中、英文字母、數字和_ , 且長度必需在2到500之間");
				}

				// 發布時間
				java.sql.Date update = null;
				try {
					update = java.sql.Date.valueOf(req.getParameter("update").trim());
				} catch (IllegalArgumentException e) {
					update = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				ArtVO artVO = new ArtVO();
				artVO.setId(id);
				artVO.setArtt_id(artt_id);
				artVO.setName(name);
				artVO.setPic(pic);
				artVO.setContnt(contnt);
				artVO.setUpdate(update);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("artVO", artVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/update_art_input.jsp");
					failureView.forward(req, res);
					return;
				}

				// 開始修改資料__update
				ArtService artSvc = new ArtService();
				artVO = artSvc.updateArt(id, artt_id, name, pic, contnt, update);

				// 修改完成,準備轉交__update => listOneArt.jsp
				req.setAttribute("artVO", artVO);
				String url = "/back-end/article/listOneArt.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他可能的錯誤處理__update
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/update_art_input.jsp");
				failureView.forward(req, res);
			}
		}

		// 後台(新增)_insert => 來自 addArt.jsp 的請求

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 接收請求參數 - 輸入格式的錯誤處理_insert
				// 分類id
				Integer artt_id = new Integer(req.getParameter("artt_id").trim());

				// 文章名稱
				String name = req.getParameter("name");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,500}$";

				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("文章名稱: 請勿空白");
				} else if (!name.trim().matches(enameReg)) {
					errorMsgs.add("文章名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到500之間");
				}

				// 文章圖片
				InputStream inP = req.getPart("pic").getInputStream();

				byte[] pic = new byte[inP.available()];

				inP.read(pic);
				inP.close();

				// 文章內容
				String contnt = req.getParameter("contnt");
				String contntReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,8500}$";

				if (contnt == null || contnt.trim().length() == 0) {
					errorMsgs.add("文章內容: 請勿空白");
				} else if (!contnt.trim().matches(contntReg)) {
					errorMsgs.add("文章內容: 只能是中、英文字母、數字和_ , 且長度必需在2到500之間");
				}

				// 發布時間
				java.sql.Date update = null;
				try {
					update = java.sql.Date.valueOf(req.getParameter("update").trim());
				} catch (IllegalArgumentException e) {
					update = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				ArtVO artVO = new ArtVO();
				artVO.setArtt_id(artt_id);
				artVO.setName(name);
				artVO.setPic(pic);
				artVO.setContnt(contnt);
				artVO.setUpdate(update);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("artVO", artVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/addArt.jsp");
					failureView.forward(req, res);
					return;
				}

				// 開始新增資料_insert
				ArtService artSvc = new ArtService();
				artVO = artSvc.addArt(artt_id, name, pic, contnt, update);

				// 新增完成,準備轉交_insert => listAllArt.jsp
				String url = "/back-end/article/listAllArt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他可能的錯誤處理

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/addArt.jsp");
				failureView.forward(req, res);
			}
		}

		// 後台(刪除)_delete => 來自 listAllArt.jsp 的請求

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 接收請求參數_delete
				Integer id = new Integer(req.getParameter("id"));

				// 開始刪除資料_delete
				ArtService artSvc = new ArtService();
				artSvc.deleteArt(id);

				// 刪除完成,準備轉交_delete =>
				String url = "/back-end/article/listAllArt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/article/listAllArt.jsp");
				failureView.forward(req, res);
			}

		}

	}
}