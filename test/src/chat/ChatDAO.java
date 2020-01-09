package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ChatDAO {
	DataSource dataSource;

	public ChatDAO() {
		Connection conn = null;
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc_mariadb");
			conn = dataSource.getConnection();
			System.out.println("DB연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ChatDTO> getChatListByID(String fromID, String toID, String ch_idx) {
		ArrayList<ChatDTO> chatList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT FROM chat WHERE ((fromID = ? AND toID = ?) OR (toID = ? AND fromID = ?) AND ch_idx > ? ORDER BY ch_time";

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fromID);
			pstmt.setString(2, toID);
			pstmt.setString(3, toID);
			pstmt.setString(4, fromID);
			pstmt.setInt(5, Integer.parseInt(ch_idx));
			rs = pstmt.executeQuery();
			chatList = new ArrayList<ChatDTO>();

			while (rs.next()) {
				ChatDTO chat = new ChatDTO();
				chat.setCh_idx(rs.getInt("ch_idx"));
				chat.setFromID(rs.getString("fromID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setToID(rs.getString("toID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setCh_content(rs.getString("ch_content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setCh_content(rs.getString("ch_content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				int ch_time = Integer.parseInt(rs.getString("ch_time").substring(11, 13));
				String timeType = "오전";
				if (ch_time > 12) {
					timeType = "오후";
					ch_time -= 12;
				}
				chat.setCh_time(rs.getString("ch_time").substring(0, 11) + " " + timeType + " " + ch_time + ":"
						+ rs.getString("ch_time").substring(14,16));
				chatList.add(chat);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return chatList;
	}
	
	public ArrayList<ChatDTO> getChatListByRecent(String fromID, String toID, int number) {
		ArrayList<ChatDTO> chatList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT FROM chat WHERE ((fromID = ? AND toID = ?) OR (toID = ? AND fromID = ?) AND ch_idx > (SELECT MAX(ch_idx) - ? FROM chat) ORDER BY ch_time";

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fromID);
			pstmt.setString(2, toID);
			pstmt.setString(3, toID);
			pstmt.setString(4, fromID);
			pstmt.setInt(5, number);
			rs = pstmt.executeQuery();
			chatList = new ArrayList<ChatDTO>();

			while (rs.next()) {
				ChatDTO chat = new ChatDTO();
				chat.setCh_idx(rs.getInt("ch_idx"));
				chat.setFromID(rs.getString("fromID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setToID(rs.getString("toID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setCh_content(rs.getString("ch_content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setCh_content(rs.getString("ch_content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				int ch_time = Integer.parseInt(rs.getString("ch_time").substring(11, 13));
				String timeType = "오전";
				if (ch_time > 12) {
					timeType = "오후";
					ch_time -= 12;
				}
				chat.setCh_time(rs.getString("ch_time").substring(0, 11) + " " + timeType + " " + ch_time + ":"
						+ rs.getString("ch_time").substring(14,16));
				chatList.add(chat);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return chatList;
	}
	
	public int submit(String fromID, String toID, String ch_content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO chat (fromID, toID, ch_content) VALUES(?,?,?)";

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fromID);
			pstmt.setString(2, toID);
			pstmt.setString(3, ch_content);
			return pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
}
