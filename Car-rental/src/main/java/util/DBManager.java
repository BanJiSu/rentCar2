package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBManager {

	private DBManager() {}
	
	public static Connection getConnection() {
		Connection conn = null;
		
		// DB���� �ڵ�
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// jdbc:mysql://localhost:3306/�����ͺ��̽���Ű����?serverTimezone=UTC
			String url = "jdbc:mysql://rentcar.cpdz8jedc8fx.us-east-1.rds.amazonaws.com/rental?serverTimeZone=UTC";	// �����ͺ��̽� �ּ�
			
			String id = "admin";
			String pw = "SkRxYpBjU98rGzvc"; 
			
			conn = DriverManager.getConnection(url, id, pw);
			
			if(conn != null) {
				System.out.println("�����ͺ��̽� ���� ����!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�����ͺ��̽� ���� ����...");
		}
		return conn;
	}
	
	//select�� ���� �� close �޼ҵ�
		public static void close(Connection conn,Statement stmt, ResultSet rs){
			try{
				rs.close();
				stmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//DBL ���� �� close �޼ҵ�
		public static void close(Connection conn,Statement stmt){
			try{
				stmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
}
