package com.itemphotos.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.item.model.ItemService;
import com.item.model.ItemVO;
import com.itemphotos.model.ItemPhotosService;

@WebServlet("/ItemPhotosServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ItemPhotosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("uploadItems".equals(action)) {
			
			Integer itemId = new Integer(req.getParameter("itemId"));
			try {
				ItemPhotosService itemPhotosSvc = new ItemPhotosService();
				Set<Part> parts = new HashSet(req.getParts());
				
				
				for(Part part: parts) {
					if("ipItem".equals(part.getName())) {
						InputStream fin = part.getInputStream();
						byte[] ipItem = new byte[fin.available()];
						fin.read(ipItem);
						itemPhotosSvc.addIpItem(itemId, ipItem);
						fin.close();
					}
				}
				ItemService itemService = new ItemService();
				ItemVO itemVO = itemService.getOneItem(itemId);
				req.setAttribute("itemVO", itemVO);
				
				// 檢查上傳的檔案類型是否為照片檔
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/item/listOneItem.jsp"); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
		
		if("deleteIpItem".equals(action)) {
			res.setContentType("text/html; charset=UTF-8");
			Integer ipId = new Integer(req.getParameter("ipId"));
			
			try {
				ItemPhotosService itemPhotosService = new ItemPhotosService();
				itemPhotosService.delete(ipId);
				
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
	}
}