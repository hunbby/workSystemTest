$(function() {
//	var treeNode = null;
//	 $.ajax({
//		url : '/getTreeData',
//		type : 'post'
//	}).success(function(result) {
//		treeNode = JSON.parse(result.treeStr);
	treeMaker_basic(getTreeData());
	var totalPageCnt = userList_dept('root','root01');
	pagingSertting(1, totalPageCnt, 'root','root01');
//	});
})
function getTreeData() {
	var treeNode = null;
	 $.ajax({
		url : '/getTreeData'
		, type : 'post'
		, async: false
		, success : function(result) {
				treeNode = JSON.parse(result.treeStr);
			}
		, error : function (request) {
			alert(request.responseText);
			}
	});
	return treeNode;
} // 데이터 없을 때 동작 구현 할 것 01-02 
// 기본 적인 TreeGrid를  생성 합니다. class 명 tree 에 작동
function treeMaker_basic(treeNode) {
	var dtnode = null;
	$(".tree").dynatree({
		children: treeNode
		, onActivate: function(node){
			var totalPageCnt = userList_dept(node.data.key, null);
			pagingSertting(1, totalPageCnt, node.data.key, null);
		}
		, selectMode: 1
//		, onDblClick: function(node){
//			 //node.toggleSelect();
//			 $("#form_dept")[0].reset();
//			 deptTree2Make(treeNode, node);
//			 ajax_deptInfo(node);
//			 $('#popupDeptForm').modal('show');
//		 } //부서 목록 클릭시 동작 
	});
	$(".tree").dynatree("getRoot").visit(function(node){
	 	node.expand(true);
	 });
	bindContextMenu();
	
}
// 컨텍스트 메뉴
function bindContextMenu(node) {
    // Add context menu to document nodes:
    $(".dynatree-node").contextMenu({
    	menuSelector: "#contextMenu",
    	menuSelected: function (invokedOn, selectedMenu) {
    		var selnode = bindDtNode(invokedOn.text());
    		if(selectedMenu.text() === '추가') {
    			deptTree2Make(getTreeData(), selnode, 1);
    			fromReset('form_dept');
    			$('#btnDeptSave').css('display', 'inline');
    			$('#btnDeptEdit').css('display', 'none');
    			$('#btnDeptDelete').css('display', 'none');
    			$('#btnListDelete').css('display', 'none');
    			lvSelectView(2, selnode.data.key);
    			$('#popupDeptForm').modal('show');
    		} else if(selectedMenu.text() === '수정') {
    			deptTree2Make(getTreeData(), selnode, 0);
    			$("#form_dept")[0].reset();
    			ajax_deptInfo(selnode);
    			$('#btnDeptSave').css('display', 'none');
    			$('#btnDeptEdit').css('display', 'inline');
    			$('#btnDeptDelete').css('display', 'none');
    			$('#btnListDelete').css('display', 'none');
    			$('#popupDeptForm').modal('show');
    		} else if(selectedMenu.text() === '삭제') {
//    			alert('삭제 : ' + invokedOn.text());
    			deptTree2Make(getTreeData(), selnode);
    			$("#form_dept")[0].reset();
    			ajax_deptInfo(selnode);
    			$('#btnDeptSave').css('display', 'none');
    			$('#btnDeptEdit').css('display', 'none');
    			$('#btnDeptDelete').css('display', 'inline');
    			$('#btnListDelete').css('display', 'inline');
    			$('#popupDeptForm').modal('show');
    		}
    	}
    });
}
// 부서 이름으로 노드를 비교 후 부서코드를 가져온다.
function bindDtNode(title) {
	var result = null;
	$('.tree').dynatree("getTree").visit(function(node) {
		if(node.data.title == title) {
			result = node;
		}
	});
	return result;
}
//클릭 이벤트가 제외된 TreeGrid 부서 등록 폼 에서 사용 class 명 tree2
function treeMaker_basic2_notClick(treeStr_basic2) {
	 $(".tree2").dynatree({
		 children: treeStr_basic2
		, selectMode: 1
		, cookieId: "dynatree-Cb3"
	    , idPrefix: "dynatree-Cb3-"
	
	});
    $(".tree2").dynatree("getRoot").visit(function(node){
        node.expand(true);
    });
}

