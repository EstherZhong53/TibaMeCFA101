package com.adopt_imf.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.UnavailableException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adopt_imf.model.ImfService;
import com.adopt_imf.model.ImfVO;
import com.sun.xml.internal.bind.v2.model.core.ID;

@WebServlet("/ImfPhotoServlet")

public class ImfPhotoServlet extends HttpServlet {

	Connection con;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		

		ServletOutputStream out = res.getOutputStream();
		
			String AI_ID = req.getParameter("AI_ID").trim();
			ImfService imfService = new ImfService();
			ImfVO oneImf = imfService.getOneImf(Integer.parseInt(AI_ID));
			byte[] photo = oneImf.getPhoto();
			out.write(photo);
	}
//			res.setContentType("image/jpg");
//			ServletOutputStream o = res.getOutputStream();
//			try {
//				Statement stmt = con.createStatement();
//				String id = req.getParameter("id");
//				ResultSet rs = stmt.executeQuery(
//						"select AI_PHOTO where AI_ID="+id
//						);
//			if(rs.next()) {
//				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("AI_ID"));
//			byte[] buf = new byte[4*1024];
//			int len;
//			while((len = in.read(buf)) != -1) {
//				o.write(buf, 0, len);
//			}
//			in.close();
//			}else {
//				res.sendError(HttpServletResponse.SC_NOT_FOUND);
//			}
//						rs.close();
//						stmt.close();						
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//    }
//	
//			public void Imf() throws ServletException{
//				try {
//					Class.forName("com.mysql.cj.jdbc.Driver");
//					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/MAOUNI?serverTimezone=Asia/Taipei","David","123456");
//				}catch(ClassNotFoundException e) {
//					throw new UnavailableException("Couldn't load JDBCDRIVER");
//				}catch(SQLException e) {
//					throw new UnavailableException("Couldn't get db connection");
//				}
			

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

}
