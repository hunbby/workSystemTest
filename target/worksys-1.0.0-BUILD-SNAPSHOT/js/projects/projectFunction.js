$(function() {
	$('.pjtMainContainer').css('display', 'block');
	$('.pjtFormContainer').css('display', 'none');
	var totalPageCnt;
	totalPageCnt = pjtListView(); // 프로젝트 리스트 출력

	datepicker_setting(); // 프로젝트 form 데이트 피커 조작 세팅
	pagingSertting(1, totalPageCnt);
});

function pjtListView() {
	var totalPageCnt;
	$.ajax({
		url : '/projectList'
		, type : 'post'
		, async : false
		, data : {
				pageStart : 1
			}
		, success : function(result) {
				$('.projectListContainer').html('');
				$.tmpl(pjtList_html(), result.listView).appendTo('.projectListContainer');
				totalPageCnt = result.totalPageCnt;
			}
		, error : function(request) {
			alert(request.responseText);
			}
	});
	return totalPageCnt;
}
$(document).on('dblclick', '#pjtListBody', function() {
	var pjtCode = $(this)[0].title;
	 $.ajax({
		url : 'getProjectInfo'
		, type : 'post'
		, dataType : "json" 
		, data : {
				pjtCode : pjtCode
			}
	 	, success : function(data) {
				var pjtInfo = data.projectInfo;
	
				$('#pjtCode_popup').val(pjtInfo.pjtCode);
				$('#pjtNm_popup').val(pjtInfo.pjtNm);
				$('#epCode_popup').val(pjtInfo.epCode);
				$('#enterpriseSearch').val(pjtInfo.epNm);
				$('#enterpriseSearch2').val(pjtInfo.epMgmtNm);
				$('#userNmSearch').val(pjtInfo.userNm);
				$('#userCode_popup').val(pjtInfo.userCode);
				$('#prstartdate').datepicker( "setValue", pjtInfo.pjtTermFrom);
				$('#prenddate').datepicker( "setValue", pjtInfo.pjtTermTo);
				//$('#prstartdate').val(pjtInfo.pjtTermFrom);
				//$('#prenddate').val(pjtInfo.pjtTermTo);
				$('#pjtParti_popup').val(pjtInfo.pjtParti);
				var day1 = $("#prstartdate").datepicker().val();
				var day2 =$("#prenddate").datepicker().val();
				$('#termD').val((calDateRange(day1,day2)+1));
				$('#termM').val((Math.floor(calMonthRange(day1,day2))));
				$('#btnPjtSave').css('display', 'none');
				$('#btnPjtUpdate').css('display', 'inline');
				$('#btnPjtDelete').css('display', 'inline');
				$('.pjtMainContainer').css('display', 'none');
				$('.pjtFormContainer').css('display', 'block');
			}
	 	, error : function (request) {
			alert(request.responseText);
				return false;
			}
	});
});

$(document).on('click', '#pjtAdd', function() {
	fromReset('form_pjt');
	$('#pjtCodeTogle').css('display', 'none');
	$('#btnPjtSave').css('display', 'inline');
	$('#btnPjtUpdate').css('display', 'none');
	$('#btnPjtDelete').css('display', 'none');
	$('.pjtMainContainer').css('display', 'none');
	$('.pjtFormContainer').css('display', 'block');
});

function pagingSertting(pageNumber, totalPageCnt) {
	$('#pjtPaging').unbind('page'); // 페이지 초기화
	$('#pjtPaging').bootpag({
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
			url : '/projectList'
			, type : 'post'
			, dataType : "json" 
			, data : {
					pageStart : num
				}
			, success : function(result) {
				$('.projectListContainer').html('');
				$.tmpl(pjtList_html(), result.listView).appendTo('.projectListContainer');
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

function pjtList_html(){
	return '<tr class="listBody" id="pjtListBody" title="\${pjtCode}">'
	+'<td class="listHiddenField pull-left pField5">\${seqNo}</td>'
//	+'<td class="listHiddenField pull-left pField15" > \${pjtCode}</td> "'
	+'<td class="listTitle pull-left pField20">\${pjtNm}</td>'
	+'<td class="listTitle pull-left pField20">\${epNm}</td>'
	+'<td class="listHiddenField pull-left pField10">\${userNm}</td>'
	+'<td class="listHiddenField pull-left pField20">\${pjtTermFrom} ~ \${pjtTermTo}</td>'
	+'<td class="listHiddenField pull-left pField20">\${rgstDay}</td>'
	+'</tr>';
}