// 부서 관리 팝업 창에서 사용하는 TreeGrid 체크 박스와 항목 체크가 활성화 되어있다. class 명 tree2 에 적용
function deptTree2Make(deptTree2, node, toggle) {
	var selNdoe = node;
	//console.log(toggle);
	if($(".tree2").dynatree() != null){			
		$(".tree2").dynatree("destroy");
	}
	// 체크박스 활성화
	if(toggle === 'undefined' || toggle == null) {
		$(".tree2").dynatree({
			 children: deptTree2
			, checkbox: true
			, onActivate: function(node){ ajax_deptInfo(node); }
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
			    $('#deptCodeList_popup').val(deptCodeArrayList);
			  }
			  , cookieId: "dynatree-Cb3"
		      , idPrefix: "dynatree-Cb3-"
		
		});
		$('.tree2').dynatree("getTree").visit(function(node) {
			if(node.data.key == selNdoe.data.key) {
				node.select();
			}
		});
	} else if (toggle == 0) { // 체크박스 비활성화
		$(".tree2").dynatree({
			 children: deptTree2
			, onActivate: function(node){ ajax_deptInfo(node); }
			, selectMode: 1
		    , onSelect: function(select, node) {
			    // selected 된 deptCode 값
			    var selKeys = $.map(node.tree.getSelectedNodes(), function(node){
			        return node.data.key;
			    });
			    deptCodeArrayList = new Array(selKeys);
			    // sconsole.log(deptCodeArrayList);
			    $('#deptCodeList_popup').val(deptCodeArrayList);
			  }
			  , cookieId: "dynatree-Cb3"
		      , idPrefix: "dynatree-Cb3-"
		
		});
		$('.tree2').dynatree("getTree").visit(function(node) {
			if(node.data.key == selNdoe.data.key) {
				node.activate();
			}
		});
	} else if (toggle == 1) { // 부서 추가 시 트리 그리드
		$(".tree2").dynatree({
			 children: deptTree2
			, onActivate: function(node){ 
				lvSelect(2, node.data.key);
			}
			, selectMode: 1
			  , cookieId: "dynatree-Cb3"
		      , idPrefix: "dynatree-Cb3-"
		
		});
		$('.tree2').dynatree("getTree").visit(function(node) {
			if(node.data.key == selNdoe.data.key) {
				node.activate();
			}
		});
	}

	$(".tree2").dynatree("getRoot").visit(function(node){
		node.expand(true);
	});
	

}



function treeMaker_radio_forUser(treeList_user, selectedTreeList_user) {

	$(".tree3").dynatree({
		children: treeList_user
		//, checkbox: true
		, classNames: {checkbox: "dynatree-radio"}
		, selectMode: 1
		, onActivate: function(node, event) {
	        node.toggleSelect();
      	}
	    , onSelect: function(select, node) {
	    	if(node.data.isFolder) { // 폴더라면 경고
	    		alert('폴더에 사용자를 등록 할 수 없습니다.');
	    	} else{
		    	$('#deptNm_user').val(node.data.title);
		    	$('#deptCode_user').val(node.data.key);
	    	}
	    }
	    , cookieId: "dynatree-Cb3"
	    , idPrefix: "dynatree-Cb3-"
		});
	
	    $(".tree3").dynatree("getRoot").visit(function(node){
	        node.expand(true);
	    });
}

// 부서 관리 팝업에서 팝업 목록 클릭시 정보를 출력한다.
function ajax_deptInfo(node){
	 $.ajax({
		url : 'popupDeptForm'
		, type : 'post'
		, dataType : "json"
		, data : {
				deptCode : node.data.key
			}
	 	, success : function(result) {
				var deptInfo = result.selectDept
				
			    $('#deptCode_popup').val(deptInfo.deptCode);
			    $('#deptNm_popup').val(deptInfo.deptNm);
			    $('#deptRemarks_popup').text(deptInfo.deptRemarks);
	//			$('#btnDeptSave').css('display', 'none');
	//			$('#btnDeptEdit').css('display', 'inline');
	//			$('#btnDeptDelete').css('display', 'inline');
	//			$('#btnListDelete').css('display', 'inline');
				lvSelectView(deptInfo.deptLV, deptInfo.deptParent);
			}
	 	, error : function (request) {
	 			alert(request.responseText);
			}
		});
}

