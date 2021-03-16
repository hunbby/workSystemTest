<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/header.jsp"%>

		<!--  달력 -->
		<link href="/js/datepicker/datepicker.css" rel="stylesheet" type="text/css">
		<script src="/js/datepicker/bootstrap-datepicker.js"></script>
		<script src="/js/datepicker/dayCalculation.js"></script>
		<!--  ckeditor -->
		<script src="/js/ckeditor/ckeditor.js"></script>
	
		<!--  시작 -->
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
	<script type="text/javascript">
			function commCdDelete(cdId) {
				var form = $('#form1');
				form.attr('action', '/commCd/commCdDelete');
				form.attr('method', 'POST');
				form.submit();
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
						<s:message code="commcd.commcd" />
					</h1>
				</div>
			</div>
			
			<!-- /.row -->
			
			<div class="row">
				<form id="form1" name="form1" role="form"
					action="/commCd/commCdUp" method="post">
					<div class="panel panel-default">
						<div class="panel-body">
	 						<div class="row form-group">
								<label class="col-lg-2"><s:message code="commcd.cdId" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="cdId" name="cdId" maxlength="30"	value='<c:out value="${list.cdId}"/>' readonly>
								</div>
							</div> 
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="commcd.cdNm" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="cdNm" name="cdNm" maxlength="255"	value='<c:out value="${list.cdNm}"/>'>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="commcd.paCdId" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="paCdId"	name="paCdId" maxlength="255"	value='<c:out value="${list.paCdId}"/>'>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="commcd.userF" /></label>
								<div class="col-lg-8">
									<label class="radio-inline">
										<input type="radio"	name="userF" value="0"
											<c:if test="${list.userF==0}">checked</c:if>>
											<s:message code="commcd.status0" />
									</label>
									<label class="radio-inline">
										<input type="radio" name="userF" value="1"
											<c:if test="${list.userF==1}">checked</c:if>>
											<s:message code="commcd.status1" />
									</label> 
									<!-- <input type="text" class="form-control" id="userF"	name="userF" maxlength="255"	value='<c:out value="${list.userF}"/>'>-->
								</div>
							</div>
							
								<div class="row form-group">
								<label class="col-lg-2"><s:message code="commcd.cdOrder" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="cdOrder"
										name="cdOrder" maxlength="255"
										value="<c:out value="${list.cdOrder}"/>">
								</div>
							</div>
							
						</div>
					</div>
						
					<input type="button" class="btn btn-outline btn-primary" onclick="location.href='/commCd/commCdList'"value="목록">
					<input type="submit" class="btn btn-outline btn-primary pull-right field60" value="수정">
					<input type="button" class="btn btn-outline btn-primary pull-right field60" onclick="commCdDelete()" value="삭제">
				</form>

			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

</body>

</html>
