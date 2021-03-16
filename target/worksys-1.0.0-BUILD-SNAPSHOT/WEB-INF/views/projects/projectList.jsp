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

<script>
	function fn_moveDate(date) {
		$.ajax({
			url : "moveDate",
			type : "post",
			data : {
				date : date
			},
			success : function(result) {
				$("#calenDiv").html(result);
			}
		})
	}
</script>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../common/navigation.jsp" />
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-gear fa-fw"></i> <s:message code="project.title"/></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
             <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                  <button type="button" class="btn btn-default pull-right" onclick="fn_moveToURL('projectForm')">
                  <i class="fa fa-edit fa-fw"></i> <s:message code="board.new"/></button>      
            </div>
            </div>
            
             <!-- /.row -->
            <div class="panel panel-default"> 
               <div class="panel-body ">
               <div class="listHead">
                  <div class="listHiddenField pull-left " style="width: 10%"><s:message code="project.cd"/></div>
                  <div class="listHiddenField pull-right " style="width: 20%"><s:message code="board.date"/></div>
                  <div class="listHiddenField pull-right " style="width: 20%"><s:message code="project.term"/></div>
                  <div class="listHiddenField pull-right " style="width: 10%"><s:message code="project.usernm"/></div>
                  <div class="listHiddenField pull-right " style="width: 10%"><s:message code="enterprise.prtitle"/></div>
                  <div class="listTitle " style="width: 30%"><s:message code="project.prtitle"/></div>
               </div>
	          <c:if test="${listview.size()==0}">
	            <div class="listBody height200">
	            </div>
	         </c:if>
	         
	         <c:forEach var="listview" items="${listview}" varStatus="status">
				<c:url var="link" value="getProjectInfo">
					<c:param name="pjtCode" value="${listview.pjtCode}" />
				</c:url>
	               
	            <div class="listBody" ondblclick="location.href='${link}'">
	               <div class="listHiddenField pull-left textCenter" style="width: 10%"><c:out value="${listview.pjtCode}"/></div>
	               <div class="listHiddenField pull-right textCenter" style="width: 20%"><c:out value="${listview.rgstDay}"/></div>
	               <div class="listHiddenField pull-right textCenter" style="width: 20%"><c:out value="${listview.pjtTermFrom} ~ ${listview.pjtTermTo}"/></div>
	               <div class="listHiddenField pull-right textCenter" style="width: 10%"><c:out value="${listview.userNm}"/></div>
	               <div class="listHiddenField pull-right textCenter" style="width: 10%"><c:out value="${listview.epNm}"/></div>
	               <div class="listTitle textCenter" title="<c:out value=""/>" style="width: 30%"><c:out value="${listview.pjtNm}"/></div>
	            </div>
	            </c:forEach>
               </div>  
          </div>
            
            <form>
            <!-- form -->
            </form>
       </div> 
   </div>
</body>
</html>