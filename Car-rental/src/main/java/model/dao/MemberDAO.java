package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.dto.MemberVO;
import util.DBManager;

public class MemberDAO {
	private MemberDAO() {

	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public int userCheck(String userid, String pwd) {
		int result = -1;
		String sql = "select pwd from user where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("pwd") != null && rs.getString("pwd").equals(pwd)) {
					result = 1; // �쉶�썝
				} else {
					result = 0; // 鍮꾨쾲 ��由�
				}
			} else {
				result = -1; // �쉶�썝�븘�떂
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

	// �븘�씠�뵒濡� �쉶�썝 �젙蹂� 媛��졇�삤�뒗 硫붿냼�뱶
	public MemberVO getMember(String userid) {
		MemberVO mVo = null;
		String sql = "select * from user where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mVo = new MemberVO();
				mVo.setName(rs.getString("name"));
				mVo.setUserid(rs.getString("userid"));
				mVo.setPwd(rs.getString("pwd"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setAdmin(rs.getInt("admin"));
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
		return mVo;
	} // getMember end

	// �쉶�썝媛��엯�떆 �븘�씠�뵒 以묐났 泥댄겕�븯�뒗 硫붿냼�뱶, �븘�씠�뵒 以묐났=1, 以묐났�븘�땲硫� -1
	public int confirmID(String userid) {
		int result = -1;
		String sql = "select userid from user where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
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

	// �쉶�썝媛��엯 硫붿냼�뱶
	public int insertMember(MemberVO mVo) {
		int result = -1;
		String sql = "insert into user values(?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getName());
			pstmt.setString(2, mVo.getUserid());
			pstmt.setString(3, mVo.getPwd());
			pstmt.setString(4, mVo.getPhone());
			pstmt.setInt(5, mVo.getAdmin());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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

	// �쉶�썝�젙蹂� �닔�젙
	public int updateMember(MemberVO mVo) {

		int result = -1;
		String sql = "update user set pwd=?, name=?," + "phone=?, userid=? where userid=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getPwd());
			pstmt.setString(2, mVo.getPhone());
			pstmt.setString(3, mVo.getUserid());
			pstmt.setString(4, mVo.getUserid());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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

	// �쉶�썝�깉�눜
	public int dropMember(String userid) {
		int result = -1;
		String sql = "delete from user where userid=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);

			result = pstmt.executeUpdate();

			System.out.println(userid + "�쑀���븘�씠�뵒");
			System.out.println(result + "�궘�젣 �꽦怨�");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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
}