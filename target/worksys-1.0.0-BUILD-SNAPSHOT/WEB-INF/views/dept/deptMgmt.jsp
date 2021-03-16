<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>

    <title><s:message code="common.pageTitle"/></title> 
	<script src="/js/dynatree/dynatreeFunction.js"></script>
	
<script>
	window.onload = function(){
		var treeNode = <c:out value="${treeStr}" escapeXml="false"/>;
		treeMaker_basic(treeNode);
		treeMaker_radio_forUser(treeNode,'');
	}
	// 목록 더블 클릭 시 데이터 가져오기 -- treeNode 의 자식 노드들 선택 값 true 변경
	 function TreenodeActivate(node) {
	 	var selTreeNode = <c:out value="${treeStr}" escapeXml="false"/>;
	 	ajax_deptInfo(selTreeNode, node);
	}
</script>    
</head>

<body>
    <div id="wrapper">
		<jsp:include page="../common/navigation.jsp" />
		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-sitemap fa-fw"></i> <s:message code="memu.dept"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
            	<div class="col-lg-2" >
	            	<div class="panel panel-default" >
	            		<div class="panel-heading">
	                            <s:message code="common.deptList"/>
	                            <button class="btn btn-xs btn-outline btn-primary pull-right" onclick="deptForm()">＋</button>
	                    </div>
	                    <div style="max-height:400px; overflow:auto;" >
					    	<div class="tree">
							</div>
						</div>
					</div>
                </div> 
                <div class="col-lg-10" >
					<div class="panel panel-default">
						 <div class="panel-heading">
	            			<s:message code="common.userList"/>
	            			<button class="btn btn-xs btn-outline btn-primary pull-right" id="btnUserAdd" ><s:message code="board.append"/></button>
	                    </div>
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
							<div class="listviewContainer">
							<c:forEach var="listview" items="${listview}" varStatus="status">
		
			 					<div class="listBody" id="selectlist" >
									<div class="listHiddenField pull-left textCenter" style="width: 10%"
										id="userCode"
										title="<c:out value="${listview.userCode}" />">
										<c:out value="${listview.userCode}" />
									</div>
									
									<div class="listHiddenField pull-left textCenter" style="width: 20%">
										<c:out value="${listview.userID}" />
									</div>
									
									<div class="listHiddenField pull-left textCenter" style="width: 20%"
										title="<c:out value="${listview.userNm}" />">
										<c:out value="${listview.userNm}" />
									</div>
									
									<div class="listHiddenField pull-left textCenter" id="selectEp" style="width: 20%"
										title="<c:out value="${listview.deptCode}"/>">
										<c:out value="${listview.deptCode}" />
									</div>
									
									<div class="listHiddenField pull-left textCenter" style="width: 20%">
										<c:out value="${listview.position}" />
									</div>
									
									<div class="listTitle textCenter" style="width: 10%">
										<c:out value="${listview.state}" />
									</div>
								</div> 
							</c:forEach>
							</div>
						</div>
				</div>
			</div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <div id="popupDeptForm" class="modal fade bs-example-modal-lg"
		tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel">
		<%@ include file="/WEB-INF/views/dept/popupDeptForm.jsp" %>
	</div>
	<div id="popupUserForm" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<%@ include file="/WEB-INF/views/member/popupUserForm.jsp" %>
	</div>
		
	<script>
		// 부서 등록 팝업
		function deptForm() {
		 	treeMaker_basic2_notClick(<c:out value="${treeStr}" escapeXml="false"/>);
			$(".tree2").dynatree("getTree").reload();
			$(".tree2").dynatree("getRoot").visit(function(node){
			    node.expand(true);
			});
		 	$('#deptCode').attr('value','');
		 	$('#deptNm').attr('value','');
		 	$('#deptRemarks').attr('value','');
		 	$('#checkLv1').prop('checked', true);
		 	lvSelect(1);
		 	$('#deptRemarks').text('');
		 	$('#btnDeptSave').css('display', 'inline');
		 	$('#btnDeptEdit').css('display', 'none');
		 	$('#btnDeptDelete').css('display', 'none');
		 	$('#btnListDelete').css('display', 'none');
		 	$('#popupDeptForm').modal('show');
		 }
		
		// 사용자 등록 팝업
		$('#btnUserAdd').on('click', function(){
			treeMaker_radio_forUser(<c:out value="${treeStr}" escapeXml="false"/>, '');
			$(".tree3").dynatree("getTree").reload();
			$(".tree3").dynatree("getRoot").visit(function(node){
			    node.expand(true);
			});
			$('#userCode_popup').attr('value', '');
			$('#userNm_popup').attr('value', '');
			$('#userId_popup').attr('value', '');
			$('#password_popup').attr('value', '');
			$('#deptNm_user').attr('value', '');
			$('#deptCode_user').attr('value', '');
			$('#position_popup').val("1").prop("selected", true);
			$('input:radio[name=state]:input[value="0"]').prop("checked", true)
			$('#btnUserSave').css('display', 'inline');
			$('#btnUserEdit').css('display', 'none');
			$('#btnUserDelete').css('display', 'none');
			$('#popupUserForm').modal('show');
		});
		
 		$('.listBody').on('dblclick', function() {
			$.ajax({
				url : '/popupUserForm',
				type : 'post' ,
				data : {userCode : $(this).children().eq(0).attr('title')}
			}).success(function(result) {
				var userInfo = JSON.parse(result);

				treeMaker_radio_forUser(<c:out value="${treeStr}" escapeXml="false"/>, userInfo.deptCode);
				$(".tree3").dynatree("getTree").reload();
				$(".tree3").dynatree("getRoot").visit(function(node){
				    node.expand(true);
				});
				$('#userCode_popup').attr('value', userInfo.userCode);
				$('#userNm_popup').attr('value', userInfo.userNm);
				$('#userId_popup').attr('value', userInfo.userID);
				//$('#password').attr('value', result.);
				$('#deptNm_user').attr('value', userInfo.deptNm);
				$('#deptCode_user').attr('value', userInfo.deptCode);
				$('#position_popup').val(userInfo.position).prop("selected", true);
				$('input:radio[name=state]:input[value='+userInfo.state +']').prop("checked", true)
				$('#btnUserSave').css('display', 'none');
				$('#btnUserEdit').css('display', 'inline');
				$('#btnUserDelete').css('display', 'inline');
			});
			$('#popupUserForm').modal('show');
		}); 
	</script>
</body>

</html>
