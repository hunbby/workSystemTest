/** 더블클릭 */
function test(data) {
	
	location.href = "/commCd/commCdDetail?cdId="+data.title;
}

/** 버튼 전송 전 밸리데이션 체크 */
$(document).on('click', '#eval', function(e){
	if(valiControl()) {
		$('#form1').submit();
	} else {
		return false;
	}
	
})

function button_event(){
  if (confirm("수정하시겠습니까??") == true){    
      document.form.submit();
  }else{   
      return;
  }
}
function button_event2(){
	  if (confirm("등록하시겠습니까??") == true){    
	      document.form.submit();
	  }else{   
	      return;
	  }
	}



/** 아이디 중복체크 */
function cdChk(){
	var url =  '/commCd/cdChk';
	var checkValue = {};
	
	checkValue["cdId"] = $("#cdId").val();

	$.ajax({
		contentType : "application/json",
		type 		: "POST",		
		url  		: url,
		async		: true,
		data 		: JSON.stringify(checkValue),
		success : function(data){
			console.log(data);
			if(data.checkVal == "success"){
				$("#membr_idCheck").text("*사용가능한 코드입니다.");
				CheckId = true;
			}
			else if(data.checkVal == "overlap"){
				$("#membr_idCheck").text("*중복되는 코드가 있습니다.");
				checkValue = $("#cdId").val("");
				$("#cdId").focus();
				CheckId = false;
			}
			else {
				
			}

		},
		error : function(e){
			console.log(e);
			alert("에러");
		}
	})
}

/** 밸리데이션 체크 (등록)*/
function valiControl(){
	
	if($("#cdId").val() == "" || $("#cdId").val() == null){
		alert("공통코드 입력해주세요.");
		return false;
	}
	if($("#cdNm").val() == "" || $("#cdNm").val() == null){
		alert("코드명을 입력해주세요.");
		return false;
	}
	if($("#paCdId").val() == "" || $("#paCdId").val() == null){
		alert("그룹코드를 입력해주세요.");
		return false;
	}
	
	if($("#cdOrder").val() == "" || $("#cdOrder").val() == null){
		alert("순번을 입력해주세요.");
		return false;
	}
	
	return true;
}




