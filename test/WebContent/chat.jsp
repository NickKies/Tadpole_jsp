<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = "";
	String toID = "";
	if(session.getAttribute("userID") != null && request.getParameter("toID") != null){
		userID = (String)session.getAttribute("userID");
		toID = (String) request.getParameter("toID");
	}else {
		response.sendRedirect("go.jsp");
	}
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/chat_bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>실시간 채팅 서비스</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>	
	<div class="container bootstrap snippet">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="portlet portlet-default">
                    <div class="portlet-heading">
                        <div class="portlet-title">
                            <h4 ><i class="fa fa-circle text-green"></i><%=toID %></h4>
                        </div>
                        <div class="portlet-widgets">
                            
                            <span class="divider"></span>
                            <a data-toggle="collapse" data-parent="#accordion" href="#chat"><i class="fa fa-chevron-down"></i></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div id="chat" class="panel-collapse collapse in">
                        <div>
                        <div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;">
                            
                            
 
                        </div>
                        </div>
                        <div class="portlet-footer">
                            <form role="form">
                                <div class="form-group">
                                    <textarea id="chatContent" class="form-control" placeholder="Enter message..."></textarea>
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-default pull-right" onclick="submitFunction()">Send</button>
                                    <div class="clearfix"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
	
	                    
<script type="text/javascript">
	function submitFunction() {
		var fromID ='<%=userID%>';
		var toID = '<%=toID%>';
		var ch_content = $('#chatContent').val();
		$.ajax({
			type : "POST",
			url : "./ChatSubmitServlet",
			data: {
				fromID: encodeURIComponent(fromID),
				toID: encodeURIComponent(toID),
				ch_content: encodeURIComponent(ch_content)
			}
		});
		$('#chatContent').val('');
	}
	var lastID = 0 ;
	function chatListFunction(type){
		var fromID = '<%=userID%>';
		var toID = '<%=toID%>';
		$.ajax({
			type:"POST",
			url:"./ChatList",
			data: {
				fromID : encodeURIComponent(fromID),
				toID : encodeURIComponent(toID),
				listType : type
			},
			success: function(data){
				if(data=="") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i; i<result.length; i++){
					addChat(result[i][0].value, result[i][2].value ,result[i][3].value);
				}
				lastId = Number(parsed.last);
			}
		});		
	}
	function addChat(chatName, chatContent, chatTime){
		$('chatList').appent('<div class="row">'+
				'<div class="col-lg-12">' +
                '<div class="media">'+
                '<a class="pull-left" href="#">'+
                '<img class="media-object img-circle img-chat" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">'+
                '</a> <div class="media-body">'+
                '<h4 class="media-heading">'+
                chatName +
                '<span class="small pull-right">'+
                chatTime + 
                '</span> </h4> <p>'+
                chatContent +
                '</p></div> </div> </div> </div><hr>');
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	function getInfiniteChat() {
		setInterval(function(){
			chatListFunction(lastID);
		},3000);
	}
	
	$(document).ready(function(){
		chatListFunction('ten');
		getInfiniteChat();
	})
	
</script>
</body>
</html>