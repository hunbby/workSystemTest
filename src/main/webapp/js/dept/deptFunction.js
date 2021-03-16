////////////////// 첫 로딩 호풀 시 ////////////////
var user_writeMode;
var user_idCheck;
$(function() {
	user_writeMode = 'W'; //W == 들록 , M == 수정
	user_idCheck = 'N';
});

//////////////////////////// 부서 ////////////////////////
// 부서 등록 팝업 생성
$(document).on('click', '#deptAdd', function(){
	$.ajax({
		url : 'popupDeptForm'
		, type : 'post'
		, success : function(result) {
				if($(".tree2").dynatree() != null){			
					$(".tree2").dynatree("destroy");
				}
				treeMaker_basic2_notClick(JSON.parse(result.treeStr));
				$(".tree2").dynatree("getTree").reload();
				$(".tree2").dynatree("getRoot").visit(function(node){
					node.expand(true);
				}); 
	
				fromReset('form_dept');
	
				$('#checkLv1_popup').prop('checked', true);
				lvSelect(1); 
				$('#btnDeptSave').css('display', 'inline');
				$('#btnDeptEdit').css('display', 'none');
				$('#btnDeptDelete').css('display', 'none');
				$('#btnListDelete').css('display', 'none');
				$('#popupDeptForm').modal('show');
			}
		, error : function (request) {
			alert(request.responseText);
			return false;
		}
	});
});

function deptValidate() {
	if ($('#deptNm_popup').val() == "" || $('#deptNm_popup').val() == null) {
		alert('부서명 항목을 입력하세요');
		return false;
	} else {
		return true;
	}
}

// 부서 팝업 서브밋 동작
function myDeptSubmit(index) {
	if(index != 3){
		if ( !deptValidate() ) {
			return false;
		}		
	}
	
	var dept_url_state = null;
	var dept_url_data = null;
	var confirm_1 = null;
	if(index == 1) {
		confirm_1 = confirm("부서를 등록 하시겠습니까?");
		dept_url_state = 'deptSave';
		dept_url_data = $('#form_dept').serialize();
	}
	else if(index == 2) {
		confirm_1 = confirm("부서를 수정 하시겠습니까?");
		dept_url_state = 'deptEdit';
		dept_url_data = $('#form_dept').serialize();
	}
	else if(index == 3) {
		confirm_1 = confirm("부서를 삭제 하시겠습니까?");
		dept_url_state = 'deptDelete';
		dept_url_data ={deptCode : $('#deptCode_popup').val()};
	}
	else if(index == 4) {
		confirm_1 = confirm("체크 한 부서를 삭제 하시겠습니까?");
		dept_url_state = 'deptListDelete';
		dept_url_data = {deptCodeList : $('#deptCodeList_popup').val()};
	}
	if(confirm_1) {
		 $.ajax({
			url : dept_url_state
			, type : 'post'
			, dataType : "json" 
			, data : dept_url_data
			, success : function(result) {
					if(result.result.result === 'success') {
						alert(result.result.msg);
						location.href = 'deptMgmt';
	//					treeMaker_basic(JSON.parse(result.treeStr));
	//					$(".tree").dynatree("getTree").reload();
	//					$(".tree").dynatree("getRoot").visit(function(node){
	//					    node.expand(true);
	//					});
	//					userList_dept('root','root01');
	//					$('.tree').dynatree("getTree").visit(function(node) {
	//						console.log(node);
	//						if(node.data.key == 'root') {
	//							node.activate();
	//						}
	//					});
					} else {
						alert(result.result.msg);
						return false;
					}
				 	$('#popupDeptForm').modal('hide');
				}
		 	, error : function(request) {
				alert(request.responseText);
					return false;
				}
		});	
	} else {
		return false;
	}
 
}
//////////////////////////// 부서 ////////////////////////

