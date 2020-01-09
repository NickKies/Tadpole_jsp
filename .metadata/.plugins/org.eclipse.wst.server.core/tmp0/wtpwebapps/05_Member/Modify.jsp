<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%
	String userid		= "";
	String m_name		= "";
	String m_pwd	 	= "";
	String m_gender	 	= "";
	String m_zipcode 	= "";
	String m_address1	= "";
	String m_address2 	= "";
	String m_address3 	= "";
	String m_hp 		= "";
	String m_hobbystr 	= "";
	
	if(session.getAttribute("userid") != null){				// 주소를 알고 들어오면 이상해짐
		userid = (String)session.getAttribute("userid");	
	}else {
		response.sendRedirect("Login.jsp");
	}
	
	Connection conn = null;
	String sql="";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
		if(conn != null){
			sql = "SELECT * FROM member WHERE m_userid = ?"; // * 보다 컬럼명을 명시하는게 좋습니다.
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				m_name 		= rs.getString("m_name");
				m_pwd 		= rs.getString("m_pwd");
				m_gender 	= rs.getString("m_gender");
				m_zipcode 	= rs.getString("m_zipcode");
				m_address1 	= rs.getString("m_address1");
				m_address2 	= rs.getString("m_address2");
				m_address3 	= rs.getString("m_address3");
				m_hp 		= rs.getString("m_hp");
				m_hobbystr 	= rs.getString("m_hobby");		
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
<title>회원 정보수정</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script src="js/regist.js"></script>
</head>
<body>
	<h2>회원 정보수정</h2>
	<form name="regForm" method="post" action="Modify_ok.jsp">
	<input type="hidden" name="isIdchk" value="y">
	<p><label>아이디 : <input type="text" name="m_userid" value="<%= userid %>" readonly></label>
	<p><label>이름 : <input type="text" name="m_name" value="<%= m_name %>"></label></p>
	<p><label>패스워드 : <input type="password" name="m_pwd"></label></p>
	<p><label>패스워드확인 : <input type="password" name="m_pwd_re"></label></p>
	<p>성별 : <label>남자<input type="radio" name="m_gender" value="남자" <% if(m_gender.equals("남자")){%>checked<% }%>></label> 
	<label>여자<input type="radio" name="m_gender" value="여자" <% if(m_gender.equals("여자")){%>checked<% }%>></label></p>
	<p>우편번호 : <input type="text" size="5" name="m_zipcode" id="sample6_postcode" placeholder="우편번호" value="<%= m_zipcode %>" readonly>
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></p>
	<p>주소 : <input type="text" name="m_address1" id="sample6_address" placeholder="주소" value="<%= m_address1 %>" readonly></p>
	<p>상세주소 : <input type="text" name="m_address2" id="sample6_detailAddress" placeholder="상세주소" value="<%= m_address2 %>"></p>
	<p><input type="text" name="m_address3" id="sample6_extraAddress" placeholder="참고항목" value="<%= m_address3 %>"></p>
	<p><label>휴대폰번호 : <input type="text" name="m_hp" value="<%= m_hp %>"></label></p>
<%
		String m_hobby[] = m_hobbystr.split(",");
%>
	<p>취미 : <label>게임<input type="checkbox" name="m_hobby" value="게임" 
<%
		int i = 0;
		while(i<m_hobby.length){
			if(m_hobby[i].trim().equals("게임")){	%>checked<% break;}%>
<%
			i++;
		}
%>></label> 
	<label>드라이브<input type="checkbox" name="m_hobby" value="드라이브" 
<%
		i = 0;
		while(i<m_hobby.length){
			if(m_hobby[i].trim().equals("드라이브")){	%>checked<% break;}%>
<%
			i++;
		}
%>></label>
	<label>등산<input type="checkbox" name="m_hobby" value="등산" 
<%
		i = 0;
		while(i<m_hobby.length){
			if(m_hobby[i].trim().equals("등산")){	%>checked<% break;}%>
<%
			i++;
		}
%>></label>
	<label>영화감상<input type="checkbox" name="m_hobby" value="영화감상" 
<%
		i = 0;
		while(i<m_hobby.length){
			if(m_hobby[i].trim().equals("영화감상")){	%>checked<% break;}%>
<%
			i++;
		}
%>></label>
	<label>운동<input type="checkbox" name="m_hobby" value="운동" 
<%
		i = 0;
		while(i<m_hobby.length){
			if(m_hobby[i].trim().equals("운동")){	%>checked<% break;}%>
<%
			i++;
		}
%>></label></p>	
	<p><input type="button" value="정보수정 완료" onclick="sendit()"> 
	<input type="button" value="돌아가기" onclick="history.back()"></p>
</form>
</body>
</html>