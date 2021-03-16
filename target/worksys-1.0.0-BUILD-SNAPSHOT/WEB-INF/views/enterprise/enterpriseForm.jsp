<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/include/header.jsp"%>

<script>
	function mySubmit(index) {
		if (index == 1) {
			$("#form1").attr('action', 'enterpriseSave');
		}
		if (index == 2) {
			$("#form1").attr('action', 'enterpriseEdit');
		}
		if (index == 3) {
			$("#form1").attr('action', 'enterpriseDelete');
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
						<s:message code="enterprise.title" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>

			<!-- row -->
			<div class="row">
				<form id="form1" name="form1" role="form" method="POST"
					action="enterpriseSave">

					<div class="panel panel-default">
						<div class="panel-body">
							<c:if test="${enterpriseInfo.epCode != null}">
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="enterprise.cd" /></label>
								<div class="col-lg-8">
										<input type="text" class="form-control" id="prtitle"
											name="epCode" maxlength="6" readonly="readonly"
											value="<c:out value="${enterpriseInfo.epCode}"/>">

								</div>
							</div>
							</c:if>
							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="enterprise.prtitle" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="prtitle"
										name="epNm" maxlength="30"
										value="<c:out value="${enterpriseInfo.epNm}"/>">
								</div>
							</div>

		 					<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="enterprise.usernm" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="prtitle"
										name="epMgmtNm" maxlength="14"
										value="<c:out value="${enterpriseInfo.epMgmtNm}"/>">
								</div>
							</div> 

							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="enterprise.prstatus" /></label>
								<div class="col-lg-8">
									<!-- textarea class="form-control" id="prstatus" name="prstatus"><c:out value="${projectInfo.prstatus}"/></textarea -->
									<label class="radio-inline"><input type="radio"
										name="state" value="0"
										<c:if test="${enterpriseInfo.state==0}">checked</c:if>>
									<s:message code="enterprise.prstatus0" /></label> <label
										class="radio-inline"><input type="radio" name="state"
										value="1"
										<c:if test="${enterpriseInfo.state==1}">checked</c:if>>
									<s:message code="enterprise.prstatus1" /></label> <label
										class="radio-inline"><input type="radio" name="state"
										value="2"
										<c:if test="${enterpriseInfo.state==2}">checked</c:if>>
									<s:message code="enterprise.prstatus2" /></label>
								</div>
							</div>
						</div>
					</div>
					<input type="button" class="btn btn-outline btn-primary"
						onclick="location.href='/enterpriseList'"
						value="<s:message code="board.list"/>"></input>
					<c:if test="${enterpriseInfo.epCode == null}">	
					<button class="btn btn-outline btn-primary pull-right field60"
						onclick="mySubmit(1)">
						<s:message code="common.btnSave" />
					</button>
					</c:if>
					<c:if test="${enterpriseInfo.epCode != null}">
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
</body>

</html>
