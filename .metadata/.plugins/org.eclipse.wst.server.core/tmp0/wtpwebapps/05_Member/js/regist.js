/**
 * 회원가입에 필요한 JS
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
	if(frm.isIdchk.value == "n"){
		alert("아이디 중복체크를 해주세요.")
		frm.m_userid.focus()
		return false
	}
	
	if(frm.m_name.value == ""){
		alert("이름을 입력해 주세요")
		frm.m_name.focus()
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
	if(frm.m_pwd.value != frm.m_pwd_re.value){
		alert("패스워드를 확인해 주세요.")
		frm_m_pwd.focus()
		return false
	}
	if(frm.m_zipcode.value == ""){
		alert("우편번호를 입력해 주세요.")
		frm.m_zipcode.focus()
		return false
	}
	if(frm.m_address3.value == ""){
		alert("주소를 확인해주세요")
		frm.m_address3.focus()
		return false
	}
	if(frm.m_hp.value == ""){
		alert("휴대폰번호를 입력해 주세요.")
		frm.m_hp.focus()
		return false
	}
	var cnt = 0
	for(var i=0; i<frm.m_hobby.length; i++){
		if(frm.m_hobby[i].checked){
			cnt++
		}
	}
	if(cnt == 0){
		alert("취미는 1개이상 입력해 주세요.")
		return false
	}
	frm.submit()
}

function checkid(userid){
	if(userid == ""){
		alert("아이디를 입력해 주세요.")
		return false
	}
	
	var httpRequest = new XMLHttpRequest();
	document.getElementById("idCheck_text").innerHTML = ""
	httpRequest.onreadystatechange = function(){
		if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){
			if(httpRequest.responseText.trim() == "ok"){
				document.getElementById("idCheck_text").innerHTML = "사용할 수 있는 아이디 입니다."
				var frm = document.regForm
				frm.isIdchk.value = "y"
				frm.m_userid.readOnly = true
			}else{
				document.getElementById("idCheck_text").innerHTML = "사용할 수 없는 아이디 입니다."	
			}
		}
	}
	httpRequest.open("GET", "idcheck_ajax.jsp?mem_userid="+userid, true)
	httpRequest.send()
}