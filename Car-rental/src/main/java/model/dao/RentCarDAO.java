package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBManager;
import model.dto.RentCarDTO;

public class RentCarDAO {
	private RentCarDAO() {
		
	} ////�ܺο��� ������ ���ϵ��� Default�����ڴ� private���� �����մϴ�. 
	private static RentCarDAO instance = new RentCarDAO();
	public static RentCarDAO getInstance() {
		return instance;
	}
	public int getcartype(){
		String sql ="select count(*) from cartype";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cartype=0;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	
			if(rs.next()) {
				cartype=rs.getInt(1);
			}
			System.out.println("cartype �ҷ����� �Ϸ�");
		}catch (Exception e) {
			System.out.println("cartype �ҷ����� ����");
		e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return cartype;
	}
	//������� (�߰�)
	
	public void insertrentCar(RentCarDTO bVo) {
		String sql = " insert into rental(carName,carNumber,color,price,carSize)"
				+ "values(?,?,?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, bVo.getCarName());
			pstmt.setInt(2, bVo.getCarNumber());
			pstmt.setString(3, bVo.getColor());
			pstmt.setInt(4, bVo.getPrice());
			pstmt.setString(5, bVo.getCarSize());
			pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
	public void updateBoard(RentCarDTO bVo){
		String sql = "update board set title=?, content=?,img=? where num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);  // '?'���ε带 ����ؼ� sql���� ȿ�� ������ ����Ҽ�����
			
			pstmt.setString(1, bVo.getCarName());
			pstmt.setInt(2, bVo.getCarNumber());
			pstmt.setString(3, bVo.getColor());
			pstmt.setInt(4, bVo.getPrice());
			pstmt.setString(5, bVo.getCarSize());
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}	
	}
}