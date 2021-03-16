<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

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
						<s:message code="notice.notice" />
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>

			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<button type="button" class="btn btn-default pull-right"
						onclick="fn_moveToURL('noticeRgst')">
						<i class="fa fa-edit fa-fw"></i>
						<s:message code="board.new" />
					</button>
				</div>
			</div>

			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="listHead">
						<div class="listHiddenField pull-left" style="width: 10%">
							<s:message code="notice.idx" />
						</div>
						<div class="listHiddenField pull-right" style="width: 30%">
							<s:message code="notice.prdate" />
						</div>
						<div class="listHiddenField pull-right" style="width: 30%">
							<s:message code="notice.userCode" />
						</div>

						<div class="listTitle" style="width: 30%">
							<s:message code="notice.subject" />
						</div>
					</div>

					<c:forEach var="list" items="${list}" varStatus="status">
						<div class="listBody">
							<div class="listHiddenField pull-left" style="width: 10%">${list.idx}</div>
							<c:url var="link" value="noticeDetail">
								<c:param name="idx" value="${list.idx}" />
							</c:url>
							<div class="listHiddenField pull-right" style="width: 30%">${list.rgstDay}</div>
							<div class="listHiddenField pull-right" style="width: 30%">${list.userCode}</div>

							<div class="listTitle" style="width: 30%">
								<a href="${link}"><c:out value="${list.subject}" /></a>
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