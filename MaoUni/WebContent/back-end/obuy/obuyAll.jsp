<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.item.model.*"%>
<%@ page import="com.obuy.model.*"%>
<%@ page import="com.commodity_details.model.*"%>

<%
    ObuyService obuySvc = new ObuyService();
    List<ObuyVO> list = obuySvc.getAll();
    pageContext.setAttribute("list",list);
%>



<jsp:useBean id="obuy" scope="page" class="com.obuy.model.ObuyService" />
<jsp:useBean id="cd" scope="page" class="com.commodity_details.model.CdService" />
<jsp:useBean id="item" scope="page" class="com.item.model.ItemService" />

<html style="height: auto;">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MaoUni商品訂單管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu.css"> 
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css"> 

<%--以下為匯出至excel表單的功能 --%>
<script>
    function exportTableToExcel(tableID, filename = ''){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}
</script>
<%--以上為匯出至excel表單的功能 --%>


<style>
	.btn{
		background: #e8c497;
      	color: #fff;
	}
	.btn:hover {
      	background: #ffe6c7;
      	color: #fff;
   }
	.pagination>li.active>a {
	  	background: #d6b286;
	    color: #fff;
	}
	.pagination>li>a {
	    color: #d6b286;
	}
	.pagination>li>a:hover {
	  	background: #fff;
	    color: #5c3316;
	}
	.col-md-6 .pagination>li>a,
	.col-md-6 .pagination>li>span {
  	  	border: 1px solid #d6b286;
	}
	.pagination>.active>a:hover{
    	background-color: #e6c195;
    	border: solid 1px #e6c195;
	}
	a.btsp{
		font-size: 35px;
		color: #e8c497;
	}
	a.btsp:hover, a.btsp:active{
		color: #ffe6c7;
		text-decoration: none;
	}
	p.allitemtitle{
		color:#fff;
		font-weight: bold;
	}
	input.details{
		background-color: #bfbfbf;
		color: #fff;
	}
	input.details:hover{
		background-color: #e8c497;
	}
	input.update{
		background-color: #bfbfbf;
		color: #fff;
	}	
	input.update:hover{
		background-color: #e8c497;
	}
</style>
</head>

