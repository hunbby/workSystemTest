$(function() {
	
	var totalPageCnt;
	totalPageCnt = listView(); // 업체 리스트 출력 
	pagingSertting(1, totalPageCnt);
});

function listView() {
	var totalPageCnt;
	$.ajax({
		url : 'enterpriseList'
		, type : 'post' 
		, async : false
		, data : {
			pageStart : 1
		}
		, success : function(result) {
				var listView = result.listView;
				$('.enterpriseListContainer').html('');
				$.tmpl(epList_html(), listView).appendTo('.enterpriseListContainer');
				totalPageCnt = result.totalPageCnt;
			}
		, error : function (request) {
			alert(request.responseText);
			}
	});
	return totalPageCnt;
}

$(document).on('dblclick', '.listBody_ep', function() {
	var epCode = $(this)[0].title;
	 $.ajax({
			url : 'getEnterprise'
			, type : 'post'
			, dataType : "json"
			, data : {
					epCode : epCode
				}
	 		, success : function(data) {
					var epData = data.result;
	
					$('#epCode_form').val(epData.epCode);
					$('#epNm_form').val(epData.epNm);
					$('#epMgmtNm_form').val(epData.epMgmtNm);
					
					$('#epCode_container').css('display', 'block');
					$('.epMain').css('display', 'none');
					$('.epForm').css('display', 'block');
					$('#btnEpSave').css('display', 'none');
					$('#btnEpUpdate').css('display', 'inline');
					$('#btnEpDelete').css('display', 'inline');
				}
	 		, error : function (request) {
				alert(request.responseText);
				}
		});
});

$(document).on('click', '#btnEpAdd', function() {
	fromReset('form_ep');
	$('#epCode_container').css('display', 'none');
	$('.epMain').css('display', 'none');
	$('.epForm').css('display', 'block');
	$('#btnEpSave').css('display', 'inline');
	$('#btnEpUpdate').css('display', 'none');
	$('#btnEpDelete').css('display', 'none');
});

$(document).on('click', '#btnBack_epList', function() {
	$('.epMain').css('display', 'block');
	$('.epForm').css('display', 'none');
	listView();
});


function validate() {
	if ($('#epNm_form').val() == "" || $('#epNm_form').val() == null) {
		alert('업체명 항목을 입력하세요');
		return false;
	} else if ($('#epMgmtNm_form').val() == "" || $('#epMgmtNm_form').val() == null) {
		alert('업체 담당자 항목을 입력하세요');
		return false;
	} else {
		return true;
	}
}

function epSubmit(index) {
	if (index != 3) {
		if( !validate() ) {
			return false;
		}
	}

	var ep_url_state = "";
	var confirm_1 = null;
	switch(index) {
	case 1:
		confirm_1 = confirm("업체를 등록 하시겠습니까?");
		ep_url_state = "enterpriseSave";
		epData = {
			epCode : $('#epCode_form').val()
			, epNm : $('#epNm_form').val()
			, epMgmtNm : $('#epMgmtNm_form').val()
		};
		break;
	case 2:
		confirm_1 = confirm("업체를 수정 하시겠습니까?");
		ep_url_state = "enterpriseEdit";
		epData = {
				epCode : $('#epCode_form').val()
				, epNm : $('#epNm_form').val()
				, epMgmtNm : $('#epMgmtNm_form').val()
			};
		break;
	case 3:
		confirm_1 = confirm("업체를 삭제 하시겠습니까?");
		ep_url_state = "enterpriseDelete";
		epData = {
				epCode : $('#epCode_form').val()
			};
		break;
	}
	if(confirm_1) {
		$.ajax({
		    type : 'post', // 타입
		    url : ep_url_state, // URL
		    async : false, // 비동기화 여부
		    dataType : 'json', // 데이터 타입
		    data : epData ,
		    success : function(data) { // 결과 성공
		    	var result = data.result;

		    	if(result.result === 'success') {
		    		alert(result.msg);
		    		location.href = '/enterprisePage'
		    	} else if(result.result == 'fail') {
		    		alert(result.msg);
		    		return false;
		    	}
		    },
		    error : function(request) {
				alert(request.responseText);
		    	return false;
		    }
		});	
	} else {
		return false;
	}
}

function pagingSertting(pageNumber, totalPageCnt) {
	$('#enterprisePaging').bootpag({
		total: totalPageCnt,
		page: pageNumber,
		maxVisible: 5,
		leaps: true,
		firstLastUse: true,
		first: '←',
		last: '→',
		wrapClass: 'pagination',
		activeClass: 'active',
		disabledClass: 'disabled',
		nextClass: 'next',
		prevClass: 'prev',
		lastClass: 'last',
		firstClass: 'first'
	}).on("page", function(event, num){
	    console.log("Page " + num);
	    $.ajax({
			url : '/enterpriseList'
			, type : 'post'
			, dataType : "json" 
			, data : {
					pageStart : num
				}
			, success : function(result) {
				var listView = result.listView;
				$('.enterpriseListContainer').html('');
				$.tmpl(epList_html(), listView).appendTo('.enterpriseListContainer');
			}
			, error : function(request) {
				alert(request.responseText);
			}
	    });
	    if(num == 1) {
	    	$('.first').css('display', 'none');
	    	$('.prev').css('display', 'none');
	    	$('.last').css('display', 'inline');
	    	$('.next').css('display', 'inline');
	    } else if (num == totalPageCnt) {
	    	$('.last').css('display', 'none');
	    	$('.next').css('display', 'none');
	    	$('.first').css('display', 'inline');
	    	$('.prev').css('display', 'inline');
	    } else {
	    	$('.first').css('display', 'inline');
	    	$('.prev').css('display', 'inline');
	    	$('.last').css('display', 'inline');
	    	$('.next').css('display', 'inline');
	    }
	});
	$('.first').css('display', 'none');
	$('.prev').css('display', 'none');
}

// 업체 리스트 템플릿
function epList_html(){
	return '<tr class="listBody_ep" title="\${epCode}">'
	+'<td class="listHiddenField pull-left pField5">\${seqNo}</td>'
//	+'<td class="listHiddenField pull-left pField15">\${epCode}</td>'
	+'<td class="listTitle pull-left pField50">\${epNm}</td>'
	+'<td class="listHiddenField pull-left pField10">\${epMgmtNm}</td>'
	+'<td class="listHiddenField pull-left pField20">\${rgstDay}</td>'
	+'</tr>';
}