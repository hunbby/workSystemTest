<%@ include file="/WEB-INF/include/header.jsp"%>
<title>Project</title>

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

			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<button type="button" class="btn btn-default pull-right"
						onclick="fn_moveToURL('enterpriseForm')">
						<i class="fa fa-edit fa-fw"></i>
						<s:message code="board.new" />
					</button>
				</div>
			</div>

			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="listHead">
						<div class="listHiddenField pull-left " style="width: 10%">
							<s:message code="enterprise.indexCd" />
						</div>
						<div class="listHiddenField pull-right " style="width: 20%">
							<s:message code="crud.crdate" />
						</div>
						<div class="listHiddenField pull-right " style="width: 10%">
							<s:message code="enterprise.usernm" />
						</div>
						<div class="listTitle textCenter" style="width: 60%"> 
							<s:message code="enterprise.prtitle" />
						</div>
					</div>

					<c:forEach var="listview" items="${listview}" varStatus="status">

						<c:url var="link" value="getEnterprise">
							<c:param name="epCode" value="${listview.epCode}" />
						</c:url>
						<div class="listBody" ondblclick="location.href='${link}'">
							<div class="listHiddenField pull-left  textCenter" style="width: 10%">
								<c:out value="${listview.epCode}" />
							</div>
							<div class="listHiddenField pull-right  textCenter" style="width: 20%">
								<c:out value="${listview.rgstDay}" />
							</div>
							<div class="listHiddenField pull-right  textCenter" style="width: 10%">
								<c:out value="${listview.epMgmtNm}" />
							</div>
							<div class="listTitle textCenter" style="width: 60%"
								title="<c:out value="${listview.epNm}"/>">
								<c:out value="${listview.epNm}" />
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<c:if test="${listview.size()==0}">
				<div class="listBody height200"></div>
			</c:if>

			<form>
				<!-- form -->
			</form>
		</div>
	</div>
</body>
</html>