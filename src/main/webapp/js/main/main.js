$(function() {
	test();
})

function test() {
	$.ajax({
		url : '/main/popupNotice', 
		type : 'post',
		success : function(result) {
			var list = result.list;
			$('.noticeListContainer').html('');
			//var result = result.list;
			
			//$.tmpl(noticeList_html(), result).appendTo('.noticeListContainer');
			var notice_html = '';
			for(var i =0 ; i < list.length; i++) {
				notice_html = notice_html + '<div>----------------------------</div><br>' + list[i].content;
			}
			$('.noticeListContainer').html(notice_html);
			$('#popupNotice').modal('show');
			
		}
	});
	
	$.ajax({
		url : '/main/pjtTerm'
		, type : 'post'
		, success : function(data) {
			$('#calendar').fullCalendar({
				locale: 'ko'
				, eventLimit: true
				, eventLimitText: "더보기"
				, events: data.pjtTerm
//			    , eventClick : function (calEvent, jsEvent, view) {
//			    	console.log(calEvent.title);
//			    	console.log(calEvent.start.format('YYYY-MM-DD'));
//			    }
				, eventRender: function(event, element) {
//					console.log(event.title + ' : ' + event._id);
//					console.log(event);
//					if(event.title == '개인별프로젝트2') {
//						element.css({
//							'background-color': '#333333',
//			                'border-color': '#333333'});
//					}
					$(element).on({
						dblclick: function() {
							$('#popupWorkContentHeader').text(event.title);
							$('#popupWorkContentDate').text(event.start.format('YYYY년 MM월 DD일'));
							$('#popupWorkContent').val(event.description);
							$('#popupWorkIssue').val(event.issue);
							$('#popupWorkDescription').modal('show');
						} 
					});
				}
			  })
		}
		, error : function(e) {
			alert(e);
			return false;
		}
	});
}
//function noticeList_html(){
//	return '<tr class="listBody_notice" id="rgstDay">'
////	+'<td class="listHiddenField pull-left pField5" title="\${seqNo}">\${seqNo}</td>'
////	+'<td class="listHiddenField pull-left pField20" title="\${subject}">\${subject}</td>'
//	+'<td class="listHiddenField pull-left pField60" title="\${content}">\${content}</td>'
////	+'<td class="listHiddenField pull-left pField20" title="\${rgstDay}">\${rgstDay}</td>'
//	+'</tr>';
//}
