/**
 *  댓글 JS
 */
function sendit(){
	var frm = document.rForm
	if(frm.r_content.value == ""){
		alert("댓글을 입력하세요")
		frm.r_content.focus()
		return false
	}
	frm.submit()
}

function del(ridx, bidx){
	//alert("현재 게시글 번호는 "+bidx+"이며, 댓글번호는 "+ridx+" 입니다.")
	location.href="Del.jsp?bidx="+bidx+"&ridx="+ridx
}