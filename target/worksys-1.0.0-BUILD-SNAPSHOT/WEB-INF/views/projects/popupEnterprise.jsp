<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

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
							<table class="pField100">
							<thead>
								<tr class="listHead">
								<%-- 	<td class="listHiddenField pull-left pField10"><s:message code="enterprise.indexCd" /></td>
								 --%>	
								 	<td class="listHiddenField pull-left pField60"><s:message code="enterprise.prtitle" /></td>
									<td class="listHiddenField pull-left pField10"><s:message code="enterprise.usernm" /></td>
									<td class="listHiddenField pull-left pField20"><s:message code="crud.crdate" /></td>
								</tr>
							</thead>
							<tbody class="enterpriseListContainer">
							</tbody>
							</table>
						</div>
					</div>
					<div id="popupEpPaging"></div>
            		<!-- /.row -->                
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close"><s:message code="common.btnClose"/></button>
                </div>
		    </div>
	  	</div>