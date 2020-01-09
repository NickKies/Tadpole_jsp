/**
 * 	게시판 글쓰기를 위한 JS
 */
function sendit(){
	var frm = document.bForm
	if(frm.b_title.value == ""){
		alert("제목을 입력해 주세요.")
		frm.b_title.focus()
		return false
	}
	if(frm.b_content.value == ""){
		alert("내용을 입력해 주세요.")
		frm.b_content.focus()
		return false
	}
	frm.submit()
}