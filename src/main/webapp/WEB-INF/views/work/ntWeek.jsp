<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

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
function fn_moveDate(date){
    $.ajax({
        url: "moveDate",
        type:"post", 
        data : {date: date},
        success: function(result){
            $("#calenDiv").html(result);
        }
    })
}    
</script>

</head>

<body>

	<div id="wrapper">
		${ntList}
		<jsp:include page="../common/navigation.jsp" />

		<div id="page-wrapper">
			<div id="calenDiv" class="row">
				<jsp:include page="indexCalen.jsp" />
			</div>

			<div class="row">
				<div class="col-lg-12">&nbsp;</div>
			</div>

			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-send fa-fw"></i>차주 업무관리
							<div class="pull-right">
								<a href="ntWeekRgst">등록</a>
							</div>
						</div>
						<div class="panel-body">
							<div class="col-lg-12">
                                <div class="listHead">
                                    <div class="listHiddenField pull-right field100">코드</div> 
                                    <div class="listHiddenField pull-right field100">등록일</div>
                                    <div class="listHiddenField pull-right field100">작성자</div>
                                    <div class="listTitle">내용</div>
                                </div>
									<c:forEach var="NtList" items="${NtList}" varStatus="status">
											<div class="listBody">
												<div class="listHiddenField pull-right field100">${NtList.ntWeekCode}</div> 
												<div class="listHiddenField pull-right field10">${NtList.rgistDay}</div>
												<div class="listHiddenField pull-right field100">${NtList.userCode}</div>
												<c:url var="link" value="ntWeekDetail">
	                    							 <c:param name="ntWeekCode" value="${NtList.ntWeekCode}" />
	                 							 </c:url>
												<div class="listTitle">
													<a href="${link}"><c:out value="${NtList.content}"/></a>
												 </div>
											</div>
										</c:forEach>
								
		
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-volume-up fa-fw"></i>
							<s:message code="common.notice" />
						</div>
						<div class="panel-body maxHeight400">
							<c:forEach var="noticeList" items="${noticeList}"
								varStatus="status">
								<c:url var="link" value="boardRead">
									<c:param name="brdno" value="${noticeList.brdno}" />
								</c:url>
								<a href="${link}">
									<div class="listBody listTitle">
										<c:out value="${noticeList.brdtitle}" />
									</div>
								</a>
							</c:forEach>
						</div>
					</div>

				</div>
				<!-- col-lg-4 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>

</html>