<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%@ include file="/WEB-INF/include/header.jsp"%>
<title>Enterprise</title>

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

<%-- <script src="/js/formReset.js"></script> --%>
<script src="/js/enterprise/enterprise.js"></script>


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
			
			<div class="epMain">
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<button type="button" class="btn btn-default pull-right"
							id="btnEpAdd">
							<i class="fa fa-edit fa-fw"></i>
							업체 등록
						</button>
					</div>
				</div>

				<!-- /.row -->
				<div class="panel panel-default">
					<div class="panel-body">
						<table class="pField100">
						<thead>
							<tr class="listHead">
								<td class="listHiddenField pull-left pField5">No.</td>
<%-- 								<td class="listHiddenField pull-left pField15"><s:message code="enterprise.indexCd" /></td> --%>
								<td class="listHiddenField pull-left pField50"><s:message code="enterprise.prtitle" /></td>
								<td class="listHiddenField pull-left pField10"><s:message code="enterprise.usernm" /></td>
								<td class="listHiddenField pull-left pField20"><s:message code="crud.crdate" /></td>
							</tr>
						</thead>
						<tbody class="enterpriseListContainer">
						</tbody>
						</table>
					</div>
				</div>
				<div id="enterprisePaging"></div>
			</div>
			<div class="epForm" style="display: none">
				<jsp:include page="enterpriseForm.jsp"></jsp:include>
			</div>
		</div>
	</div>

</body>
</html>