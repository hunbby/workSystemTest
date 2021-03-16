<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!-- row -->
<div class="row">
	<form id="form_ep" name="form1" role="form">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row form-group" id="epCode_container">
					<input type="hidden" class="form-control" id="epCode_form" name="epCode" maxlength="6" readonly="readonly" value="">
				</div>

				<div class="row form-group">
					<label class="col-lg-2"><s:message code="enterprise.prtitle" /></label>
						<div class="col-lg-8">
							<input type="text" class="form-control" id="epNm_form" name="epNm" maxlength="30" onkeyup="chkWordLength(this, 29)" value="">
						</div>
				</div>

		 		<div class="row form-group">
					<label class="col-lg-2"><s:message code="enterprise.usernm" /></label>
						<div class="col-lg-8">
							<input type="text" class="form-control" id="epMgmtNm_form" name="epMgmtNm" maxlength="14"
								onkeyup="chkWordLength(this, 13)" value="" >
						</div>
				</div> 
			</div>
		</div>
	</form>
	<input type="button" class="btn btn-outline btn-primary"
		id="btnBack_epList"
		value="<s:message code="board.list"/>"></input>
				
	<button class="btn btn-outline btn-primary pull-right field60"
		onclick="epSubmit(1)" id="btnEpSave">
		<s:message code="common.btnSave" />
	</button>
	<button class="btn btn-outline btn-primary pull-right field60"
		onclick="epSubmit(2)" id="btnEpUpdate">
		<s:message code="common.btnUpdate" />
	</button>
	<button class="btn btn-outline btn-primary pull-right field60"
		onclick="epSubmit(3)" id="btnEpDelete">
		<s:message code="common.btnDelete" />
	</button>
</div>

