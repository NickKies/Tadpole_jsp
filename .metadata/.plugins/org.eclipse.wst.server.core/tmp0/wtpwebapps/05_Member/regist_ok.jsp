<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<% 
	request.setCharacterEncoding("UTF-8");
	String m_userid		= request.getParameter("m_userid");
	String m_name		= request.getParameter("m_name");
	String m_pwd	 	= request.getParameter("m_pwd");
	String m_gender	 	= request.getParameter("m_gender");
	String m_zipcode 	= request.getParameter("m_zipcode");
	String m_address1	= request.getParameter("m_address1");
	String m_address2 	= request.getParameter("m_address2");
	String m_address3 	= request.getParameter("m_address3");
	String m_hp 		= request.getParameter("m_hp");
	String m_hobby[] 	= request.getParameterValues("m_hobby");
	String m_hobbystr	= "";
	for(int i=0; i<m_hobby.length; i++){
		if(i== m_hobby.length-1){
			m_hobbystr += m_hobby[i];
		}else{
			m_hobbystr += m_hobby[i]+",";
		}
	}

	Connection conn = null;
	String sql="";
	PreparedStatement pstmt = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
											//"jdbc:mariadb://localhost:3306/jsptest","root","1234"
		if(conn != null){
			//out.print("DB연결 성공!");
			sql = "INSERT INTO member (m_userid,m_name,m_pwd,m_gender,m_zipcode,m_address1,";
			sql += "m_address2,m_address3,m_hp,m_hobby) VALUES (?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m_userid);
			pstmt.setString(2,m_name);
			pstmt.setString(3,m_pwd);
			pstmt.setString(4,m_gender);
			pstmt.setString(5,m_zipcode);
			pstmt.setString(6,m_address1);
			pstmt.setString(7,m_address2);
			pstmt.setString(8,m_address3);
			pstmt.setString(9,m_hp);
			pstmt.setString(10,m_hobbystr);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}
	}catch(Exception e){
		out.print(e);
	}
 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료 </title>
</head>
<body>
	<h2>정보 출력</h2>
	<p>아이디 : <%= m_userid %></p>
	<p>이름 : <%= m_name %></p>
	<p>비밀번호 : <%= m_pwd %></p>
	<p>성별 : <%= m_gender %></p>
	<p>우편번호 : <%= m_zipcode %></p>
	<p>주소 : <%= m_address1 %></p>
	<p>상세주소 : <%= m_address2 %></p>
	<p>참고항목 : <%= m_address3 %></p>
	<p>휴대폰번호 : <%= m_hp %></p>
	<p>취미 : 
	<%
		  for(int i=0; i<m_hobby.length; i++){
			out.print(m_hobby[i]+" ");
		}
	%></p>
	<a href="Login.jsp">로그인하러 가기</a>
</body>
</html>