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
			$(document).on('ready', function() {
				console.log('start');
				
				CKEDITOR.replace('content');
				CKEDITOR.instances.content.setData("<c:out value='${list.content}' escapeXml='true'/>");
			});
			function noticeDelete(idx) {
				var form = $('#form1');
				form.attr('action', '/notice/noticeDelete');
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
						<s:message code="notice.notice" />
					</h1>
				</div>
			</div>

			<!-- /.row -->
			<div class="row">
				<form id="form1" name="form1" role="form" action="/notice/noticeUp" method="post">
					<div class="panel panel-default">
						<div class="panel-body">
	 						<div class="row form-group">
								<label class="col-lg-2"><s:message code="notice.idx" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="idx" name="idx" maxlength="30"	value='<c:out value="${list.idx}"/>' readonly>
								</div>
							</div> 
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="notice.userCode" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="userCode" name="userCode" maxlength="255"	value='<c:out value="${list.userCode}"/>'>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="notice.subject" /></label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="subject"	name="subject" maxlength="255"	value='<c:out value="${list.subject}"/>'>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="notice.content" /></label>
								<div class="col-lg-8">
									<textarea id="content" name="content" rows="10" cols="80"></textarea>
								</div>
							</div>
						</div>
					</div>
					
					<input type="button" class="btn btn-outline btn-primary" onclick="location.href='/notice/noticeList'"value="목록">
					<input type="submit" class="btn btn-outline btn-primary pull-right field60" value="수정">
					<input type="button" class="btn btn-outline btn-primary pull-right field60" onclick="noticeDelete()" value="삭제">
				</form>

			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
		<!-- /#wrapper -->
	<div id="popupProject" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	</div>
</body>

</html>
