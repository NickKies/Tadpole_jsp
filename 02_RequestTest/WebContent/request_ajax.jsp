<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String city = request.getParameter("city");
	String zipcode = request.getParameter("zipcode");
	
	out.print(city);
	out.print(zipcode);
%>