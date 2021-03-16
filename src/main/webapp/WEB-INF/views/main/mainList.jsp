<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp"%>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<link href="/js/calendar/fullcalendar.min.css" rel="stylesheet">
<script src="/js/calendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="/js/calendar/locale/ko.js" type="text/javascript"></script>
<script src="/js/main/main.js"></script>
<title><s:message code="common.pageTitle" /></title>
<style>
.col-gu {
	float: left;
	width: 14%;
	padding: 1px;
	height: 200px;
}

@media screen and (max-width: 1024px) {
	.col-gu {
		width: 33%;
	}
}

@media screen and (max-width: 450px) {
	.col-gu {
		width: 50%;
	}
}

</style>





<script>
/* $(function() {
	  $('#calendar').fullCalendar({
	    events: [
	              
 	               {
	            	   //특정 선택자를 선택후 attr 태그를 이용하여 가져오고싶다 title/start/end 어떻게 가져오지??? 얘는 프로젝트관리에있는 프로젝트 기간 칼럼을 가져와야해.. 
	            	   title: "하드코딩만되어있음",
	                   start: "2018-12-11",
	                   end: new Date()
	            	   //events: dataset
	               },
	               {
	            	   title : "Test"
	            	   , start : "2018-12-26"
	            	   , end : "2018-12-31"
	               } 
	            ]
	  })

	}); */
	
	
</script>

</head>
<body>
	<jsp:include page="../common/navigation.jsp" />

	<div id="page-wrapper">
		<div id="calendar" style="width: 70%;"></div>
	</div>

	<!-- /#wrapper -->
	<div id="popupNotice" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			<%@ include file="./popupNotice.jsp" %>
	</div>
	
	<div id="popupWorkDescription" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-mg" role="document">
		<div class="modal-content" >
	        <div class="modal-header">
				<button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3 class="modal-title" id="popupWorkContentHeader"></h3>
				<h4 class="modal-title" id="popupWorkContentDate"></h4>
			</div>
	                
			<div class="modal-body">
				<!-- /.row -->
				<div>
					<h4>진행 사항</h4>
					<textarea class="form-control" id="popupWorkContent" style="height: 230px;background-color: white;" readonly="readonly"></textarea>
					<h4>이슈 사항</h4>
					<textarea class="form-control" id="popupWorkIssue" style="height: 230px;background-color: white;" readonly="readonly"></textarea>
				</div>
				<!-- /.row -->
			</div>
			<div class="modal-end" style="text-align:right;">
			</div>
		</div>
	</div>
		
	</div>
</body>
</html>

