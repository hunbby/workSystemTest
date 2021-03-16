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
	$('.listBody').click(function() {
		$('#pjtNm').attr('value', $(this).children().eq(5).attr('title'));
		$('#pjtCode').attr('value', $(this).children().eq(0).attr('title'));
		$('#popupProject').modal('hide');
		console.log($(this).children().eq(5).attr('title'));
	});

</script>    
<!-- modal -->
	  	<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <div class="col-lg-3 pull-right">
		                   	<div class="input-group custom-search-form">
	                        	<input class="form-control" type="text" id="keyword4Users" name="keyword4Users" onkeydown="if(event.keyCode == 13) { fn_searchProject();}">
	                            <span class="input-group-btn">
	                            	<button class="btn btn-default" onclick="fn_searchProject()"><i class="fa fa-search"></i></button>
	                            </span>
	                       	</div>
					</div>
                    <h4 class="modal-title" id="myModalLabel"><s:message code="project.list"/></h4>
                </div>
                
                <div class="modal-body">
             <!-- /.row -->
            <div class="panel panel-default"> 
               <div class="panel-body ">
               <div class="listHead">
                  <div class="listHiddenField pull-left " style="width: 10%"><s:message code="project.cd"/></div>
                  <div class="listHiddenField pull-right " style="width: 10%"><s:message code="board.date"/></div>
                  <div class="listHiddenField pull-right " style="width: 30%"><s:message code="project.term"/></div>
                  <div class="listHiddenField pull-right " style="width: 10%"><s:message code="project.usernm"/></div>
                  <div class="listHiddenField pull-right " style="width: 10%"><s:message code="enterprise.prtitle"/></div>
                  <div class="listTitle " style="width: 30%"><s:message code="project.prtitle"/></div>
               </div>
	          <c:if test="${list.size()==0}">
	            <div class="listBody height200">
	            </div>
	         </c:if>
	         
	         <c:forEach var="list" items="${list}" varStatus="status">
	            <div class="listBody" >
	               <div class="listHiddenField pull-left textCenter" style="width: 10%"
		               title="<c:out value="${list.pjtCode}" />">
		               		  <c:out value="${list.pjtCode}"/>
	               </div>
	               <div class="listHiddenField pull-right textCenter" style="width: 10%">
	               				<c:out value="${list.rgstDay}"/></div>
	               <div class="listHiddenField pull-right textCenter" style="width: 30%">
	               				<c:out value="${list.pjtTermFrom} ~ ${list.pjtTermTo}"/></div>
	               <div class="listHiddenField pull-right textCenter" style="width: 10%"
	               	 title="<c:out value="${list.userNm}" />">
	               	 		<c:out value="${list.userNm}"/>
	               </div>
	               <div class="listHiddenField pull-right textCenter" style="width: 10%"
	               	 title="<c:out value="${list.epNm}" />">
	               			<c:out value="${list.epNm}"/>
	               	</div>
	               <div class="listTitle textCenter" style="width: 30%"
	                title="<c:out value="${list.pjtNm}" />">
	                	   <c:out value="${list.pjtNm}"/>
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