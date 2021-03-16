<%@ include file="/WEB-INF/include/header.jsp" %>
<title>Project</title>

<style>
	.col-gu {
		float: left;
		width: 14%;
		padding: 1px;
		height: 200px;
	}
	
	@media screen and (max-width: 1024px) {
		.col-gu {
			width: 33%;
		}
	}
	
	@media screen and (max-width: 450px) {
		.col-gu {
			width: 50%;
		}
	}
</style>

<link href="/js/datepicker/datepicker.css" rel="stylesheet"
	type="text/css">
<script src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/dayCalculation.js"></script>
<script src="/js/dynatree/jquery.dynatree.js"></script>
<script src="/js/projects/projectFunction.js"></script>
<script src="/js/projects/projectFormFunction.js"></script>
<!-- <script src="/js/formReset.js"></script> -->

</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/navigation.jsp" />
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-gear fa-fw"></i> <s:message code="project.title"/></h1>
                </div>
            </div>
            
            <div class="pjtMainContainer">
		        <div class="row">
			         <div class="col-lg-12">
			               <button type="button" class="btn btn-default pull-right" id="pjtAdd">
			               <i class="fa fa-edit fa-fw"></i> <s:message code="board.new"/></button>      
			         </div>
		         </div>
		            
		         <div class="panel panel-default"> 
		             <div class="panel-body ">
						<table class="pField100">
							<thead>
								<tr class="listHead">
									<td class="listHiddenField pull-left pField5">No.</td>
<%-- 								 	<td class="listHiddenField pull-left pField15"><s:message code="project.cd"/></td>  --%>
									<td class="listHiddenField pull-left pField20"><s:message code="project.prtitle"/></td>
									<td class="listHiddenField pull-left pField20"><s:message code="enterprise.prtitle"/></td>
									<td class="listHiddenField pull-left pField10"><s:message code="project.usernm"/></td>
									<td class="listHiddenField pull-left pField20"><s:message code="project.term"/></td>
									<td class="listHiddenField pull-left pField20"><s:message code="board.date"/></td>
								</tr>
							</thead>

							<tbody class="projectListContainer">
							
							</tbody>
						</table>         
		            </div>  
		         </div>
				 <div id="pjtPaging"></div>			
			</div>
			<div class="pjtFormContainer">
				<jsp:include page="./projectForm.jsp" />
			</div>
       </div> 
   </div>
</body>
</html>