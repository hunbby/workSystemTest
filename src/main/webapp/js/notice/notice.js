$(function() {
	console.log("1111");
	
	list(); 
});

function list() {
	$.ajax({
		url : '/notice/noticeList',
		type : 'post' 
	}).success(function(result) {
		console.log(result);

		var list = result.list.result;
		var list_html = '';
			$.each(list, function(idx,row) {
				list_html = list_html 	
				+'<tr class="listBody" id="listBody_notice" title="' + list[idx].idx+ '">'
				+'<td class="listHiddenField pull-left"  style="width: 10%" >'+list[idx].seqNo+'</td>'
				+'<td class="list pull-left pField60" style="width: 60%" >'+list[idx].subject+'</td>'
				+'<td class="listHiddenField pull-left" style="width: 10%">'+list[idx].userNm+'</td>'
				+'<td class="listHiddenField pull-left"  style="width: 20%" >'+list[idx].rgstDay+'</td>'
				+'</tr>';
		});
			$('.noticeListContainer').html(list_html);
	});
}

			
	$(document).on('dblclick', '#listBody_notice', function() {
		var idx = $(this)[0].title;
		 $.ajax({
			url : '/notice/noticeDetail',
			type : 'get',
			dataType : "json" ,
			data : {
						idx : idx
					}
			}).success(function(data) {
				console.log(data);
				var data = data.list; //D
/*					$('#idx').val(list.idx);..*/
				
				CKEDITOR.instances.content.setData(data.content);
					$('#idx').val(data.idx);
					$('#userCode').val(data.userCode);
					
					$('#subject').val(data.subject);
					$('#content').val(data.content);
				
					$('.noticeMain').css('display', 'none');
					$('.noticeForm').css('display', 'block');
					
					$('#btnSave').css('display', 'none');
					$('#btnUpdate').css('display', 'inline');
					$('#btnDelete').css('display', 'inline');
				});
		});	
			

$(document).on('click', '#btnAdd', function() {
	$('#noticeListContainer').css('display', 'none');
	
	$('.noticeMain').css('display', 'block');
	$('.noticeForm').css('display', 'none');
	
	$('#btnSave').css('display', 'inline');
	$('#btnUpdate').css('display', 'none');
	$('#btnDelete').css('display', 'none');
});

$(document).on('click', '#btnBack', function() {
	$('.noticeMain').css('display', 'block');
	$('.noticeForm').css('display', 'none');
	list();
});
/** ?????? ?????? ?????? ???????????? ??????*/
function notice(index) {
	var url_state = "";
	var confirm_1 = null;
	switch(index) {
	case 1: 
		confirm_1 = confirm("?????? ???????????????????");
		url_state = "noticeWrite";
		break;
	case 2:
		confirm_1 = confirm("?????? ???????????????????");
		url_state = "noticeUp";
		break;
	case 3:
		confirm_1 = confirm("?????? ???????????????????");
		url_state = "noticeDelete";
		break;
	}
	if(confirm_1) {
	$.ajax({
	    type : 'post',
	    url : url_state, 
	    async : false, 
	    dataType : 'json', 
	    data : {		
	    	  subject : $('#subject').val()
			, content : CKEDITOR.instances.content.getData()
			, idx : $('#idx').val()
			},
	    success : function(data) { 
	    	console.log("fff:"+data); 
	    	var result = data.list.msg;

	    	if(result === 'success') {
	    		alert("success");
	    		location.href = '/notice/noticePage';
	    	} else if(result === '????????? ????????? ??????????????????.') {
	    		alert(result);
	    		return false;
	    	}
	    	
	    },
	    error : function(e) { // ?????? ??????
	    	console.log(e);
	    	return false;
	    }
	});
	} else {
		return false;
	}

}

/** ?????? ?????? ??? ??????????????? ?????? */
$(document).on('click', '#btnSave', function(e){
	if(valiControl()) {
		$('#form1').submit();
	} else {
		return false;
	}
	
})
/** ??????????????? ?????? (??????)*/
function valiControl(){
	
	if($("#subject").val() == "" || $("#subject").val() == null){
		alert("????????? ???????????????");
		return false;
	}
/*	if($("#content").val() == "" || $("#content").val() == null){
		alert("????????? ???????????????.");
		return false;
	}*/


	
	return true;
}

