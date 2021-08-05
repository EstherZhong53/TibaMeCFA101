package com.pet.model;

import java.util.*;

import com.addressGeo.model.GeocodingService;
import com.groomer.model.GroVO;
import com.variety.model.VarietyVO;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Groomer;

import java.sql.*;

public class PetJDBCDAO implements PetDAO_interface {
	static String driver = "com.mysql.cj.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/MaoUni?serverTimezone=Asia/Taipei";
	static String userid = "David";
	static String passwd = "123456";

	private static final String INSERT_STMT = "insert into PET(PET_MEM_ID,PET_NAME, PET_SORT, PET_VAR_ID, PET_GENDER, PET_AGE, PET_SURVIVE) values (?,?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT PET_ID, PET_MEM_ID, PET_NAME, PET_SORT, PET_VAR_ID, PET_GENDER, PET_AGE, PET_SURVIVE FROM PET";
	private static final String GET_ONE_STMT = "SELECT PET_ID, PET_MEM_ID, PET_NAME, PET_SORT, PET_VAR_ID, PET_GENDER, PET_AGE, PET_SURVIVE FROM PET where PET_ID= ?";
//	private static final String GET_ONE_STMT = "Select PET_ID, PET_NAME, PET_SORT, PET_VAR_ID, PET_GENDER, PET_AGE, PET_SURVIVE, e1.PET_MEM_ID as PET_MEM_ID, e2.MEM_ID FROM PET e1 left join MEMBER e2 on e1.PET_MEM_ID = e2.MEM_ID WHERE MEM_ID=?";
	private static final String DELETE = "DELETE FROM PET where PET_ID = ?";
	private static final String UPDATE = "UPDATE PET set PET_SORT =?, PET_VAR_ID =?, PET_GENDER =?, PET_AGE =?, PET_SURVIVE =? where PET_ID = ?";
	private static final String GET_ONE_MEMBERANDPET = "SELECT PET_ID, PET_MEM_ID, PET_NAME, PET_SORT, PET_VAR_ID, PET_GENDER, PET_AGE, PET_SURVIVE FROM PET where PET_MEM_ID= ?";

	
//	@Override
//	public List<PetVO> getAll(Map<String, String[]> map) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<GroVO> list = new ArrayList();
//		try {
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			String finalSql = GET_ALL_STMT + jdbcUtil_CompositeQuery_Groomer.get_WhereCondition(map)
//					+ " order by groomerId";
//			pstmt = con.prepareStatement(finalSql);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				PetVO petVO = new PetVO();
//				petVO.setPetId(rs.getInt(1));
//				petVO.setPetMemId(rs.getInt(2));
//				petVO.setPetName(rs.getString(3));
//				petVO.setPetSort(rs.getString(4));
//				petVO.setPetVarId(rs.getInt(5));
//				petVO.setPetGender(rs.getString(6));
//				petVO.setPetAge(rs.getInt(7));
//				petVO.setPetSurvive(rs.getInt(8));
//
//
//			
//				Integer groomerId = rs.getInt("GROOMERID");
//
//				GeocodingService geoSvc = new GeocodingService();
//				if (geoSvc.getGeocode(groomerId).get(0) == null) {
//					geoSvc.addGeo(groomerId, rs.getString("CENTER"));
//				}
//
//				String geocode = geoSvc.getGeocode(groomerId).get(0).toString();
////				retrun fromat(121.234134,23.23514)
//				String lng = geocode.substring(1, geocode.indexOf(","));
//				String lat = geocode.substring(geocode.indexOf(",") + 1, geocode.length() - 1);
//
//				groVO.setLng(lng);
//				groVO.setLat(lat);
//				System.out.println(groomerId + ": " + geocode);
//
//				list.add(petVO);
//			}
//
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException e) {
//					e.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException e) {
//					e.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (SQLException e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return list;
//	};	
	
	@Override
	public void insert(PetVO petVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, petVO.getPetMemId());
			pstmt.setString(2, petVO.getPetName());
			pstmt.setString(3, petVO.getPetSort());
			pstmt.setInt(4, petVO.getPetVarId());
			pstmt.setString(5, petVO.getPetGender());
			pstmt.setInt(6, petVO.getPetAge());
			pstmt.setInt(7, petVO.getPetSurvive());
			
			
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}	


	@Override
	public void update(PetVO petVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

//			pstmt.setString(1, petVO.getPetName());
			pstmt.setString(1, petVO.getPetSort());
			pstmt.setInt(2, petVO.getPetVarId());
			pstmt.setString(3, petVO.getPetGender());
			pstmt.setInt(4, petVO.getPetAge());
			pstmt.setInt(5, petVO.getPetSurvive());
			pstmt.setInt(6, petVO.getPetId());
			
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}	


	@Override
	public void delete(Integer PetId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, PetId);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public PetVO findByPrimaryKey(Integer PetId) {

		PetVO petVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, PetId);

			rs = pstmt.executeQuery();

			while (rs.next()) {

			petVO = new PetVO();
			
			petVO.setPetId(rs.getInt("PET_ID"));
			petVO.setPetMemId(rs.getInt("PET_MEM_ID"));
			petVO.setPetName(rs.getString("PET_NAME"));
			petVO.setPetSort(rs.getString("PET_SORT"));
			petVO.setPetVarId(rs.getInt("PET_VAR_ID"));
			petVO.setPetGender(rs.getString("PET_GENDER"));
			petVO.setPetAge(rs.getInt("PET_AGE"));
			petVO.setPetSurvive(rs.getInt("PET_SURVIVE"));

			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		return petVO;
	}

	@Override
	public List<PetVO> findByMemId(Integer petMemId) {

		List<PetVO> list = new ArrayList<PetVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_MEMBERANDPET);

			pstmt.setInt(1, petMemId);

			rs = pstmt.executeQuery();
			while (rs.next()) {

			PetVO petVO = new PetVO();
			
			petVO.setPetId(rs.getInt("PET_ID"));
			petVO.setPetMemId(rs.getInt("PET_MEM_ID"));
			petVO.setPetName(rs.getString("PET_NAME"));
			petVO.setPetSort(rs.getString("PET_SORT"));
			petVO.setPetVarId(rs.getInt("PET_VAR_ID"));
			petVO.setPetGender(rs.getString("PET_GENDER"));
			petVO.setPetAge(rs.getInt("PET_AGE"));
			petVO.setPetSurvive(rs.getInt("PET_SURVIVE"));

			list.add(petVO);
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		return list;
	}

	@Override
	public List<PetVO> getAll() {
		

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PetVO> list = new ArrayList<PetVO>();

		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				PetVO petVO = new PetVO();
				
				petVO.setPetId(rs.getInt(1));
				petVO.setPetMemId(rs.getInt(2));
				petVO.setPetName(rs.getString(3));
				petVO.setPetSort(rs.getString(4));
				petVO.setPetVarId(rs.getInt(5));
				petVO.setPetGender(rs.getString(6));
				petVO.setPetAge(rs.getInt(7));
				petVO.setPetSurvive(rs.getInt(8));

				list.add(petVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		PetJDBCDAO dao =new PetJDBCDAO();
		
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  Class.forName(driver);
		  con = DriverManager.getConnection(url, userid, passwd);
		  pstmt = con.prepareStatement(INSERT_STMT);


		  
		  PetVO petVO = new PetVO();
//		  	List<PetVO> list = dao.getAll();
//			for (PetVO p : list) {
//				System.out.print(p.getPetId() + ",");
//				System.out.print(p.getPetMemId() + ",");
//				System.out.print(p.getPetName() + ",");
//				System.out.print(p.getPetSort() + ",");
//				System.out.print(p.getPetVarId() + ",");
//				System.out.print(p.getPetGender() + ",");
//				System.out.print(p.getPetAge());
//				System.out.print(p.getPetSurvive());
//				System.out.println();
				
//			PetVO petVO3 = dao.findByPrimaryKey(1);
//			System.out.print(petVO3.getPetId() + ",");
//			System.out.print(petVO3.getPetMemId() + ",");
//			System.out.print(petVO3.getPetName() + ",");
//			System.out.print(petVO3.getPetSort() + ",");
//			System.out.print(petVO3.getPetVarId() + ",");
//			System.out.print(petVO3.getPetGender() + ",");
//			System.out.print(petVO3.getPetAge());
//			System.out.print(petVO3.getPetSurvive());
//		  
//			PetVO petVO1 = new PetVO();
//			petVO1.setPetMemId(1);
//			petVO1.setPetName("SQL黑");
//			petVO1.setPetSort("狗");
//			petVO1.setPetVarId(1);
//			petVO1.setPetGender("公");
//			petVO1.setPetAge(10);
//			petVO1.setPetSurvive(1);
//			dao.insert(petVO1);

//			dao.delete(3);
}
}