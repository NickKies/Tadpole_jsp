/**
 *  비밀번호 변경에 필요한 JS
 */
function sendit() {
	var frm = document.pwdForm
	if(frm.old_m_pwd.value == ""){
		alert("기존 패스워드를 입력해 주세요")
		frm.old_m_pwd.focus()
		return false
	}	
	if(frm.m_pwd.value == ""){
		alert("변경할 패스워드를 입력해주세요")
		frm.m_pwd.focus()
		return false
	}	
	if(frm.m_pwd.value.length < 4 || frm.m_pwd.value.length > 16){
		alert("비밀번호는 4자 이상 16자 이하로 입력해주세요.");
		frm.m_pwd.focus()
		return false
	}
	if(frm.m_pwd.value != frm.m_pwd_re.value){
		alert("비밀번호를 확인해 주세요");
		frm.m_pwd.focus()
		return false
	}	
	if(frm.old_m_pwd.value == frm.m_pwd.value){
		alert("기존 비밀번호와 새로운 비밀번호가 같습니다.")
		frm.m_pwd.focus()
		return false
	}
	frm.submit()
}
function ch() {
	if(frm.m_pwd.value.length < 4 || frm.m_pwd.value.length > 16){
		document.getElementById("pwch").innerHTML = "비밀번호는 4자 이상 16자 이하로 입력해주세요."
	}
	if(frm.m_pwd.value != frm.m_pwd_re.value){
		document.getElementById("pwch_re").innerHTML = "비밀번호를 확인해 주세요"
	}	
	
}