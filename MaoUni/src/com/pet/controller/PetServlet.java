package com.pet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.pet.model.PetService;
import com.pet.model.PetVO;

public class PetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("GET_ALL_STMT".equals(action)) { // 來自ALL.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer petId = new Integer(req.getParameter("petId"));

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) { // 如果字串長度>0就開始回傳
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/pet/petlistAll.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/

				PetService petSvc = new PetService();
				List<PetVO> petVO = petSvc.getAll();

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("petVO", petVO);
				String url = "/back-end/pet/petlistAll.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/pet/petlistAll.jsp");
				failureView.forward(req, res);
			}
		}

		if ("GET_ONE_STMT".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer petId = new Integer(req.getParameter("petId").trim());

				/*************************** 2.開始查詢資料 ****************************************/
				PetService petSvc = new PetService();
				PetVO petVO = petSvc.findByPrimaryKey(petId);

				// 這邊svc要叫出來的是在Service時會用哪個方法的名稱，跟dao那邊無關
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("petVO", petVO); // 資料庫取出的VO物件,存入req
				String url = "/back-end/pet/listonePet.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);//
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/pet/petlistAll.jsp");
				failureView.forward(req, res);
			}
		}

		if ("GET_ONE_UPDATE".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer petId = new Integer(req.getParameter("petId").trim());

				/*************************** 2.開始查詢資料 ****************************************/
				PetService petSvc = new PetService();
				PetVO petVO = petSvc.findByPrimaryKey(petId);

				// 這邊svc要叫出來的是在Service時會用哪個方法的名稱，跟dao那邊無關
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("petVO", petVO); // 資料庫取出的VO物件,存入req

				String url = "/front-end/member/petUpdate.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				res.sendRedirect(req.getContextPath() + "/front-end/member/petUpdate.jsp");

//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/pet/petUpdate.jsp");
//				failureView.forward(req, res);
			}
		}

		// 會員一對多(寵物)
		if ("findByMemId".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer petMemId = new Integer(req.getParameter("petMemId").trim());

				/*************************** 2.開始查詢資料 ****************************************/
				PetService petSvc = new PetService();
				List<PetVO> petVO = petSvc.findByMemId(petMemId);
				HttpSession session = req.getSession();
				session.setAttribute("petVO", petVO);

				// 這邊svc要叫出來的是在Service時會用哪個方法的名稱，跟dao那邊無關
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("petVO", petVO); // 資料庫取出的VO物件,存入req
				String url = "/front-end/member/petpage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);//
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/petpage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自jsp的請求

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			String petSort = req.getParameter("petSort").trim();
			Integer petVarId = new Integer(req.getParameter("petVarId").trim());
			String petGender = req.getParameter("petGender").trim();
			Integer petAge = new Integer(req.getParameter("petAge").trim());
			Integer petSurvive = new Integer(req.getParameter("petSurvive").trim());
			Integer petId = new Integer(req.getParameter("petId").trim());

			PetVO petVO = new PetVO();
//			petVO.setPetName(petName);
			petVO.setPetSort(petSort);
			petVO.setPetVarId(petVarId);
			petVO.setPetGender(petGender);
			petVO.setPetAge(petAge);
			petVO.setPetSurvive(petSurvive);
			petVO.setPetId(petId);

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("petVO", petVO); // 含有輸入格式錯誤的VO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/petpage.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始修改資料 *****************************************/
			PetService petSvc = new PetService();
			petSvc.update(petVO);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("petVO", petVO);
			String url = "/front-end/member/petpage.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}

		if ("insert".equals(action)) {

			System.out.println("為什麼要這樣對我");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				Integer petMemId = memberVO.getMemId();
				
				String petName = req.getParameter("petName").trim();
				String petSort = req.getParameter("petSort").trim();
				Integer petVarId = new Integer(req.getParameter("petVarId").trim());
				String petGender = req.getParameter("petGender").trim();
				Integer petAge = new Integer(req.getParameter("petAge").trim());
				Integer petSurvive = new Integer(req.getParameter("petSurvive").trim());

				
				
				PetVO petVO = new PetVO();
				petVO.setPetMemId(petMemId);
				petVO.setPetName(petName);
				petVO.setPetSort(petSort);
				petVO.setPetVarId(petVarId);
				petVO.setPetGender(petGender);
				petVO.setPetAge(petAge);
				petVO.setPetSurvive(petSurvive);

				/*************************** 2.開始新增資料 ***************************************/
				PetService petSvc = new PetService();
				petSvc.insert(petMemId,petName, petSort, petVarId, petGender, petAge, petSurvive);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/member/petpage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/memberpage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer PetId = new Integer(req.getParameter("PetId"));

				/*************************** 2.開始刪除資料 ***************************************/
				PetService petSvc = new PetService();
				petSvc.delete(PetId);

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

		///////////////// Esther 加  //////////////////
		if ("getPetInfo".equals(action)) {
			res.setContentType("text/plain");
			res.setCharacterEncoding("utf-8");
			Integer petId = new Integer(req.getParameter("petId").trim());

			try {
				PetService petSvc = new PetService();
				PetVO petVO = petSvc.findByPrimaryKey(petId);
				Gson gson = new Gson();
				String petStr = gson.toJson(petVO);

				PrintWriter out = res.getWriter();
				out.write(petStr);
				out.flush();
				out.close();

			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
		//////////////////////////////////////////////

	}
}