<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<c:forEach var="listview" items="${listview}" varStatus="status">
	<div class="listBody" id="selectlist">
		<div class="listHiddenField pull-left textCenter" style="width: 10%"
			id="userCode" title="<c:out value="${listview.userCode}" />">
			<c:out value="${listview.userCode}" />
		</div>

		<div class="listHiddenField pull-left textCenter" style="width: 20%">
			<c:out value="${listview.userID}" />
		</div>

		<div class="listHiddenField pull-left textCenter" style="width: 20%"
			title="<c:out value="${listview.userNm}" />">
			<c:out value="${listview.userNm}" />
		</div>

		<div class="listHiddenField pull-left textCenter" id="selectEp"
			style="width: 20%" title="<c:out value="${listview.deptCode}"/>">
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

	<script>
		$('.listBody').on('dblclick', function() {
			$.ajax({
				url : '/popupUserForm',
				type : 'post' ,
				data : {userCode : $(this).children().eq(0).attr('title')}
			}).success(function(result) {
				var userInfo = JSON.parse(result);

				treeMaker_radio_forUser(<c:out value="${treeStr}" escapeXml="false"/>, userInfo.deptCode);
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