// 부서 등록 폼 라디오 버튼 활성화 비활성화
function lvSelectView(selectedLV, deptParent) {
    if(selectedLV == 1) {		
    	$('#checkLv1_popup').prop('checked', true);
    	$('#checkLv2_popup').prop('checked', false);
    	lvSelect(1, null);
    } else if(selectedLV == 2) {
    	$('#checkLv1_popup').prop('checked', false);
    	$('#checkLv2_popup').prop('checked', true);
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
			var Plist = JSON.parse(data.deptParentList);
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

// 부서별 사용자 리스트 출력
function userList_dept(node_key, node_parentkey) {
	var totalPageCnt;
	$.ajax({
		url : '/getDeptUserList'
		, type : 'post'
		, async : false
		, data : {
				deptCode : node_key
				, deptParent : node_parentkey
				, pageStart : 1
			}
	 	, success : function(result) {
				$('.listviewContainer').html('');		
				$.each(result.listview, function(index, item) {
					if(item.position == 1) {
						item.position = '사원';
					} else if (item.position == 2) {
						item.position = '전임';
					} else if (item.position == 3) {
						item.position = '책임';
					} else if (item.position == 4) {
						item.position = '수석';
					}
					
					if(item.state == 0) {
						item.state = '본사';
					} else if (item.state == 1) {
						item.state = '파견';
					} else if (item.state == 2) {
						item.state = '휴가';
					}
				});
				totalPageCnt = result.totalPageCnt;
				$.tmpl(deptUserList_html(), result.listview).appendTo('.listviewContainer');
			} 
	 	, error : function (request) {
	 			alert(request.responseText);
			}
		});
	return totalPageCnt;
}

// 팝업 닫기 클릭 시 동작 class명 tree2 에 있는 TreeGrid 초기화
function custom_close() {
	$('#deptCodeList_popup').attr('value', null);
	$(".tree2").dynatree("destroy"); 
	$('#popupDeptForm').modal('hide');
}

//팝업 닫기 클릭 시 동작 class명 tree3 에 있는 TreeGrid 초기화
function custom_close2() {
	$(".tree3").dynatree("destroy"); 
	$('#popupUserForm').modal('hide');
}

function deptUserList_html() {
	return '<tr class="listBody_user" title="\${userCode}">'
	+'<td class="listHiddenField pull-left pField10">\${seqNo}</td>'
//	+'<td class="listHiddenField pull-left pField15">\${userCode}</td>'
	+'<td class="listHiddenField pull-left pField20">\${userID}</td>'
	+'<td class="listHiddenField pull-left pField10">\${userNm}</td>'
	+'<td class="listHiddenField pull-left pField10" title="\${deptCode}">\${deptCode}</td>'
	+'<td class="listHiddenField pull-left pField20">\${userMail}</td>'
	+'<td class="listHiddenField pull-left pField15">\${userPhone}</td>'
	+'<td class="listHiddenField pull-left pField10">\${position}</td>'
	+'<td class="listHiddenField pull-left pField5">\${state}</td>'
	+'</tr>';
}

function pagingSertting(pageNumber, totalPageCnt, node_key, node_parentkey) {
	if(totalPageCnt == 0) {
		$('#userPaging').html(''); // 페이지 초기화
	} else {
		$('#userPaging').unbind('page'); 
		$('#userPaging').bootpag({
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
		    $.ajax({
				url : '/getDeptUserList'
				, type : 'post'
				, dataType : "json" 
				, data : {
						pageStart : num
						, deptCode : node_key
						, deptParent : node_parentkey
					}
				, success : function(result) {
					$('.listviewContainer').html('');		
					$.each(result.listview, function(index, item) {
						if(item.position == 1) {
							item.position = '사원';
						} else if (item.position == 2) {
							item.position = '전임';
						} else if (item.position == 3) {
							item.position = '책임';
						} else if (item.position == 4) {
							item.position = '수석';
						}
						
						if(item.state == 0) {
							item.state = '본사';
						} else if (item.state == 1) {
							item.state = '파견';
						} else if (item.state == 2) {
							item.state = '휴가';
						}
					});
					totalPageCnt = result.totalPageCnt;
					$.tmpl(deptUserList_html(), result.listview).appendTo('.listviewContainer');
				}
				, error : function(request) {
					alert(request.responseText);
					}
		    });
		    if(num == 1) {
		    	$('.first').css('display', 'none');
		    	$('.prev').css('display', 'none');
		    	$('.last').css('display', 'inline');
		    	$('.next').css('display', 'inline');
		    } else if (num == totalPageCnt) {
		    	$('.last').css('display', 'none');
		    	$('.next').css('display', 'none');
		    	$('.first').css('display', 'inline');
		    	$('.prev').css('display', 'inline');
		    } else {
		    	$('.first').css('display', 'inline');
		    	$('.prev').css('display', 'inline');
		    	$('.last').css('display', 'inline');
		    	$('.next').css('display', 'inline');
		    }
		});
		$('.first').css('display', 'none');
		$('.prev').css('display', 'none');
	}
}