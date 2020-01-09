/**
 * 회원탈퇴 JS
 */
function sendit() {
	var frm = document.leaveForm
	if(frm.m_pwd.value == ""){
		alert("패스워드를 입력해 주세요")
		frm.m_pwd.focus()
		return false
	}
	var ch = String(prompt("'탈퇴'를 입력하시면 정말 탈퇴됩니다."))
	if(ch == "탈퇴"){
		frm.submit()
	}else{
		alert("탈퇴가 취소되었습니다.")
		return false
	}
}