<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<script>
$(function () {
	var totalPageCnt = ${totalPageCnt}
	//console.log(totalPageCnt);
	pagingSertting(1, totalPageCnt)
});

function pagingSertting(pageNumber, totalPageCnt) {
	$('#weekPopupPjtPaging').bootpag({
		total: totalPageCnt,
		page: pageNumber,
		maxVisible: 5,
		leaps: true,
		firstLastUse: true,
		first: '←',
		last: '→',
		wrapClass: 'pagination',
		activeClass: 'active',
		disabledClass: 'disabled',
		nextClass: 'next',
		prevClass: 'prev',
		lastClass: 'last',
		firstClass: 'first'
	}).on("page", function(event, num){
	    console.log("Page " + num);

	}); 
}

	$('.listBody').click(function() {
		$('#pjtCode').attr('value', $(this).children().eq(0).attr('title')); //프로젝트코드
		$('#pjtNm2').attr('value', $(this).children().eq(5).attr('title')); //프로젝트명
		$('#epMgmtNm').attr('value', $(this).children().eq(3).attr('title')); //업체명
		$('#pjtTermFrom').attr('value', $(this).children().eq(2).attr('title'));
		$('#popupProject').modal('hide');
		console.log($('#pjtCode').val());
		console.log($('#pjtNm2').val());
		console.log($('#epMgmtNm').val());
		console.log($('#pjtTermFrom').val());
		console.log($('#popupProject').val());
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
                  <div class="listHiddenField pull-left "  style="display:none"><s:message code="project.cd"/></div>
                  <div class="listHiddenField pull-right " style="width: 10%"><s:message code="board.date"/></div>
                  <div class="listHiddenField pull-right " style="width: 20%"><s:message code="project.term"/></div>
                  <div class="listHiddenField pull-right " style="width: 10%"><s:message code="project.usernm"/></div>
                  <div class="listHiddenField pull-right " style="width: 40%"><s:message code="enterprise.prtitle"/></div>
                  <div class="listTitle " ><s:message code="project.prtitle"/></div>
               </div>
	          <c:if test="${list.size()==0}">
	            <div class="listBody height200">
	            </div>
	         </c:if>
	         
	         <c:forEach var="list" items="${list}" varStatus="status">
	            <div class="listBody" >
	            
 	               <div class="listHiddenField pull-left textCenter" style="display:none"
		               title="<c:out value="${list.pjtCode}" />">
		               		  <c:out value="${list.pjtCode}"/>
	               </div> 
	               <div class="listHiddenField pull-right textCenter" style="width: 10%">
	               				<c:out value="${list.rgstDay}"/></div>
	               <div class="listHiddenField pull-right textCenter" style="width: 30%"
	               	title="<c:out value="${list.pjtTermFrom} ~ ${list.pjtTermTo}" />">
	               			<c:out value="${list.pjtTermFrom} ~ ${list.pjtTermTo}" />
	               	</div>
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
			<div id="weekPopupPjtPaging"></div>
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