<%
	String userid = "";
	String name	= "";
	
	if(session.getAttribute("userid") != null){				
		userid = (String)session.getAttribute("userid");	
		name = (String)session.getAttribute("name");
	}else {
		response.sendRedirect("../Login.jsp");
	}
%>