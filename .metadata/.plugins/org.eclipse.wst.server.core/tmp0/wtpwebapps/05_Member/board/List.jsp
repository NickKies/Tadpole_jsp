<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	// 1. DB연결 후 Board 테이블에서 데이터를 내림차순으로 반복하여 출력
	// 2. 글번호는 반복문을 이용하여 순차적으로 출력
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	int total = 0;
	int rcnt = 0;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/jsptest","root","1234");
		
		if(conn != null){
				sql ="SELECT count(b_idx) from board";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					total = rs.getInt(1); // 첫 번째 컬럼을 가져와라 -> 총 데이터 갯수
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
<title>리스트</title>
</head>
<body>
<h2>List</h2>
<h3>총 게시물<%=total %></h3>
<table width="800" border="1">
	<tr>
		<th>글번호</th>
		<th width="300">제목</th>
		<th>아이디</th>
		<th>조회수</th>
		<th>날짜</th>
	</tr>
<%
	if(total == 0){
%>
	<tr>
		<td colspan = "5">등록된 글이 없습니다.</td>
	</tr>
<%			
	}else{
		
		sql = "SELECT b_idx, b_userid, b_title, b_hit, b_registdate FROM board ORDER BY b_idx DESC";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int i = 0;
		while(rs.next()){
			String b_idx = rs.getString("b_idx");
			String userid = rs.getString("b_userid");
			String b_title = rs.getString("b_title");
			String b_hit = rs.getString("b_hit");
			String b_registdate = rs.getString("b_registdate");
			
			sql  = "SELECT count(r_idx) FROM reply where r_bidx = ?";	// 현재글의 댓글이 몇개인지 SELECT
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_idx);	// 현재 글번호를 입력
			rs2 = pstmt.executeQuery();
			if(rs2.next()){
				rcnt = rs2.getInt(1);	// 글번호에 대한 댓글이 몇개인지 저장
			}
			String cnt_str = "";
			if(rcnt > 0){
				cnt_str = "["+ String.valueOf(rcnt) +"]";	// 댓글에 대한 갯수를 표기하기 위한 String 생성
			}
%>					
	<tr>	
		<td><%=(total-i)%></td>
		<td><a href="View.jsp?b_idx=<%=b_idx%>"><%=b_title%> <%=cnt_str%></a></td>
		<td><%=userid%></td>
		<td><%=b_hit%></td>
		<td><%=b_registdate.substring(0,10)%></td>
	</tr>
<%
			i++;
		}
	}	
%>
	<tr>
		<td colspan="4" align="center">1 2 3 4 5 6 7 8 9</td>
		<td><a href="Write.jsp">[글쓰기]</a></td>
	</tr>	
</table>
<p><a href="../Login.jsp">[메인으로]</a></p>		
</body>
</html>