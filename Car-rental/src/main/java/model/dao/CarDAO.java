package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBManager;

public class CarDAO {
	public CarDAO() {}
	private static CarDAO instance = new CarDAO();
	public static CarDAO getInstance() {
		return instance;
	}
	
	public int comfirmCarNum(String car_num) {
		int result = -1;
		String sql = "select car_num from cars where car_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, car_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			} else {
				result = -1;				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int insertCar(String car_num, String car_name, String car_type, int car_price,
			int car_rent_term_year, int car_rent_term_month, int car_rent_term_day) {
		int result = -1;
		String sql = "insert into cars values(?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
//		   	primary key car_num var(20) not null
//		    car_name var(20) not null
//		    car_type var(20) not null
//		    car_price int not null
//		    car_rent_term_year int
//		    car_rent_term_month int
//		    car_rent_term_day int not null
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, car_num);
			pstmt.setString(2, car_name);
			pstmt.setString(3, car_type);
			pstmt.setInt(4, car_price);
			pstmt.setInt(5, car_rent_term_year);
			pstmt.setInt(6, car_rent_term_month);
			pstmt.setInt(7, car_rent_term_day);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
}