<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>    
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<% 
	String uploadPath = request.getRealPath("/upload");
	out.println("절대경로 : "+ uploadPath +"<br>");
	int maxSize = 1024 * 1024 * 5; //5MB
	String name 			= "";	// 이름
	String subject 			= "";	// 제목
	String fileName1 		= "";	// 중복처리가 완료된 파일이름
	String originalName1 	= "";	// 원본 파일 이름
	long fileSize 			= 0;	// 파일 사이즈
	String fileType 		= "";	// 파일 타입
	MultipartRequest multi 	= null;	// Multipart 객체
	
	try{
		multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements()){
			// form 태그에서 보낸 <input type="file" name="이곳">부분을 가져옵니다.
			String file1 = (String)files.nextElement();	//파일 input에 지정된 이름을 하나 가져옵니다.
			// 실제 파일 이름을 가져옵니다.
			originalName1 = multi.getOriginalFileName(file1);
			// 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3,4... 붙여 unique하게 파일명을 생성합니다.
			fileName1 = multi.getFilesystemName(file1);
			// 파일의 타입을 가져옵니다.
			fileType = multi.getContentType(file1);
			// <input type="file" name="이름"> 파일 이름에 해당하는 실제 파일을 가져옵니다.
			File file = multi.getFile(file1);
			// 해당파일의 크기를 알아냅니다.
			fileSize = file.length();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<h2>파일 업로드</h2>
	<p> 이름 : <%=name %></p>
	<p> 제목 : <%=subject %></p>
	<p> 원본파일이름 : <%=originalName1 %></p>
	<p> 변경된파일이름 : <%=fileName1 %></p>
	<p> 파일타입 : <%=fileType %></p>
	<p> 파일사이즈 : <%=Long.toString(fileSize) %></p>
</body>
</html>