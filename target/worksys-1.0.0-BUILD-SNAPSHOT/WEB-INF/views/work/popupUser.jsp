<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!-- modal -->
	  	<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <div class="col-lg-3 pull-right">
		                   	<div class="input-group custom-search-form">
	                        	<input class="form-control" type="text" id="keyword4Users" name="keyword4Users" onkeydown="if(event.keyCode == 13) { fn_searchEnterprise();}">
	                            <span class="input-group-btn">
	                            	<button class="btn btn-default" onclick="fn_searchEnterprise()"><i class="fa fa-search"></i></button>
	                            </span>
	                       	</div>
					</div>
                    <h4 class="modal-title" id="myModalLabel"><s:message code="user.list"/></h4>
                </div>
                
                <div class="modal-body">
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="listHead">
						<div class="listHiddenField pull-left" style="width: 10%">
							<s:message code="user.cd" />
						</div>
						<div class="listHiddenField pull-left " style="width: 20%">
							<s:message code="user.userid" />
						</div>
						<div class="listHiddenField pull-left " style="width: 20%">
							<s:message code="user.usermm" />
						</div>
						<div class="listHiddenField pull-left" style="width: 20%">
							<s:message code="user.deptnm" />
						</div>
						<div class="listHiddenField pull-left" style="width: 20%">
							<s:message code="user.position" />
						</div>
						<div class="listTitle" style="width: 10%">
							<s:message code="user.state" />
						</div>
					</div>

					<c:forEach var="list" items="${list}" varStatus="status">
	 					<div class="listBody" id="selectlist">
							<div class="listHiddenField pull-left textCenter" style="width: 10%"
								title="<c:out value="${list.userCode}" />">
								<c:out value="${list.userCode}" />
							</div>
							<div class="listHiddenField pull-left textCenter" style="width: 20%">
								<c:out value="${list.userID}" />
							</div>
							<div class="listHiddenField pull-left textCenter" style="width: 20%"
								title="<c:out value="${list.userNm}" />">
								<c:out value="${list.userNm}" />
							</div>
							<div class="listHiddenField pull-left textCenter" id="selectEp" style="width: 20%"
								title="<c:out value="${list.deptCode}"/>">
								<c:out value="${list.deptCode}" />
							</div>
							<div class="listHiddenField pull-left textCenter" style="width: 20%">
								<c:out value="${list.position}" />
							</div>
							<div class="listTitle" style="width: 10%">
								<c:out value="${listw.state}" />
							</div>
						</div> 
					</c:forEach>
				</div>
			</div>

			<c:if test="${list.size()==0}">
				<div class="listBody height200"></div>
			</c:if>
            		<!-- /.row -->                
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close"><s:message code="common.btnClose"/></button>
                </div>
		    </div>
	  	</div>
	  	
	  	<script>
			$('.listBody').on('dblclick', function() {
				$('#userNm').attr('value', $(this).children().eq(2).attr('title'));
				$('#userCode').attr('value', $(this).children().eq(0).attr('title'));
				$('#popupUser').modal('hide');
			});
		</script>  