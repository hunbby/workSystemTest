<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>	

	  	<div class="modal-dialog modal-lg" role="document" id="div_reload">
		    <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <div class="col-lg-3 pull-right">

					</div>
                    <h4 class="modal-title" id="myModalLabel"><s:message code="memu.dept"/></h4>
                </div>
                
                <div class="modal-body">
				<!-- /.row -->
		            <div class="row">
		            	<div class="col-lg-3" >
			            	 <div class="panel-body">
				            	<div class="panel panel-default" > <!-- panel-body 로 바꿔볼 것 -->
				                    <div style="max-height:400px; overflow:auto;" >
								    	<div class="tree2">
										</div>
									</div>
								</div>
							</div>
		                </div> 
		            	<div class="col-lg-9" >
			                    <div class="panel-body" id="deptlist">
						            <form id="form1" name="form1" role="form" method="post">
										<div class="panel panel-default">
											<div class="panel-body">
												<input type="hidden" class="form-control" id="deptCode"
														name=deptCode maxlength="6"
														value="" >
												<div class="row form-group">
													<label class="col-lg-3">
													<s:message code="user.deptnm" /> (*)</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" id="deptNm" name="deptNm"
															maxlength="30" value="">
													</div>
												</div>
												<div class="row form-group">
													<label class="col-lg-3">
														LV (*)
													</label>
													<div class="col-lg-9">
														<label class="radio-inline">
															<input type="radio"
																name="deptLV" value="1"
																checked="checked"
																id="checkLv1"
																onclick="lvSelect(this.value)" >
																Lv 1
														</label> 
														<label class="radio-inline">
															<input type="radio" 
																name="deptLV" value="2"
																id="checkLv2"
																onclick="lvSelect(this.value)" >
																Lv 2
														</label>
													</div>
												</div>
												<div class="row form-group" id="selectMenu1" style="display: none;">
													<label class="col-lg-3">
														<s:message code="dept.parent" />
													</label>
													<div class="col-lg-9">
														<select class="form-control" name="deptParent" id="deptParentList">
		
														</select>
													</div>
												</div>
												<div class="row form-group">
													<label class="col-lg-3"><s:message code="common.etc" /></label>
													<div class="col-lg-9">
														<textarea class="form-control" id="deptRemarks" 
														name="deptRemarks" ></textarea>
													</div>
												</div>
												<input type="hidden" id="deptCodeList" name="deptCodeList" value="">
											</div>
										</div>
									</form>
							    </div>    
							</div>
		            </div>
            	<!-- /.row -->                
                </div>
              
                <div class="modal-footer">
						<button class="btn btn-default pull-left" id="btnListDelete"
							onclick="myDeptSubmit(4)">
							체크 항목 제거
						</button>

                    	<button type="button" class="btn btn-default pull-right"  id="close_custom" onclick="custom_close()"><s:message code="common.btnClose"/></button>

						<button class="btn btn-default pull-right" id="btnDeptSave"
							onclick="myDeptSubmit(1)">
							<s:message code="board.append" />
						</button>

						<button class="btn btn-default pull-right" id="btnDeptEdit"
							onclick="myDeptSubmit(2)">
							<s:message code="common.btnUpdate" />
						</button>
						<button class="btn btn-default pull-right" id="btnDeptDelete"
							onclick="myDeptSubmit(3)">
							<s:message code="common.btnDelete" />
						</button>
 
                </div>
		    </div>
	  	</div>
	  
<script>
	function myDeptSubmit(index) {
		if(index == 1) {
			$("#form1").attr('action', 'deptSave');
		}
		else if(index == 2) {
			$("#form1").attr('action', 'deptEdit');
		}
		else if(index == 3) {
			$("#form1").attr('action', 'deptDelete');
		}
		else if(index == 4) {
			$("#form1").attr('action', 'deptListDelete');
		}
		$("#form1").submit();
	}	
</script>
		