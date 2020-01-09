<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function sendRequest() {
		var httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange = function() {
			if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){
				document.getElementById("text").innerHTML = httpRequest.responseText;
			}
		};
		httpRequest.open("POST","request_ajax.jsp",true);
		httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		httpRequest.send("city=Seoul&zipcode=06141");
	}
</script>
</head>
<body>
	<h1>POST 방식의 요청</h1>
	<button type="button" onclick="sendRequest()">Post 방식으로 요청보내기!</button>
	<p id="text"></p>
</body>
</html>