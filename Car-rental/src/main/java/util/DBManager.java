package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBManager {

	private DBManager() {}
	
	public static Connection getConnection() {
		Connection conn = null;
		
		// DB연동 코드
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// jdbc:mysql://localhost:3306/데이터베이스스키마명?serverTimezone=UTC
			String url = "jdbc:mysql://rentcar.cpdz8jedc8fx.us-east-1.rds.amazonaws.com/rental?serverTimeZone=UTC";	// 데이터베이스 주소
			
			String id = "admin";
			String pw = "SkRxYpBjU98rGzvc"; 
			
			conn = DriverManager.getConnection(url, id, pw);
			
			if(conn != null) {
				System.out.println("데이터베이스 연동 성공!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동 실패...");
		}
		return conn;
	}
	
	//select문 수행 후 close 메소드
		public static void close(Connection conn,Statement stmt, ResultSet rs){
			try{
				rs.close();
				stmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//DBL 수행 후 close 메소드
		public static void close(Connection conn,Statement stmt){
			try{
				stmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
}
