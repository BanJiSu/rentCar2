package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import model.dto.UserDTO;
import util.DBManager;

public class UserDAO {

	private UserDAO() {}
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	private ArrayList<UserDTO> users = new ArrayList<UserDTO>();
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	public boolean checkLogin(String id, String pw) {
		return true;
	}
	
	public ArrayList<UserDTO> getUsers(){
		
		try {
			conn = DBManager.getConnection();			
			
			String str = "select * from user";	
			pstmt = conn.prepareStatement(str);	
			rs = pstmt.executeQuery();		
			
			users = new ArrayList<>();
			while(rs.next()) {				 
				String id = rs.getString(1); 
				String pw = rs.getString(2); 
				
				
				users.add(new UserDTO(id,pw));
			}
			
			System.out.println("데이터 불러오기 완료");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터 불러오기 실패.");
		}
		
		return users;
	}
	
	public int addUser(UserDTO user) {
		try {
			UserDTO newUser = new UserDTO(user.getId(), user.getPw());
			
			conn = DBManager.getConnection();
			String str = "insert into user values(?, ?, ?)";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setString(1, newUser.getId());
			pstmt.setString(2, newUser.getPw());
		
			
			pstmt.executeUpdate();								
			
			users.add(newUser);								
			
			System.out.println("업데이트 성공");
			
			return users.size();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("업데이트 실패");
		}
		
		return -1;
	}
	
	public int deleteUser(String id, String pw) {
		users = getUsers();
		int delIdx = -1;
		for(int i=0; i<users.size(); i++) {
			if(id.equals(users.get(i).getId()) && pw.equals(users.get(i).getPw())) {
				delIdx = i;
			}
		}
		if(delIdx != -1) {
			try {
				conn = DBManager.getConnection();
				
				String sql = "DELETE FROM user WHERE id = " + id;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();	// db
				
				users.remove(delIdx);	//dao
				
				return delIdx;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
}
