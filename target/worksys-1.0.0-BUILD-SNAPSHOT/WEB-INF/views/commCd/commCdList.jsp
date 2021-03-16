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
							<s:message code="commcd.commcd" />
						</h1>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-12">
					<button type="button" class="btn btn-default pull-right"
						onclick="fn_moveToURL('commCdRgst')">
						<i class="fa fa-edit fa-fw"></i>
						<s:message code="board.new" />
					</button>
					</div>
				</div>
				
				<!-- /.row -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="listHead">
							<div class="listHiddenField pull-left" style="width: 20%">
								<s:message code="commcd.cdId" />
							</div>
							<div class="listHiddenField pull-right" style="width: 20%">
								<s:message code="commcd.cdOrder" />
							</div>
							<div class="listHiddenField pull-right" style="width: 20%">
								<s:message code="commcd.userF" />
							</div>
							<div class="listHiddenField pull-right" style="width: 20%">
								<s:message code="commcd.paCdId" />
							</div>
							<div class="listTitle" style="width: 20%">
								<s:message code="commcd.cdNm" />
							</div>
						</div>
	
						<c:forEach var="list" items="${list}" varStatus="status">
							<div class="listBody">
								<div class="listHiddenField pull-left" style="width: 20%">${list.cdId}</div>
								<c:url var="link" value="commCdDetail">
									<c:param name="cdId" value="${list.cdId}" />
								</c:url>
								<div class="listHiddenField pull-right" style="width: 20%">${list.cdOrder}</div>
								<div class="listHiddenField pull-right" style="width: 20%">${list.userF}</div>
								<div class="listHiddenField pull-right" style="width: 20%">${list.paCdId}</div>
								<div class="listTitle" style="width: 20%">
									<a href="${link}"><c:out value="${list.cdNm}" /></a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
	
				<c:if test="${list.size()==0}">
					<div class="listBody height200"></div>
				</c:if>
	
				<form>
					<!-- form -->
				</form>
		</div>
	</div>
</body>
</html>