$(function() {
	var totalPageCnt = userList_dept('root','root01');
	pagingSertting_user(1, totalPageCnt, 'root','root01');
})

function datepicker_setting() {
	// 데이터 피커 조작
	var checkin = $('#prstartdate').datepicker(
	).on('changeDate', function(ev) {
		var newDate = new Date(ev.date)
	  	//newDate.setDate(newDate.getDate() + 1);
	  	checkout.setValue(newDate);
	  
	  	checkin.hide();
	  	$('#prenddate')[0].focus();
	}).data('datepicker');

	var checkout = $('#prenddate').datepicker({
	  	onRender: function(date) {
	    return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
	  }
	}).on('changeDate', function(ev) {
	 	checkout.hide();
		var day1 = $("#prstartdate").datepicker().val();
		var day2 =$("#prenddate").datepicker().val();
		if(day1 != null && day2 != null) {				
			$('#termD').val((calDateRange(day1,day2)+1));
			$('#termM').val((Math.floor(calMonthRange(day1,day2))));
		}
	}).data('datepicker');
}

//업체 선택
$(document).on('click', '#enterpriseSearch, #enterpriseSearch2', function() {
	$.ajax({
		url : '/popupEnterprise'
		, type : 'post'
		, async : false
		, data : {
				pageStart : 1
			}
		, success : function(result) {
				$('.enterpriseListContainer').html('');
				$.tmpl(epList_html(), result.epListView).appendTo('.enterpriseListContainer');
				pagingSertting_ep(1, result.totalPageCnt);
				$('#popupEnterprise').modal('show');
			}
		, error : function (request) {
			alert(request.responseText);
				return false;
			}
	});
});

$(document).on('dblclick', '#epListBody', function() {
	$('#epCode_popup').val($(this).attr('title'));
	$('#enterpriseSearch').val($(this).children().eq(1).attr('title'));
	$('#enterpriseSearch2').val($(this).children().eq(2).attr('title'));
	$('#popupEnterprise').modal('hide');
});

//사용자 선택(프로젝트 담당자)
$(document).on('click', '#userNmSearch', function() {
	$.ajax({
		url : '/popupUserList'
		, type : 'post'
		, async : false
		, data : {
				pageStart : 1
				, deptCode : 'root'
				, deptParent : 'root01'
			}
		, success : function(result) {
				treeMaker_basic3(JSON.parse(result.treeStr));
				$('.listviewContainer').html('');
				$.each(result.userListView, function(index, item) {
					if(item.position == 1) {
						item.position = '사원';
					} else if (item.position == 2) {
						item.position = '전임';
					} else if (item.position == 3) {
						item.position = '책임';
					} else if (item.position == 4) {
						item.position = '수석';
					}
				});
				$.tmpl(deptUserList_html(), result.userListView).appendTo('.listviewContainer');	
			}
		, error : function (request) {
			alert(request.responseText);
				return false;
			}
	});
	$('#popupUserList').modal('show');
});

$(document).on('dblclick', '#userListBody', function() {
	$('#userCode_popup').val($(this).attr('title'));
	$('#userNmSearch').val($(this).children().eq(2).attr('title'));
	$('#popupUserList').modal('hide');
});

$(document).on('click', '#btnBack_pjtList', function() {
	$('.pjtMainContainer').css('display', 'block');
	$('.pjtFormContainer').css('display', 'none');
});

$(document).on('click', '#btnPjtSave', function(event) {
	event.preventDefault();
	pjtSubmit(1);
	return false;
});

$(document).on('click', '#btnPjtUpdate', function(event) {
	event.preventDefault();
	pjtSubmit(2);
	return false;
	
});

$(document).on('click', '#btnPjtDelete', function(event) {
	event.preventDefault();
	pjtSubmit(3);
	return false;
});

function pjtValidate() {
	if ($('#pjtNm_popup').val() == "" || $('#pjtNm_popup').val() == null) {
		alert('프로젝트 명을 입력 해주세요');
		return false;
	} else if ($('#epCode_popup').val() == "" || $('#epCode_popup').val() == null) {
		alert('업체를 선택 해주세요');
		return false;
	} else if ($('#userCode_popup').val() == "" || $('#userCode_popup').val() == null) {
		alert('담당자를 선택 해주세요');
		return false;
	} else if ( $('#prstartdate').val() == "" || $('#prstartdate').val() == null
				|| $('#prenddate').val()== "" || $('#prenddate').val() == null) {
		alert('프로젝트 기간을 설정 해주세요');
		return false;
	} else {
		return true;
	}
}

