<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

	  	<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <div class="col-lg-3 pull-right">

					</div>
                    <h4 class="modal-title" id="myModalLabel">사용자 관리</h4>
                </div>
                
                <div class="modal-body">
				<!-- /.row -->
		            <div class="row">
		            	<div class="col-lg-3" >
			            	 <div class="panel-body">
				            	<div class="panel panel-default" > <!-- panel-body 로 바꿔볼 것 -->
				                    <div style="max-height:428px; overflow:auto;" >
								    	<div class="tree3">
										</div>
									</div>
								</div>
							</div>
		                </div> 
		            	<div class="col-lg-9" >
			                    <div class="panel-body" id="deptlist">
						            <form id="form_user" name="form2" role="form" method="post">
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="row form-group">

														<input type="hidden" class="form-control" id="userCode_popup"
															name="userCode" maxlength="6"
															>
	<%-- 													<label class="col-lg-3 "><s:message code="user.cd" /> (*)</label>
														<div class="col-lg-9">
															<input type="text" class="form-control" id="userCode"
																name=userCode maxlength="6"
																value=""
																readonly>
														</div> --%>
												</div>
												<div class="row form-group">
													<label class="col-lg-3"><s:message code="notice.userCode" /> (*)</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" id="userNm_popup"
															name="userNm" maxlength="6"
															onkeyup="chkWordLength(this, 5)"
															>
													</div>
												</div>
												<div class="row form-group">
													<label class="col-lg-3 "><s:message code="user.userid" /> (*)</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" id="userId_popup"
															name = "userID" maxlength = "20"
															onkeyup = "chkWordLength(this, 20)"
															onchange = "chkId()"
															>
														<div style="color: red" id="chkIdResult"></div>
													</div>
												</div>
												<div class="row form-group">
													<label class="col-lg-3 "><s:message code="common.password" /><span id="necessaryToggle"></span></label>
													<div class="col-lg-9">
														<input type="text" class="form-control" id="password_popup"
															name="password" maxlength="14"
															onkeyup="chkWordLength(this, 13)"
															>
													</div>
												</div>
												<div class="row form-group" id="selectMenu1">
													<label class="col-lg-3">
														<s:message code="user.deptnm" /> (*)
													</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" id="deptNm_user"
															name="deptNm" maxlength="6"
															readOnly >	
														<input type="hidden" name="deptCode" id="deptCode_user" >								
													</div>
												</div>
												<div class="row form-group" id="selectMenu1">
													<label class="col-lg-3">
														<s:message code="user.position" /> (*)
													</label>
													<div class="col-lg-9">
														<select class="form-control" name="position" id="position_popup">
															<option value="1">사원</option>
															<option value="2">전임</option>
															<option value="3">책임</option>
															<option value="4">수석</option>
														</select>
													</div>
												</div>
												<div class="row form-group" id="selectMenu1">
													<label class="col-lg-3">
														권한 (*)
													</label>
													<div class="col-lg-9">
														<select class="form-control" name="userAuth" id="auth_popup">
															<option value="100">일반 사용자</option>
															<option value="200">관리자</option>
														</select>
													</div>
												</div>
												<div class="row form-group">
													<label class="col-lg-3 ">E-Mail (*)</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" id="userMail_popup"
															name="userMail"
															>
													</div>
												</div>
												<div class="row form-group">
													<label class="col-lg-3 ">핸드폰 번호 (*)</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" id="userPhone_popup"
															name="userPhone" maxlength="13"
															>
													</div>
												</div>
 												<div class="row form-group">
													<label class="col-lg-3"><s:message
															code="user.state" /></label>
													<div class="col-lg-9">
														<!-- textarea class="form-control" id="prstatus" name="prstatus"><c:out value="${projectInfo.prstatus}"/></textarea -->
														<label class="radio-inline">
															<input type="radio" name="state" 
															value="0" >본사
														</label> 
														<label class="radio-inline">
															<input type="radio" name="state"
															value="1" >파견
														</label> 
														<label class="radio-inline">
															<input type="radio" name="state"
															value="2" >휴가
														</label>
													</div>
												</div>
											</div>
										</div>
									</form>
							    </div>    
							</div>
		            </div>
            	<!-- /.row -->                
                </div>
              
                <div class="modal-footer">

						<button class="btn btn-default" id="btnUserSave"
							onclick="myUserSubmit(1)">
							<s:message code="board.append" />
						</button>

						<button class="btn btn-default" id="btnUserEdit"
							onclick="myUserSubmit(2)">
							<s:message code="common.btnUpdate" />
						</button>
						<button class="btn btn-default" id="btnUserDelete"
							onclick="myUserSubmit(3)">
							<s:message code="common.btnDelete" />
						</button>

                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close_custom" onclick="custom_close2()"><s:message code="common.btnClose"/></button>
                </div>
		    </div>
	  	</div>