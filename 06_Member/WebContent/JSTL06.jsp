<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri= "http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL function</title>
</head>
<body>
<p>fn:contains : ${fn:contains("jsp Hello World!", "world")}</p>
<p>fn:startsWith : ${fn:startsWith("jsp Hello World!", "w")}</p>
<p>fn:endsWith : ${fn:endsWith("jsp Hello World", "ld")}</p>
<p>fn:indexOf: ${fn:indexOf("jsp Hello World!", "W")}</p>
<p>fn:split: ${fn:split("My name is RyuJungWon", " ")}</p>
<p>fn:length: ${fn:length("KimYoonSung")}</p>
<p>fn:substringBefore: ${fn:substringBefore("My name is RyuJungWon", "is")}</p>
<p>fn:substringAfter: ${fn:substringAfter("My name is RyuJungWon", "is")}</p>
<p>fn:toLowerCase: ${fn:toLowerCase("My name is RyuJungWon")}</p>
<p>fn:toUpperCase: ${fn:toLowerCase("My name is RyuJungWon")}</p>
<p>fn:trim : ${fn:trim("          Hello World    ") }</p>
</body>
</html>