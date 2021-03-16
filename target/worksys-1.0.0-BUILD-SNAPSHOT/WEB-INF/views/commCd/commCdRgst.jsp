<%@ include file="/WEB-INF/include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<script src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/dayCalculation.js"></script>
<script src="/js/commCd/commCd.js"></script>
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
<script>
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
					action="/commCd/commCdWrite" method="post">
					<div class="panel panel-default">
						<div class="panel-body">

							<div class="row form-group">
								<label class="col-lg-2"><s:message code="commcd.commcd" /> (*) </label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="cdId" name="cdId" onchange="cdChk();"
										maxlength="10" value="<c:out value="${list.cdId}"/>">
									<div id="membr_idCheck" class="check_line" style="color:red"></div>
								</div>
							
									
							
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="commcd.cdNm" /> (*)</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="cdNm" name="cdNm"
										maxlength="15" value="<c:out value="${list.cdNm}"/>">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="commcd.paCdId" /> (*) </label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="paCdId"
										name="paCdId" maxlength="15"
										value="<c:out value="${list.paCdId}"/>">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="commcd.userF" />(*) </label>
								<div class="col-lg-8">
									<label class="radio-inline">
										<input type="radio"	name="userF" value="Y" id="userF" checked="checked"
											<c:if test="${list.userF==Y}"></c:if>>
											<s:message code="commcd.status0" />
									</label>
									<label class="radio-inline">
										<input type="radio" name="userF" value="N" 
											<c:if test="${list.userF==N}"></c:if>>
											<s:message code="commcd.status1" />
									</label> 
									<!-- <input type="text" class="form-control" id="userF"	name="userF" maxlength="255"	value='<c:out value="${list.userF}"/>'>-->
								</div>
							</div>
							
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="commcd.cdOrder" /> (*) </label>
								<div class="col-lg-2">
									<input type="number" min="1"  max="30" class="form-control" id="cdOrder"
										name="cdOrder" maxlength="30"
										value="<c:out value="${list.cdOrder}"/>">
								</div>
							</div>
						</div>	
						</div>
						<input type="button" class="btn btn-outline btn-primary" onclick="location.href='/commCd/commCdList'"value="목록">
						<input type="button" class="btn btn-outline btn-primary pull-right field60"  id="eval" onclick="button_event2()" value="등록">
				</form>

			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

</body>

</html>
