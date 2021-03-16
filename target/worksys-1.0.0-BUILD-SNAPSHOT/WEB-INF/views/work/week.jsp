<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<title>week</title>

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
<%-- <script>
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
</script> --%>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../common/navigation.jsp" />
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<i class="fa fa-gear fa-fw"></i>
						<s:message code="memu.week" />
					</h1>
				</div>
			</div>

			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<button type="button" class="btn btn-default pull-right"
						onclick="fn_moveToURL('weekRgst')">
						<i class="fa fa-edit fa-fw"></i>
						<s:message code="crud.weekRgst" />
					</button>
				</div>
			</div>
			
			<!-- /.row -->
			<div class="panel-body">
				<div class="col-lg-12">
                    <div class="listHead">
                          <div class="listHiddenField pull-left" style="width: 20%">코드</div>
                          <div class="listHiddenField pull-right" style="width: 20%">등록일</div> 
                          <div class="listHiddenField pull-right" style="width: 20%">작성자</div>
                          <div class="listTitle" style="width: 40%">내용</div>
                    </div>
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
							<c:forEach var="list" items="${list}" varStatus="status">
								<div class="listBody">
									<div class="listHiddenField pull-left" style="width: 20%">${list.weekCode}</div>
									<div class="listHiddenField pull-right" style="width: 20%">${list.rgstDay}</div>
									<div class="listHiddenField pull-right" style="width: 20%">${list.userCode}</div>
										<c:url var="link" value="weekDetail">
	                    					 <c:param name="weekCode" value="${list.weekCode}" />
	                 					</c:url>
									<div class="listTitle" style="width: 40%">
										<a href="${link}"><c:out value="${list.content}"/></a>
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
</body>
</html>