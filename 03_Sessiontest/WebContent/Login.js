/**
 * 로그인을 위한 JS
 */
function sendit() {
	var frm = document.LoginForm
	if(frm.userid.value == ""){
		alert("아이디를 입력해주세요")
		frm.uesrid.focus()
		return false
	}
	if(frm.pwd.value ==""){
		alert("패스워드를 입력해주세요")
		frm.pwd.focus()
		return false
	}
	//frm.submit()
}