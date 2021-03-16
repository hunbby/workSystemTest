<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/include/header.jsp"%>

<!-- script -->
<script src="/js/notice/notice.js"></script>
<!--  달력 -->
<link href="/js/datepicker/datepicker.css" rel="stylesheet" type="text/css">
<script src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/dayCalculation.js"></script>
<!--  ckeditor -->
<script src="/js/ckeditor/ckeditor.js"></script>
<!--  script -->


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
						<s:message code="notice.notice" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>

				<div class="noticeMain">
					<!-- /.row -->
					<div class="row">
					<div class="col-lg-12">
						<button type="button" class="btn btn-default pull-right"
							onclick="fn_moveToURL('noticeRgst')" id="btnAdd">
							<i class="fa fa-edit fa-fw"></i>
							<s:message code="board.new" />
						</button>
				</div>
			</div>

			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="pField100">
					<thead>
						<tr class="listHead">
							<td class="listHiddenField pull-left pField10">번호</td>
							<td class="listHiddenField pull-left pField60">제목</td>
							<td class="listHiddenField pull-left pField10">담당자이름</td>
							<td class="listHiddenField pull-left pField20">작성일자</td>
						</tr>
					</thead>
					<tbody class="noticeListContainer">
					</tbody>
					</table>
				</div>
			</div>	
		</div>
		<div class="noticeForm" style="display: none">
			<jsp:include page="noticeChg.jsp"></jsp:include>
		</div>	
		</div>
		
	</div>

</body>
</html>