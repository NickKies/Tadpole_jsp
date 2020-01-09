package com.member;

import java.sql.Connection;
import java.sql.DriverManager;

public class MariadbConnect {
	private static MariadbConnect db;
	
	private MariadbConnect() {
		
	}
	public static MariadbConnect getInstance() {
		if(db == null) {
		db = new MariadbConnect();
		}
		return db;
	}	
	
	public Connection getConnection() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");			
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			String url = "jdbc:mariadb://127.0.0.1:3306/jsptest";
			String uid = "root";
			String upw = "1234";
			Connection conn = DriverManager.getConnection(url, uid, upw);
			System.out.println("DB연결 성공!");
			return conn;
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB연결 실패");
		}
		return null;
	}
}
