<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/header.jsp" %>

    <title><s:message code="common.pageTitle"/></title> 
    <script src="/js/dept/bootstrap-contextmenu.js"></script>
    <script src="/js/dynatree/jquery.dynatree.js"></script>
	<script src="/js/dept/dynatreeFunction.js"></script>
	<script src="/js/dept/deptFunction.js"></script>
<!-- 	<script src="/js/common/jquery.bootpag.min.js"></script> -->
<!-- 	<script src="/js/formReset.js"></script> -->
  
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
	                            <button class="btn btn-xs btn-outline btn-primary pull-right" id="deptAdd">＋</button>
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
							<table class="pField100">
								<thead>
									<tr class="listHead">
										<td class="listHiddenField pull-left pField10">No.</td>
										<%-- <td class="listHiddenField pull-left pField15"><s:message code="user.cd" /></td> --%>
										<td class="listHiddenField pull-left pField20"><s:message code="user.userid" /></td>
										<td class="listHiddenField pull-left pField10"><s:message code="user.usermm" /></td>
										<td class="listHiddenField pull-left pField10"><s:message code="user.deptnm" /></td>
										<td class="listHiddenField pull-left pField20">E-Mail</td>
										<td class="listHiddenField pull-left pField15">핸드폰 번호</td>
										<td class="listHiddenField pull-left pField10"><s:message code="user.position" /></td>
										<td class="listHiddenField pull-left pField5"><s:message code="user.state" /></td>
									</tr>
								</thead>
								
								<tbody class="listviewContainer">
								</tbody>
							</table>
							<div id="userPaging"></div>
						</div>
				</div>
			</div>
            <!-- /.row -->
        </div>
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
		<%@ include file="/WEB-INF/views/dept/popupUserForm.jsp" %>
	</div>

	<ul id="contextMenu" class="dropdown-menu" role="menu" style="display:none" >
	    <li><a tabindex="-1" href="#">추가</a></li>
	    <li><a tabindex="-1" href="#">수정</a></li>
	    <li><a tabindex="-1" href="#">삭제</a></li>
	</ul>

</body>

</html>
