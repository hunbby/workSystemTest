<%@ include file="/WEB-INF/include/header.jsp"%>
<title><s:message code="common.pageTitle" /></title>

<link href="js/datepicker/datepicker.css" rel="stylesheet"
	type="text/css">
<script src="js/datepicker/bootstrap-datepicker.js"></script>
<script src="js/datepicker/dayCalculation.js"></script>

<script>
	window.onload = function() {
		//업체 선택
		$('#enterpriseSearch, #enterpriseSearch2').on('click', function() {
			$.ajax({
				url : '/popupEnterprise',
				type : 'post'
			}).success(function(result) {
				$('#popupEnterprise').html(result);
			});
			$('#popupEnterprise').modal('show');
		});
		//사용자 선택(프로젝트 담당자)
		$('#userNm').on('click', function() {
			$.ajax({
				url : '/popupUserList',
				type : 'post'
			}).success(function(result) {
				$('#popupUserList').html(result);
			});
			$('#popupUserList').modal('show');
		});
	}
	$(document).ready(function(){
		var day1 = $("#prstartdate" ).datepicker().val();
		var day2 =$("#prenddate" ).datepicker().val();
		$('#termD').attr('value',(calDateRange(day1,day2)+1));
		$('#termM').attr('value',(Math.floor(calMonthRange(day1,day2))));		  
	});

	function mySubmit(index) {
		if (index == 1) {
			$("#form1").attr('action', 'projectSave');
		}
		if (index == 2) {
			$("#form1").attr('action', 'projectEdit');
		}
		if (index == 3) {
			$("#form1").attr('action', 'projectDelete');
		}
		$("#form1").submit();
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
						<s:message code="project.title" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>

			<!-- /.row -->
			<div class="row">
				<form id="form1" name="form1" role="form" method="post">
					<div class="panel panel-default">
						<div class="panel-body">
							<c:if test="${projectInfo.pjtCode != null}">
							<div class="row form-group">
								<label class="col-lg-2 "><s:message code="project.cd" /> (*)</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="pjtCode"
										name="pjtCode" maxlength="6"
										value="<c:out value="${projectInfo.pjtCode}"/>"
										readonly>
								</div>
							</div>
							</c:if>
							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="project.prtitle" /> (*)</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="pjtNm" name="pjtNm"
										maxlength="30" value="<c:out value="${projectInfo.pjtNm}"/>">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="enterprise.prtitle" /> (*)</label>
								<div class="col-lg-2">
									<input type="text" class="form-control enterpriseSearch"
										id="enterpriseSearch" name="epNm"
										value="<c:out value="${projectInfo.epNm}"/>" readonly>
									<input type="hidden" id="epCode" name="epCode"
										value="<c:out value="${projectInfo.epCode}"/>">
								</div>
								<label class="col-lg-2 textCenter"><s:message
										code="enterprise.usernm" /> (*)</label>
								<div class="col-lg-2">
									<input type="text" class="form-control enterpriseSearch"
										id="enterpriseSearch2" name="epMgmtNm"
										value="<c:out value="${projectInfo.epMgmtNm}"/>" readonly>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="project.usernm" /> (*)</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="userNm"
										name="userNm" value="<c:out value="${projectInfo.userNm}"/>"
										readonly> 
									<input type="hidden" id="userCode" name="userCode"
										value="<c:out value="${projectInfo.userCode}"/>">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="project.term" /> (*)</label>
								<div class="col-lg-2">
									<input class="form-control" size="16" id="prstartdate"
										name="pjtTermFrom" type="text"
										value="<c:out value="${projectInfo.pjtTermFrom}"/>" readonly>
								</div>
								<div class="col-lg-2">
									<input class="form-control" size="16" id="prenddate"
										name="pjtTermTo" type="text"
										value="<c:out value="${projectInfo.pjtTermTo}"/>" readonly>
								</div>
							</div>
							
							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="project.termD" /></label>
								<div class="col-lg-2">
									<input type="text" class="form-control" id="termD" name="termD"
										maxlength="30" 
										readonly>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="project.termM" /></label>
								<div class="col-lg-2">
									<input type="text" class="form-control" id="termM" name="termM"
										maxlength="30" 
										readonly>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="project.participation" /></label>
								<div class="col-lg-2">
									<input type="number" class="form-control" id="pjtParti" name="pjtParti"
										maxlength="30" value="<c:out value="${projectInfo.pjtParti}"/>">
								</div>
							</div>
						</div>
					</div>
					<input type="button" class="btn btn-outline btn-primary"
						onclick="location.href='/projectList'"
						value="<s:message code="board.list"/>"></input>
					<c:if test="${projectInfo.pjtCode == null}">
						<button class="btn btn-outline btn-primary pull-right field60"
							onclick="mySubmit(1)">
							<s:message code="common.btnSave" />
						</button>
					</c:if>
					<c:if test="${projectInfo.pjtCode != null}">
						<button class="btn btn-outline btn-primary pull-right field60"
							onclick="mySubmit(2)">
							<s:message code="common.btnUpdate" />
						</button>
						<button class="btn btn-outline btn-primary pull-right field60"
							onclick="mySubmit(3)">
							<s:message code="common.btnDelete" />
						</button>
					</c:if>
				</form>

			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
	<div id="popupEnterprise" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"></div>
	<div id="popupUserList" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"></div>
		
	<script> 
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
				$('#termD').attr('value',(calDateRange(day1,day2)+1));
				$('#termM').attr('value',(Math.floor(calMonthRange(day1,day2))));
			}
		}).data('datepicker');
	</script>
</body>

</html>
