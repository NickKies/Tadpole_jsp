<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 회원가입과 동일하게 데이터를 전달받음
	// DB연결
	// 세션이 없다면 Login.jsp로 이동
	// SELECT를 해서 전달받은 password와 일치하는지 확인
	// UPDATE문을 이용하여 데이터를 수정
	// Login.jsp로 다시 이동	
%>   
<%@ page import="java.sql.*" %> 
<% 
	request.setCharacterEncoding("UTF-8");
	// m_userid는 세션에 있는 아이디를 사용
	String m_name		= request.getParameter("m_name");
	String m_pwd		= request.getParameter("m_pwd");
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
	
	// 세션이 없다면 Login.jsp로 이동
	String userid = "";
	if(session.getAttribute("userid") != null){				
		userid = (String)session.getAttribute("userid");	
	}else {
		response.sendRedirect("Login.jsp");
	}

	// DB연결
	Connection conn = null;
	String sql="";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
		
		if(conn != null){		
			sql = "SELECT m_userid FROM member WHERE m_userid = ? AND m_pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,m_pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sql = "UPDATE member SET m_name=?,m_gender=?,m_zipcode=?,m_address1=?,m_address2=?,m_address3=?,m_hp=?,m_hobby=?";
				sql += "WHERE m_userid=?";				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,m_name);
				pstmt.setString(2,m_gender);
				pstmt.setString(3,m_zipcode);
				pstmt.setString(4,m_address1);
				pstmt.setString(5,m_address2);
				pstmt.setString(6,m_address3);
				pstmt.setString(7,m_hp);
				pstmt.setString(8,m_hobbystr);
				pstmt.setString(9,userid);
				pstmt.executeUpdate();
%>				
				<script>
					alert("수정되었습니다.")
					location.href="Login.jsp"
				</script>
<%

			}else{			
%>				
				<script>
					alert("패스워드를 확인해 주세요")
					location.href="Modify.jsp"
				</script>
<%
			}
		}		
	}catch(Exception e){
		out.print(e);
	}
 %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>

</body>
</html>