<body style="height: auto;"><!-- 步驟二 -->
   <!-- 以下 >>隱藏式菜單_內容 -->
     <header>
         <span class="toggle-button">
             <div class="menu-bar menu-bar-top"></div>
             <div class="menu-bar menu-bar-middle"></div>
             <div class="menu-bar menu-bar-bottom"></div>
         </span>
         <div class="menu-wrap">
             <div class="menu-sidebar" style="margin-top:46px;">
                 <ul class="menu">
                    <li><a href="<%= request.getContextPath() %>/back-end/member/listAllMember.jsp">會員資料管理</a></li>
	                <li><a href="<%= request.getContextPath() %>/back-end/item/itemHomePage.jsp">商城管理</a></li>
	                <li><a href="<%= request.getContextPath() %>/back-end/message/message_home.jsp">商城客服管理</a></li>
	                <li><a href="<%= request.getContextPath() %>/back-end/adopt/adopt_home.jsp">浪浪找家管理</a></li>
	                <li><a href="<%= request.getContextPath() %>/back-end/article/select_page_art.jsp">知識站管理</a></li>
	                <li><a href="<%= request.getContextPath() %>/back-end/announcemet/select_page.jsp">公告管理</a></li>
	                <li><a href="<%= request.getContextPath() %>/back-end/groomer/groomerList.jsp">美容師管理</a></li>
	                <li><a href="<%= request.getContextPath() %>/back-end/groomer/grooming_report.jsp">美容預約檢舉管理</a></li>
	                <li><a href="<%= request.getContextPath() %>/back-end/staff/allStaff.jsp">後台管理</a></li>
                 </ul>
             </div>
         </div>
     </header> 
 <!-- 以上 >>隱藏式菜單_內容 --> 
 
 
 
    <div id="wrapper" style="margin-right: 0px;margin-left: 127px;height: auto;">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content" style="height: 100%;">
                <nav class="navbar navbar-light navbar-expand bg-white mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <p style="width: 266px;height: 5px;margin-top:30px;margin-left:-13px;font-weight:bold;"><a class="btsp" href="Item_select_page.jsp">商品訂單管理</a></p>
                        <ul class="nav navbar-nav flex-nowrap ml-auto">                         
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow" style="margin-top:4px">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">員工名稱</span><img class="border rounded-circle img-profile" src="<%=request.getContextPath()%>/resources/images/items/MaoUniICON.png"></a>
                                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in"><a class="dropdown-item" href="#"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a><a class="dropdown-item" href="#"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Settings</a>
                                   <a class="dropdown-item" href="#"><i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Activity log</a>
                                <div class="dropdown-divider"></div><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a></div>
                   			</div>
                    	</li>
                    </ul>
            	</div>
            </nav>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="container-fluid" style="margin-top:45px;margin-left:-10px;">
    <div class="card" style="margin-left: -13px;">
        <div class="card-header py-3" style="background-color:#e8c497;">
            <p class="allitemtitle" style="margin: 1px;font-size: 20px;">所有訂單資料</p>
        </div>
        <div class="card-body" style="height: auto;">
            <div class="row">
                <div class="col-md-6 text-nowrap">
                    <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable" style="margin-left:4px;margin-top:5px;"><label>Show&nbsp;
                    <select class="form-control form-control-sm custom-select custom-select-sm"><option value="10" selected="">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select>&nbsp;</label>
                    <button onclick="exportTableToExcel('dataTable')" class="btn" type="button" style="margin-left:60px;">匯出EXCEL</button>
                    </div>
                </div>
                <div class="col-md-6">
                  <div class="text-md-right dataTables_filter" id="dataTable_filter"><label><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search" style="margin-top:5px;maring-left:-15px;width:200px;"></label></div>
                </div>
                <input class="action" type="hidden" name="action" value="getonemember">
				<button type="submit" class="btn btn-primary getList ml-4 my-1">
				查詢</button>
            </div>
            <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info">
                <table class="table my-0" id="dataTable">
                    <thead>
                        <tr>
                            <th style="width: 77px;text-align: center;font-size:4px;">商品訂單編號</th>
                            <th style="width: 77px;text-align: center;font-size:4px;">消費者編號</th>
                            <th style="width: 77.5px;text-align: center;font-size:4px;">總金額</th>
                            <th style="width: 91.5px;text-align: center;font-size:4px;">購買時間</th>
                            <th style="width: 91.5px;text-align: center;font-size:4px;">購買方式</th>
                            <th style="width: 91.5px;text-align: center;font-size:4px;">送貨方式</th>
                            <th style="width: 91.5px;text-align: center;font-size:4px;">訂單狀態</th>
                            <th style="width: 91.5px;text-align: center;font-size:4px;">備註</th>
                            <th style="width: 91.5px;text-align: center;font-size:4px;">訂單明細</th>
                            <th style="width: 70px;text-align: center;font-size:4px;">修改資料</th>
                        </tr>
                    </thead>
                                
					<tbody>	

							<c:forEach var="obuyVO" items="${list}" varStatus="varst">
												
							<tr style="width: 70px;text-align: center;">
								<td style="width: 90px;text-align: center;font-size:3px;">${obuyVO.obuyId}</td>

								<td style="width: 90px;text-align: center;font-size:3px;">${obuyVO.oMemId}</td>
								<td style="width: 100.5px;text-align: center;font-size:3px;">${obuyVO.oMoney}</td>

								<td style="width: 91.5px;text-align: center;font-size:3px;">
								<fmt:formatDate value="${obuyVO.oDate}" pattern="yyyy/MM/dd"/></td>
							
								<td style="width: 91.5px;text-align: center;font-size:3px;">
								<c:if test="${obuyVO.oPaying == '0'}">貨到付款</c:if>
								<c:if test="${obuyVO.oPaying == '1'}">ATM轉帳</c:if>
								<c:if test="${obuyVO.oPaying == '2'}">信用卡</c:if>
								</td>
								
								
								<td style="width: 91.5px;text-align: center;font-size:3px;">
								<c:if test="${obuyVO.oSend == '0'}">宅配</c:if>
								<c:if test="${obuyVO.oSend == '1'}">超商取貨</c:if>
								</td>
								
								<td style="width: 91.5px;text-align: center;font-size:3px;">
