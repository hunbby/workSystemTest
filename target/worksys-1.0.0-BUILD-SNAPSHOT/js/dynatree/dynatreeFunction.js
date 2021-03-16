// 기본 적인 TreeGrid를  생성 합니다. class 명 tree 에 작동
function treeMaker_basic(treeNode) {
	$(".tree").dynatree({
		children: treeNode
		, onActivate: function(node){
			 $.ajax({
					url : '/getDeptUserList',
					type : 'post',
					data : {
								deptCode : node.data.key
							}
				}).success(function(result) {
					$('.listview').empty();
					$('.listviewContainer').html(result);						
				}); 	
		}
		, selectMode: 1
		 , onDblClick: TreenodeActivate //부서 목록 클릭시 동작
	});
	$(".tree").dynatree("getRoot").visit(function(node){
	 	node.expand(true);
	 });
}

// 부서 관리 팝업 창에서 사용하는 TreeGrid 체크 박스와 항목 체크가 활성화 되어있다. class 명 tree2 에 적용
function deptTree2Make(selTreeNode, node) {
	console.log(node.data.key);
	if(node != null){
		$.each(selTreeNode, function(idx_root,row) {
		 $.each(selTreeNode[idx_root].children, function(idx,row) {
			 $.each(selTreeNode[idx_root].children[idx].children, function(idx2,row2) {
				 if(selTreeNode[idx_root].children[idx].children[idx2].key == node.data.key) {
					 selTreeNode[idx_root].children[idx].children[idx2].select = true;
				 }
			 });
		 }); 
		});
	}
	console.log(selTreeNode);
	 $(".tree2").dynatree({
		 children: selTreeNode
		, checkbox: true
		, onActivate: function(node){ ajax_deptInfo(null, node); }
		, selectMode: 3
		, onDblClick: function(node, event) {
	        node.toggleSelect();
	      }
	    , onSelect: function(select, node) {
		    // selected 된 deptCode 값
		    var selKeys = $.map(node.tree.getSelectedNodes(), function(node){
		        return node.data.key;
		    });

		    deptCodeArrayList = new Array(selKeys);
		    // sconsole.log(deptCodeArrayList);
		    $('#deptCodeList').attr('value', deptCodeArrayList);
		  }
		  , cookieId: "dynatree-Cb3"
	      , idPrefix: "dynatree-Cb3-"
	
	});
    $(".tree2").dynatree("getRoot").visit(function(node){
        node.expand(true);
    });
}

// 클릭 이벤트가 제외된 TreeGrid 부서 등록 폼 에서 사용 class 명 tree2
function treeMaker_basic2_notClick(selTreeNode) {
	 $(".tree2").dynatree({
		 children: selTreeNode
		, onActivate: function(node){ }
		, selectMode: 1
		, cookieId: "dynatree-Cb3"
	    , idPrefix: "dynatree-Cb3-"
	
	});
    $(".tree2").dynatree("getRoot").visit(function(node){
        node.expand(true);
    });
}

function treeMaker_radio_forUser(treeList_user, selectedTreeList_user) {
	//var treeList_user = <c:out value="${treeStr}" escapeXml="false"/>; // 부서 전체 목록
	//var selectedTreeList_user = '<c:out value="${listview.deptCode}" escapeXml="false"/>'; // 리스트에서 더블 클릭 시 선택한 부서 코드
	
	if(selectedTreeList_user != '') {
		$.each(treeList_user, function(idx_root,row) {
		 $.each(treeList_user[idx_root].children, function(idx,row) {
			 $.each(treeList_user[idx_root].children[idx].children, function(idx2,row2) {
				 if(treeList_user[idx_root].children[idx].children[idx2].key == selectedTreeList_user) {
					 treeList_user[idx_root].children[idx].children[idx2].select = true;
				 }
			 });
		 });
		});
	}

	$(".tree3").dynatree({
		children: treeList_user
		, checkbox: true
		, classNames: {checkbox: "dynatree-radio"}
		, selectMode: 1
		, onActivate: function(node, event) {
	        node.toggleSelect();
      	}
	    , onSelect: function(select, node) {
	    	console.log(node.data.title);
	    	$('#deptNm_user').attr('value', node.data.title);
	    	$('#deptCode_user').attr('value', node.data.key);
	    	}
	    , cookieId: "dynatree-Cb3"
	    , idPrefix: "dynatree-Cb3-"
		});
	
	    $(".tree3").dynatree("getRoot").visit(function(node){
	        node.expand(true);
	    });
}

// 부서 관리 팝업에서 팝업 목록 클릭시 정보를 출력한다.
function ajax_deptInfo(selTreeNode, node){
	 $.ajax({
			url : 'popupDeptForm',
			type : 'post',
			dataType : "json" ,
			data : {
						deptCode : node.data.key
					}
		}).success(function(result) {
			console.log('????');
			console.log(result);
			var deptInfo = result;
			//var deptInfo = JSON.parse(result);
			if(selTreeNode != null) {				
				deptTree2Make(selTreeNode, node);
			}
			
			
		    $('#deptCode').attr('value', deptInfo.deptCode);
		    $('#deptNm').attr('value', deptInfo.deptNm);
		    $('#deptRemarks').text(deptInfo.deptRemarks);
			$('#btnDeptSave').css('display', 'none');
			$('#btnDeptEdit').css('display', 'inline');
			$('#btnDeptDelete').css('display', 'inline');
			$('#btnListDelete').css('display', 'inline');

			lvSelectView(deptInfo.deptLV, deptInfo.deptParent);
		   
		    $('#popupDeptForm').modal('show');
		}); 
}

// 부서 등록 폼 라디오 버튼 활성화 비활성화
function lvSelectView(selectedLV, deptParent) {
    if(selectedLV == 1) {		
    	$('#checkLv1').prop('checked', true);
    	$('#checkLv2').prop('checked', false);
    	lvSelect(1, null);
    } else if(selectedLV == 2) {
    	$('#checkLv1').prop('checked', false);
    	$('#checkLv2').prop('checked', true);
    	lvSelect(2, deptParent);
    }
}

// 라디오 버튼 활성화, 비활성화시 동작 lv2 선택시 부서 목록을 select에 추가
function lvSelect(selected, selectOne) {
	if(selected == 2) {
		$('#selectMenu1').css('display', 'block');
		var html_parentlist = null;
		$.post("/deptParentList").done(function(data) {
			$('#deptParentList').children().remove();
			var Plist = JSON.parse(data);
			html_parentlist = '';
			for(var i = 0 ; i < Plist.length ; i++) {
				if(selectOne == Plist[i].deptCode) {
					html_parentlist = html_parentlist + 
					'<option value="'+Plist[i].deptCode+'" selected="selected">'+Plist[i].deptNm+'</option>'
				} else {
					html_parentlist = html_parentlist + 
					'<option value="'+Plist[i].deptCode+'">'+Plist[i].deptNm+'</option>'
				}
			}
			$('#deptParentList').append(html_parentlist);
		});
	} else {
		$('#selectMenu1').css('display', 'none');
		$('#deptParentList').children().remove();
	}
}

// 팝업 닫기 클릭 시 동작 class명 tree2 에 있는 TreeGrid 초기화
function custom_close() {
	$('#deptCodeList').attr('value', null);
	$(".tree2").dynatree("destroy"); 
	$('#popupDeptForm').modal('hide');
}

//팝업 닫기 클릭 시 동작 class명 tree3 에 있는 TreeGrid 초기화
function custom_close2() {
	$(".tree3").dynatree("destroy"); 
	$('#popupUserForm').modal('hide');
}