////////////////////////////사용자 //////////////////////////
//사용자 등록 팝업 생성
$(document).on('click', '#btnUserAdd', function() {
	user_writeMode = 'W';
	user_idCheck = 'N'
	$('#userId_popup').prop("readonly", false);
	$.ajax({
		url : '/popupUserForm'
		, type : 'post' 
		, success : function (result) {
				var treeDeptUser = JSON.parse(result.treeStr);
				treeMaker_radio_forUser(treeDeptUser, '');
				$(".tree3").dynatree("getTree").reload();
				$(".tree3").dynatree("getRoot").visit(function(node){
					node.expand(true);
				});
				fromReset('form_user');	
				$('#necessaryToggle').text(" (*)");
				$('#position_popup').val("1").prop("selected", true);
				$('input:radio[name=state]:input[value="0"]').prop("checked", true)
				$('#chkIdResult').text('');
				$('#btnUserSave').css('display', 'inline');
				$('#btnUserEdit').css('display', 'none');
				$('#btnUserDelete').css('display', 'none');
				$('#popupUserForm').modal('show'); 
			}
		, error : function (request) {
			alert(request.responseText);
				return false;
			}
	});
});

// 사용자 리스트 더블 클릭 시 상세 보기
$(document).on('dblclick', '.listBody_user', function() {
	user_idCheck = 'Y';
	user_writeMode = 'M';
	$('#userId_popup').prop("readonly", true);
	$.ajax({
		url : '/popupUserForm'
		, type : 'post' 
		, data : {userCode : $(this)[0].title}
		, success : function(result) {
				var userInfo = result.userInfo;
				var selUserTree = JSON.parse(result.treeStr);
				
				treeMaker_radio_forUser(selUserTree, userInfo.deptCode);
				$(".tree3").dynatree("getTree").reload();
				$(".tree3").dynatree("getRoot").visit(function(node){
				    node.expand(true);
				});
				$('#necessaryToggle').text(" ");
				$('#userCode_popup').val(userInfo.userCode);
				$('#userNm_popup').val(userInfo.userNm);
				$('#userId_popup').val(userInfo.userID);
				$('#password_popup').val('');
				$('#deptNm_user').val(userInfo.deptNm);
				$('#deptCode_user').val(userInfo.deptCode);
				$('#position_popup').val(userInfo.position).prop("selected", true);
				$('#auth_popup').val(userInfo.userAuth).prop("selected", true);
				$('input:radio[name=state]:input[value='+userInfo.state +']').prop("checked", true);
				$('#chkIdResult').text('');
				$('#userMail_popup').val(userInfo.userMail);
				$('#userPhone_popup').val(userInfo.userPhone);
				$('#btnUserSave').css('display', 'none');
				$('#btnUserEdit').css('display', 'inline');
				$('#btnUserDelete').css('display', 'inline'); 
			}
		, error : function (request) {
			alert(request.responseText);
				return false;
			}
	});
	$('#popupUserForm').modal('show');
});

function userValidate() {
	//구글에서 가져온 이메일 정규식 해석중...
	var emailChk = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	if ($('#userNm_popup').val() == "" || $('#userNm_popup').val() == null) {
		alert('사용자 명 항목을 입력하세요');
		return false;
	} else if ($('#userId_popup').val() == "" || $('#userId_popup').val() == null) {
		alert('사용자 ID 항목을 입력하세요');
		return false;
	} else if (user_idCheck == 'N' || user_idCheck == "" || user_idCheck == null) {
		alert('중복된 ID 입니다');
		return false;
	} else if (($('#password_popup').val() == "" || $('#password_popup').val() == null) && user_writeMode == 'W') {
		alert('비밀번호 항목을 입력하세요');
		return false;
	} else if ($('#userMail_popup').val() == "" || $('#userMail_popup').val() == null) {
		alert('E-Mail 항목을 입력하세요');
		return false;
	} else if(!emailChk.test($('#userMail_popup').val())) {
		alert("올바른 이메일 주소를 입력하세요")
		return false;
	} else if ($('#userPhone_popup').val() == "" || $('#userPhone_popup').val() == null) {
		alert('전화번호 항목을 입력하세요');
		return false;
	} else {
		return true;
	}
}