// 프로젝트 등록, 수정, 삭제
function pjtSubmit(index) {
	if (index != 3) {
		if ( !pjtValidate() ) {
			return false;
		}
	}
	
	var pjt_url_state = null;
	var confirm_2 = null;
	if (index == 1) {
		confirm_2 = confirm("프로젝트를 등록 하시겠습니까?");
		pjt_url_state = '/projectSave';
	}
	else if (index == 2) {
		confirm_2 = confirm("프로젝트를 수정 하시겠습니까?");
		pjt_url_state = '/projectEdit';
	}
	else if (index == 3) {
		confirm_2 = confirm("프로젝트를 삭제 하시겠습니까?");
		pjt_url_state = '/projectDelete';
	}
	
	if(confirm_2) {
		$.ajax({
		    type : 'post', // 타입
		    url : pjt_url_state, // URL
		    async : false, // 비동기화 여부
		    dataType : 'json', // 데이터 타입
		    data : {
		    	pjtCode : $('#pjtCode_popup').val()
		    	, epCode : $('#epCode_popup').val()
		    	, userCode : $('#userCode_popup').val()
		    	, pjtNm : $('#pjtNm_popup').val()
		    	, pjtTermFrom : $('#prstartdate').val()
		    	, pjtTermTo : $('#prenddate').val()
		    	, pjtParti : $('#pjtParti_popup').val()
		    },
		    success : function(data) { // 결과 성공
		    	var result = data.result;

		    	if(result.result == 'success') {
		    		alert(result.msg);
		    		location.href = '/projectMgmt'
		    	} else if(result.result == 'fail') {
		    		alert(result.msg);

		    	}
		    },
		    error : function(request) {
				alert(request.responseText);
		    	console.log(e);
		    }
		});	
	}
}

function treeMaker_basic3(treeNode) {
	if($(".tree4").dynatree() != null){			
		$(".tree4").dynatree("destroy");
	}
	
	$(".tree4").dynatree({
		children: treeNode
		, onActivate: function(node){
			var totalPageCnt = userList_dept(node.data.key, null);
			pagingSertting_user(1, totalPageCnt, node.data.key, null);
		}
		, selectMode: 1
	});
	$(".tree4").dynatree("getRoot").visit(function(node){
	 	node.expand(true);
	 });
}

//부서별 사용자 리스트 출력
function userList_dept(node_key, node_parentkey) {
	var totalPageCnt;
	 $.ajax({
		url : '/getDeptUserList'
		, type : 'post'
		, async : false
		, data : {
				deptCode : node_key
				, deptParent : node_parentkey
				, pageStart : 1
			}
	 
	 	, success : function(result) {
				$('.listviewContainer').html('');
				$.each(result.listview, function(index, item) {
					if(item.position == 1) {
						item.position = '사원';
					} else if (item.position == 2) {
						item.position = '전임';
					} else if (item.position == 3) {
						item.position = '책임';
					} else if (item.position == 4) {
						item.position = '수석';
					}
				});
				totalPageCnt = result.totalPageCnt;
				$.tmpl(deptUserList_html(), result.listview).appendTo('.listviewContainer');
			}
	 	, error : function (request) {
			alert(request.responseText);
				return false;
			}
		});
	 return totalPageCnt;
}

function pagingSertting_ep(pageNumber, totalPageCnt) {
	$('#popupEpPaging').unbind('page'); // 페이지 초기화
	$('#popupEpPaging').bootpag({
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

function pagingSertting_user(pageNumber, totalPageCnt, node_key, node_parentkey) {
	$('#popupUserPaging').unbind('page'); // 페이지 초기화
	$('#popupUserPaging').bootpag({
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
			url : '/getDeptUserList'
			, type : 'post'
			, dataType : "json" 
			, data : {
					pageStart : num
					, deptCode : node_key
					, deptParent : node_parentkey
				}
		 	, success : function(result) {
				$('.listviewContainer').html('');
				$.each(result.listview, function(index, item) {
					if(item.position == 1) {
						item.position = '사원';
					} else if (item.position == 2) {
						item.position = '전임';
					} else if (item.position == 3) {
						item.position = '책임';
					} else if (item.position == 4) {
						item.position = '수석';
					}
				});
				totalPageCnt = result.totalPageCnt;
				$.tmpl(deptUserList_html(), result.listview).appendTo('.listviewContainer');	
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

//업체 리스트 템플릿
function epList_html(){
	return '<tr class="listBody_ep" id="epListBody" title="\${epCode}">'
//	+'<td class="listHiddenField pull-left pField10" title="\${epCode}">\${epCode}</td>'
	+'<td class="listHiddenField pull-left pField60" title="\${epNm}">\${epNm}</td>'
	+'<td class="listHiddenField pull-left pField10"title="\${epMgmtNm}">\${epMgmtNm}</td>'
	+'<td class="listHiddenField pull-left pField20">\${rgstDay}</td>'
	+'</tr>';
}

// 사용자 리스트 템플릿
function deptUserList_html() {
	return '<tr class="listBody_user" id="userListBody" title="\${userCode}">'
//	+'<td class="listHiddenField pull-left pField10" title="\${userCode}">\${userCode}</td>'
	+'<td class="listHiddenField pull-left pField20">\${userID}</td>'
	+'<td class="listHiddenField pull-left pField20" title="\${userNm}">\${userNm}</td>'
	+'<td class="listHiddenField pull-left pField20" title="\${deptCode}">\${deptCode}</td>'
	+'<td class="listHiddenField pull-left pField20">\${position}</td>'
	+'<td class="listHiddenField pull-left pField10">\${state}</td>'
	+'</tr>';
}
