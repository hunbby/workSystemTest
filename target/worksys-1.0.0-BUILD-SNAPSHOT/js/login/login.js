function login() {
	$.ajax({
		url : '/memberLoginChk'
		, type : 'post'
		, data : $('#form1').serialize()
		, success : function (data) {
			if(data.result == 'success') {
				location.href = "/main/mainList";
			} else {
				alert('로그인 정보를 확인 하세요');
				return false;
			}
		}
		, error : function (e) {
			alert('로그인 정보를 확인 하세요');
		}
	});
}

function enterLogin(event) {
	if (event.keyCode == 13) {
		login();
	}
}