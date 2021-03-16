<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

			<!-- /.row -->
			<div class="row">
				<form id="form_pjt" name="form1" role="form" method="post">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row form-group" id="pjtCodeTogle">
							<input type="hidden" class="form-control" id="pjtCode_popup" name="pjtCode" maxlength="6">
							</div>

							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="project.prtitle" /> (*)</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="pjtNm_popup" name="pjtNm"
										maxlength="30" value="" onkeyup="chkWordLength(this, 29)">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="enterprise.prtitle" /> (*)</label>
								<div class="col-lg-2">
									<input type="text" class="form-control enterpriseSearch"
										id="enterpriseSearch" name="epNm"
										value="" readonly>
									<input type="hidden" id="epCode_popup" name="epCode"
										value="">
								</div>
								<label class="col-lg-2 textCenter"><s:message
										code="enterprise.usernm" /> (*)</label>
								<div class="col-lg-2">
									<input type="text" class="form-control enterpriseSearch"
										id="enterpriseSearch2" name="epMgmtNm"
										value="" readonly>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="project.usernm" /> (*)</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="userNmSearch"
										name="userNm" value=""
										readonly> 
									<input type="hidden" id="userCode_popup" name="userCode"
										value="">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message code="project.term" /> (*)</label>
								<div class="col-lg-2">
									<input class="form-control" size="16" id="prstartdate"
										name="pjtTermFrom" type="text"
										readonly>
								</div>
								<div class="col-lg-2">
									<input class="form-control" size="16" id="prenddate"
										name="pjtTermTo" type="text"
										readonly>
								</div>
							</div>
							
							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="project.termD" /></label>
								<div class="col-lg-2">
									<input type="text" class="form-control" id="termD" name="termD"
										maxlength="30" 
										readonly>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="project.termM" /></label>
								<div class="col-lg-2">
									<input type="text" class="form-control" id="termM" name="termM"
										maxlength="30" 
										readonly>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2"><s:message
										code="project.participation" /></label>
								<div class="col-lg-2">
									<input type="number" class="form-control" id="pjtParti_popup" name="pjtParti"
										maxlength="30" min="0" value="0">
								</div>
							</div>
						</div>
					</div>
					<input type="button" class="btn btn-outline btn-primary"
						id="btnBack_pjtList"
						value="<s:message code="board.list"/>" />

					<button class="btn btn-outline btn-primary pull-right field60"
							 id="btnPjtSave">
							<s:message code="common.btnSave" />
					</button>
					<button class="btn btn-outline btn-primary pull-right field60"
							 id="btnPjtUpdate">
							<s:message code="common.btnUpdate" />
					</button>
					<button class="btn btn-outline btn-primary pull-right field60"
							 id="btnPjtDelete">
							<s:message code="common.btnDelete" />
					</button>

				</form>

			</div>

	<!-- /#wrapper -->
	<div id="popupEnterprise" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<%@ include file="./popupEnterprise.jsp" %>
	</div>
	<div id="popupUserList" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<%@ include file="./popupUserList.jsp" %>
	</div>

