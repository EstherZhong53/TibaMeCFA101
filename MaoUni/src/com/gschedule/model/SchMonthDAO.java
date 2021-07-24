package com.gschedule.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.appointment_form.model.ApmVO;

public class SchMonthDAO implements SchMonthDAO_interface {
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3036/maouni?serverTimezone=Asia/Taipei";
	private String userid = "David";
	private String passwd = "123456";
	
	private final String GET_MONTH_STMT = "select APMID, MEMID, GROOMERID, PID, APMDATE, dayofmonth(APMDATE), weekday(APMDATE)+1, STIME, ETIME, TOTAL, APMSTATUS  from APPOINTMENT_FORM where GROOMERID = ? AND month(APMDATE) = ? order by APMDATE";

	@Override
	public SchMonthVO getMonth(Integer month, Integer groomerId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_MONTH_STMT);
			
			pstmt.setInt(1, groomerId);
			pstmt.setInt(2, month);
			
			rs = pstmt.executeQuery();
			SchMonthVO schMonthVO = new SchMonthVO();
			
			// 將取回來的資料，依照日期分裝為31個array
			for(int i = 0; i <= 31; i++) {
				List<ApmVO> date = new ArrayList<ApmVO>();
				while(rs.next()) {
					
				}
				
				
				
			}
			
			
			
			
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		
		
		
		return null;
	}

	@Override
	public List<ApmVO> getDate(Integer date, Integer groomerId) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
