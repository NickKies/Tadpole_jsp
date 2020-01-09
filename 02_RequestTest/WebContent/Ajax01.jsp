<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax 테스트</title>
<script>
	function sendRequest() {
		var httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange=function() {
			if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){
				document.getElementById("text").innerHTML = httpRequest.responseText;
			}
		};
		httpRequest.open("GET","request_ajax.jsp?city=Seoul&zipcode=06141",true);
		httpRequest.send();
	}
</script>
</head>
<body>
	<h1>GET 방식의 요청</h1>
	<button type="button" onclick="sendRequest()">GET 방식으로 요청보내기!</button>
	<p id="text"></p>
</body>
</html>
