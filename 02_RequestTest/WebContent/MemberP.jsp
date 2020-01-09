<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// request 객체 : client -> server 정보들
	request.setCharacterEncoding("UTF-8");
	String m_userid = request.getParameter("m_userid");
	String m_name = request.getParameter("m_name");
	String m_pwd = request.getParameter("m_pwd");
	String m_gender = request.getParameter("m_gender");
	String m_zipcode = request.getParameter("m_zipcode");
	String m_address1 = request.getParameter("m_address1");
	String m_address2 = request.getParameter("m_address2");
	String m_address3 = request.getParameter("m_address3");
	String m_hp = request.getParameter("m_hp");
	String m_hobby[] = request.getParameterValues("m_hobby");
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
			out.print(m_hobby[i]+", ");
		}
	%></p>
</body>
</html>