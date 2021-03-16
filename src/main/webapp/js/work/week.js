/** 더블클릭 */
function test(data) {

	location.href = "/work/weekDetail?weekCode="+data.title;
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

/** 밸리데이션 체크 (등록)*/
function valiControl(){
	
	if($("#prstartdate").val() == "" || $("#prstartdate").val() == null){
		alert("업무수행일을 선택해주세요.");
		return false;
	}
	if($("#epMgmtNm").val() == "" || $("#epMgmtNm").val() == null){
		alert("프로젝트명을 선택 해주세요.");
		return false;
	}
	
	if($("#pjtNm2").val() == "" || $("#pjtNm2").val() == null){
		alert("담당자를 선택해주세요.");
		return false;
	}
	
	if($("#content").val() == "" || $("#content").val() == null){
		alert("업무 상세내용 입력해주세요.");
		return false;
	}
	

	
	return true;
}




