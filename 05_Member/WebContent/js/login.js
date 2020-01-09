/**
 * 로그인에 필요한 JS
 */
function sendit(){
	// alert("호출!!")
	var frm = document.regForm
	if(frm.m_userid.value == ""){
		alert("아이디를 입력해 주세요")
		frm.m_userid.focus()
		return false
	}
	if(frm.m_userid.value.length < 4 || frm.m_userid.value.length > 16){
		alert("아이디는 4자이상 16자 이하로 입력해 주세요.")
		frm.m_userid.focus()
		return false
	}
	if(frm.m_pwd.value == ""){
		alert("패스워드를 입력해 주세요")
		frm.m_pwd.focus()
		return false
	}
	if(frm.m_pwd.value.length < 4 || frm.m_pwd.value.length > 16){
		alert("패스워드는 4자이상 16자 이하로 입력해 주세요.")
		frm.m_pwd.focus()
		return false
	}
}	