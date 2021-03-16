<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  ckeditor -->
<%-- <script src="/js/ckeditor/ckeditor.js"></script> --%>
<script>
 $(document).on('ready', function() {
 	console.log('start' + "${list.content}");
	
 	CKEDITOR.replace('content');
 		CKEDITOR.instances.content.setData('${list.content}');
 });
</script>

			<!-- /.row -->
			<div class="row">
				<form id="form1" name="form1" role="form" action="/notice/noticeUp" method="post">
					
					<div class="panel panel-default">
						<div class="panel-body">
							<input type="hidden" class="form-control" id="idx" name="idx" maxlength="255"	value="">
							<input type="hidden" class="form-control" id="userCode" name="userCode" maxlength="255"	value="">
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="notice.subject" /> (*) </label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="subject" name="subject" maxlength="255"	value="">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="notice.content" /> (*) </label>
								<div class="col-lg-8">
									<textarea id="content" name="content" rows="10" cols="80" ></textarea>
								</div>
							</div>
						</div>
					</div>
				</form>
					<input type="button" class="btn btn-outline btn-primary" id="btnBack" value="목록" >
					<input type="button"  class="btn btn-outline btn-primary pull-right field60" id="btnUpdate" onclick="notice(2)" value="수정">
					<input type="button" class="btn btn-outline btn-primary pull-right field60" id="btnDelete"  onclick="notice(3)" value="삭제">
			

			</div>
			<!-- /.row -->
		