function myUserSubmit(index) {
	if (index != 3) {
		if ( !userValidate() ) {
			return false;
		}
	}
	
	var user_url_state = null;
	var confirm_1 = null;
	
	if (index == 1) {
		confirm_1 = confirm("사용자를 등록 하시겠습니까?");
		user_url_state = 'userSave';
	}
	else if (index == 2) {
		confirm_1 = confirm("사용자를 수정 하시겠습니까?");
		user_url_state = 'userEdit';
	}
	else if (index == 3) {
		confirm_1 = confirm("사용자를 삭제 하시겠습니까?");
		user_url_state = 'userDelete';
	}
	if(confirm_1) {
		 $.ajax({
			url : user_url_state
			, type : 'post'
			, data : $('#form_user').serialize()
			, success : function(result) {
					console.log(result);
					if(result.result.result == 'success') {
						alert(result.result.msg);
						userList_dept(result.userVO.deptCode);
						$('.tree').dynatree("getTree").visit(function(node) {
							if(node.data.key == result.userVO.deptCode) {
								node.activate();
							}
						});
					} else {
						alert(result.result.msg);
						return false;
					} 
							
					$('#popupUserForm').modal('hide');
				}
		 	, error : function(request) {
					alert(request.responseText);
					return false;
				}		
		});
	} 
}

function chkId() {
	// 수정 할 때 id는 못바꾸지만 혹시 몰라서 걸어버림!
	if (user_writeMode == 'W') {
		var chkId = $('#userId_popup').val();
		$.ajax({
			url : '/checkId'
			, type : 'post'
			, data : { userID : chkId }
			, success : function (re) {
					var re = re.result;
					if (re.result == 'success') {
						$('#chkIdResult').text(re.msg);
						user_idCheck = 'Y';
					} else if (re.result == 'fail') {
						$('#chkIdResult').text(re.msg);
						user_idCheck = 'N';
					} else {
						alert('서버 에러 입니다. 관리자에게 문의하세요');
					}
				}
			, error : function (request) {
				alert(request.responseText);
				return false;
			}
		});
	}
}

// 구글에서 가져온 유효성 검사 및 - 가호 붙여주는 기능 처음부터 - 입력해도 상관 없다  이미 있으면 지우고 검사하기 떄문
$(document).on('keydown', '#userPhone_popup', function(e){
    // 숫자만 입력받기
     var trans_num = $('#userPhone_popup').val().replace(/-/gi,'');
	var k = e.keyCode;
				
	if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
	{
	    e.preventDefault();
	}
 }).on('blur', '#userPhone_popup', function(){ // 포커스를 잃었을때 실행합니다.
     if($('#userPhone_popup').val() == '') return;

     // 기존 번호에서 - 를 삭제합니다.
     var trans_num = $('#userPhone_popup').val().replace(/-/gi,'');
   
     // 입력값이 있을때만 실행합니다.
     if(trans_num != null && trans_num != '')
     {
         // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
         if(trans_num.length==11 || trans_num.length==10) 
         {   
             // 유효성 체크
             var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
             if(regExp_ctn.test(trans_num))
             {
                 // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                 trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                 $('#userPhone_popup').val(trans_num);
             }
             else
             {
                 alert("유효하지 않은 전화번호 입니다.");
                 $('#userPhone_popup').val("");
                 $('#userPhone_popup').focus();
             }
         }
         else 
         {
             alert("유효하지 않은 전화번호 입니다.");
             $('#userPhone_popup').val("");
             $('#userPhone_popup').focus();
         }
   }
}); 
//////////////////////////// 사용자 //////////////////////////