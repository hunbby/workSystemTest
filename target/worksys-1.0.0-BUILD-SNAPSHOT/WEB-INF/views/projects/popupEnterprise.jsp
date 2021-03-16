<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<script>
/* 	var selectedNode = null;
	
	function fn_searchEnterprise() {
		if ( ! chkInputValue("#keyword4Users", "<s:message code="common.keyword"/>")) return false;
		
	    $.ajax({
	    	url: "popupUsers4Users",
			type: "post", 
	    	data: { searchKeyword : $("#keyword4Users").val() }    	
	    }).success(function(result){
	    			$("#userlist4Users").html(result);
			}    		
	    );
	} 검색 아작스 예제 */

</script>    

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
                    <h4 class="modal-title" id="myModalLabel"><s:message code="enterprise.list"/></h4>
                </div>
                
                <div class="modal-body">
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="listHead">
						<div class="listHiddenField pull-left field100">
							<s:message code="enterprise.indexCd" />
						</div>
						<div class="listHiddenField pull-right field130">
							<s:message code="crud.crdate" />
						</div>
						<div class="listHiddenField pull-right field130">
							<s:message code="enterprise.usernm" />
						</div>
						<div class="listTitle textCenter">
							<s:message code="enterprise.prtitle" />
						</div>
					</div>

					<c:forEach var="listview" items="${listview}" varStatus="status">


						<div class="listBody" id="selectlist">
							<div class="listHiddenField pull-left field100 textCenter"
								title="<c:out value="${listview.epCode}" />">
								<c:out value="${listview.epCode}" />
							</div>
							<div class="listHiddenField pull-right field130 textCenter">
								<c:out value="${listview.rgstDay}" />
							</div>
							<div class="listHiddenField pull-right field130 textCenter"
								title="<c:out value="${listview.epMgmtNm}" />">
								<c:out value="${listview.epMgmtNm}" />
							</div>
							<div class="listTitle textCenter" id="selectEp"
								title="<c:out value="${listview.epNm}"/>">
								<c:out value="${listview.epNm}" />
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<c:if test="${listview.size()==0}">
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
			$('.listBody').on('dblclick',function() {
				$('#enterpriseSearch').attr('value', $(this).children().eq(3).attr('title'));
				$('#enterpriseSearch2').attr('value', $(this).children().eq(2).attr('title'));
				$('#epCode').attr('value', $(this).children().eq(0).attr('title'));
				$('#popupEnterprise').modal('hide');
			});
		</script>