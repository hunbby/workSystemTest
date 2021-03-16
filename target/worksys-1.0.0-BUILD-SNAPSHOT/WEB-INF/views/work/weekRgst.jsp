<%@ include file="/WEB-INF/include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<link href="/js/datepicker/datepicker.css" rel="stylesheet"
	type="text/css">
<script src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/dayCalculation.js"></script>
<%-- <script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
 --%>
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
	//달력함수
	function fn_moveDate(date) {
		$.ajax({
			url : "moveDate",
			type : "post",
			data : {
				date : date
			},
			success : function(result) {
				$("#calenDiv").html(result);
			}
		})
	}
	window.onload = function() {
		$('#prstartdate').datepicker().on('changeDate', function(ev) {
			if (ev.viewMode == "days") {
				$('#prstartdate').datepicker('hide');
			}
			var day1 = $("#prstartdate" ).datepicker().val();
			var day2 =$("#prenddate" ).datepicker().val();
			$('#termD').attr('value',(calDateRange(day1,day2)+1));
			console.log(calMonthRange(day1,day2));
		});
		$('#prenddate').datepicker().on('changeDate', function(ev) {
			if (ev.viewMode == "days") {
				$('#prenddate').datepicker('hide');
			}
			var day1 = $("#prstartdate" ).datepicker().val();
			var day2 =$("#prenddate" ).datepicker().val();
			$('#termD').attr('value',(calDateRange(day1,day2)+1));
			console.log(calMonthRange(day1,day2));
		});
	//프로젝트 명을 선택하였을때 팝업

	$('#pjtNm').on('click', function() {
		$.ajax({
			url : '/work/popupProject', //html파일의 url
			type : 'post'
		}).success(function(result) {
			$('#popupProject').html(result);
		});
		$('#popupProject').modal('show');
	});
	
	
	//작성자를 선택하였을때 팝업
	$('#userCode').on('click', function() {
		$.ajax({
			url : '/work/popupUser', //html파일의 url
			type : 'post'
		}).success(function(result) {
			$('#popupUser').html(result);
		});
		$('#popupUser').modal('show');
	});
 }


</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../common/navigation.jsp" />
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<i class="fa fa-gear fa-fw"></i>
						<s:message code="week.week" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<form id="form1" name="form1" role="form" action="/work/weekWrite" method="post">
						<div class="panel panel-default">
						<div class="panel-body">		
<%-- 						<div class="row form-group">
							<label class="col-lg-2"><s:message code="crud.weekCode" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="weekCode" name="weekCode" maxlength="255"	value="<c:out value="${list.weekCode}"/>">
								</div>
						</div> --%>
						<div class="row form-group">
							<label class="col-lg-2"><s:message code="crud.day" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="prstartdate" name="weekDay" maxlength="255"	value="<c:out value="${list.weekDay}"/>">
								</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2"><s:message code="crud.userCode" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="userCode"	name="userCode" maxlength="255"	value="<c:out value="${list.userCode}"/>" readonly>
								</div>
						</div>
						
						<input type="hidden" name="userNm" id="userNm"> 
						
						<div class="row form-group">
							<label class="col-lg-2"><s:message code="crud.dept" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="deptCode" name="deptCode" maxlength="255"	value="<c:out value="${list.deptCode}"/>">
								</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2"><s:message code="crud.pjtCode" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="pjtNm" name="pjtNm" maxlength="255"		value="<c:out value="${list.pjtCode}"/>" readonly>
								</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2"><s:message code="crud.EpNm" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="epMgmtNm"	name="epMgmtNm" maxlength="255"		value="<c:out value="${list.epMgmtNm}"/>">
								</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2"><s:message code="crud.content" /></label>
								<div class="col-lg-8">
									<textarea class="form-control" id="content" name="content"><c:out		value="${list.content}" /></textarea>
								</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2"><s:message code="crud.issue" /></label>
								<div class="col-lg-8">
									<textarea class="form-control" id="issue" name="issue"><c:out		value="${list.issue}" /></textarea>
								</div>
						</div>
					</div>	
				</div>
						<input type="submit" class="btn btn-outline btn-primary" value="등록">
				</form>
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
		<!-- /#wrapper -->
		<div id="popupProject" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"></div>
		<div id="popupUser" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"></div>
</body>
</html>
