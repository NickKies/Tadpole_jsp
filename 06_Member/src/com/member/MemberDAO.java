package com.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MemberDAO {
	public MemberResult updateUser(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MemberResult mResult = new MemberResult();
		String url = "jdbc:mariadb://localhost:3306/jsptest";
		String uid = "root";
		String upw = "1234";
		int rows = 0;
		String msg = "";
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("데이터베이스 연결 시도중");
			conn = DriverManager.getConnection(url, uid, upw);
			System.out.println("데이터베이스 연결 성공");
			String sql ="UPDATE memberex2 SET user_id =?, user_pass=?,user_name=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPass());
			pstmt.setString(3, user.getUserName());
			pstmt.setInt(4, user.getId());
			rows = pstmt.executeUpdate();
			if(rows >0 ) {
				msg = user.getUserName() + "님 회원정보 수정에 성공했습니다.";
			}else {
				msg = user.getUserName() + "님 회원정보 수정에 실패했습니다.";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			msg = user.getUserName() + "님 고객센터 문의 바랍니다.";
		}finally {
			try{ if(pstmt != null){ pstmt.close();}
			}catch(Exception e){e.printStackTrace();}
			try{ if(conn != null){conn.close();}
			}catch(Exception e){e.printStackTrace();}
			mResult.setMsg(msg);
			mResult.setRows(rows);
		}
		return mResult;
	}
	
	public MemberResult deleteUser(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MemberResult mResult = new MemberResult();
		String url = "jdbc:mariadb://localhost:3306/jsptest";
		String uid = "root";
		String upw = "1234";
		int rows = 0;
		String msg = "";
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("데이터베이스 연결 시도중");
			conn = DriverManager.getConnection(url, uid, upw);
			System.out.println("데이터베이스 연결 성공");
			String sql = "DELETE FROM memberex2 WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getId());
			rows = pstmt.executeUpdate();
			if(rows >0) {
				msg = "데이터 삭제를 성공했습니다.";
			}else {
				msg = "데이터 삭제를 실패했습니다.";
			}
		}catch(Exception e) {
			e.printStackTrace();
			msg = "고객센터로 문의하세요";
		}finally {
			try{ if(pstmt != null){ pstmt.close();}
			}catch(Exception e){e.printStackTrace();}
			try{ if(conn != null){conn.close();}
			}catch(Exception e){e.printStackTrace();}
			mResult.setMsg(msg);
			mResult.setRows(rows);
		};
		return mResult;
	}
}