<%-- 								<c:out value="${varst.index}"></c:out> --%>
								<c:if test="${obuyVO.oSurvive == '0'}">等待處理</c:if>
								<c:if test="${obuyVO.oSurvive == '1'}">訂單完成</c:if>

								
								</td>
								<td style="width: 91.5px;text-align: center;font-size:3px;">${obuyVO.obuyOther}</td>

								<td><i class="far fa-address-card btn-primary" data-toggle="modal" data-target="#e${obuyVO.obuyId}"></i></td>
									
<%-- 								<td><a href="<%=request.getContextPath()%>/cd/cd.do?action=findByPrimaryKey"><i class="far fa-address-card btn-primary" data-toggle="modal" data-target="#speModal${cdVO.cdId}"></i></a></td> --%>
								
								
								<td>
								
								  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/buy/obuy.do" style="margin-bottom: 0px;">
								     <input type="hidden" name="obuyId"  value="${obuyVO.obuyId}">
								     <input type="hidden" name="oSurvive" value="1">
								     <input type="hidden" name="action"	value="update">
								     <button class=update type="submit" style="border:5px;border-radius:5px;">完成</button>
								     

								  </FORM>
								</td>
							</tr>
			
							<!-- ---------------------跳出視窗-->

					<div class="modal fade" id="e${obuyVO.obuyId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">	
					        <h5 class="modal-title" id="exampleModalCenterTitle">訂單明細</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					     	 <div class="container-fluid">
					     	 	<div class="row">
					     	 			<div class="col-md-3" style="font-weight: bold">訂單編號</div>
					     	 			<div class="col-md-3" style="font-weight: bold">商品編號</div>
					     	 			<div class="col-md-3" style="font-weight: bold">商品數量</div>
					     	 			<div class="col-md-3" style="font-weight: bold">金額</div>
					     	 	</div>		  
<!-- 					     	 	花括弧內是外面大圈的id，cd.cdpush是cd的方法去帶全部的集合去串 -->
										<c:forEach var="cda" items="${cd.cdpush(obuyVO.obuyId)}" >
					     	 			<div class="row">
					     	 			<div class="col-md-3" style="font-weight: bold">${cda.cdoId}</div>
					     	 			<div class="col-md-3" style="font-weight: bold">${cda.cdItemId}</div>
					     	 			<div class="col-md-3" style="font-weight: bold">${cda.cdAmount}</div>
					     	 			<div class="col-md-3" style="font-weight: bold">${cda.cdMoney}</div>
					     	 			</div>
										</c:forEach>									     						     	 			      
					      	  </div>
					      </div>
					      
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div> 
					
					
					
					     
					</c:forEach>		
 		
						
						</tbody>
					</table>
			</div>
		</div>
	</div>
</div>

		          
<!-- 步驟三 --> 
<div class="row">
	<div class="col-md-6"></div>
	<div class="col-md-6"">
	   <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
	       <ul class="pagination">
	           <li><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
	           <li class="active"><a class="page-link" href="#">1</a></li>
	           <li><a class="page-link" href="#">2</a></li>
	           <li><a class="page-link" href="#">3</a></li>
	           <li style="margin-right:25px;"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
	       </ul>
	   </nav>
	</div>
</div>
            </div>
        </div>
	</div>
</div>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/js/jquery_1.12.4.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    
<!-- 步驟三 -->  
<!-- 隱藏式菜單_連結--> 
<!--底下是jsp 裡面所連結打法可以參考一下-->
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>
    
</body>
</html>