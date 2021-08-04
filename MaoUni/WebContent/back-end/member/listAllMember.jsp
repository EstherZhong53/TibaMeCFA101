<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	MemberService memSvc = new MemberService();
	List<MemberVO> list = memSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MaoUni_Member</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/fonts/fontawesome-all.min.css">
<script src="<%=request.getContextPath()%>/resources/js/fontawesome.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/hidden_menu.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css">


<style>
.btn {
	background: #e8c497;
	color: #fff;
}
.btn:hover {
	background: #ffe6c7;
	color: #fff;
}
i:hover{
cursor: pointer;
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
.col-md-6 .pagination>li>a, .col-md-6 .pagination>li>span {
	border: 1px solid #d6b286;
}
.pagination>.active>a:hover {
	background-color: #e6c195;
	border: solid 1px #e6c195;
}
a.btsp {
	font-size: 35px;
	color: #e8c497;
}
a.btsp:hover, a.btsp:active {
	color: #ffe6c7;
	text-decoration: none;
}
p.allitemtitle {
	color: #fff;
	font-weight: bold;
}
input.details {
	background-color: #bfbfbf;
	color: #fff;
}
input.details:hover {
	background-color: #e8c497;
}
input.update {
	background-color: #bfbfbf;
	color: #fff;
}
input.update:hover {
	background-color: #e8c497;
}
</style>
</head>

<body style="height: auto;">
	<!-- 步驟二 -->
	<!-- 以下 >>隱藏式菜單_內容 -->
     <header>
         <span class="toggle-button" style="margin-left:-5px;margin-top:-7px;">
             <div class="menu-bar menu-bar-top"></div>
             <div class="menu-bar menu-bar-middle"></div>
             <div class="menu-bar menu-bar-bottom"></div>
         </span>
         <div class="menu-wrap">
             <div class="menu-sidebar" style="margin-top:30px;">
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



	<div id="wrapper"
		style="margin-right: 0px; margin-left: 127px; height: auto;">
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content" style="height: 100%;">
				<nav
					class="navbar navbar-light navbar-expand bg-white mb-4 topbar static-top">
					<div class="container-fluid">
						<button class="btn btn-link d-md-none rounded-circle mr-3"
							id="sidebarToggleTop" type="button">
							<i class="fas fa-bars"></i>
						</button>
						<p
							style="width: 266px; height: 5px; margin-top: 30px; margin-left: -13px; font-weight: bold;">
							<a class="btsp" href="Item_select_page.jsp">會員資料管理</a>
						</p>
						<ul class="nav navbar-nav flex-nowrap ml-auto">
							<div class="d-none d-sm-block topbar-divider"></div>
							<li class="nav-item dropdown no-arrow" style="margin-top: 4px">
								<div class="nav-item dropdown no-arrow">
									<a class="dropdown-toggle nav-link" data-toggle="dropdown"
										aria-expanded="false" href="#"><span
										class="d-none d-lg-inline mr-2 text-gray-600 small">員工名稱</span><img
										class="border rounded-circle img-profile"
										src="<%=request.getContextPath()%>/resources/images/items/MaoUniICON.png"></a>
									<div
										class="dropdown-menu shadow dropdown-menu-right animated--grow-in">
										<a class="dropdown-item" href="#"><i
											class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a><a
											class="dropdown-item" href="#"><i
											class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Settings</a>
										<a class="dropdown-item" href="#"><i
											class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Activity
											log</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#"><i
											class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</nav>

				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>

				<div class="container-fluid"
					style="margin-top: 45px; margin-left: -10px;">
					<div class="card" style="margin-left: -13px;">
						<div class="card-header py-3" style="background-color: #e8c497;">
							<p class="allitemtitle" style="margin: 1px; font-size: 20px;">所有會員資料</p>
						</div>

						<div class="card-body" style="height: auto;">
							<div class="row">
								<div class="col-md-6 text-nowrap">
									<div id="dataTable_length" class="dataTables_length"
										aria-controls="dataTable"
										style="margin-left: 4px; margin-top: 5px;">
										<label>Show&nbsp; <select
											class="form-control form-control-sm custom-select custom-select-sm"><option
													value="10" selected="">10</option>
												<option value="25">25</option>
												<option value="50">50</option>
												<option value="100">100</option></select>&nbsp;
										</label> <input class=update type="submit"
											onclick="location.href='<%=request.getContextPath()%>/back-end/member/addMember.jsp'"
											value="新增會員"
											style="border: 5px; border-radius: 5px; height: 35px; width: 100px; margin-left: 21%">

										<input class=update type="button"
											onclick="location.href='<%=request.getContextPath()%>/back-end/pet/petlistAll.jsp'"
											value="毛孩管理"
											style="border: 5px; border-radius: 5px; height: 35px; width: 100px; margin-left: 5%;">
									</div>
								</div>
								<div class="col-md-6">
									<div class="text-md-right dataTables_filter"
										id="dataTable_filter">
										<label><input type="search"
											class="form-control form-control-sm"
											aria-controls="dataTable" placeholder="Search"
											style="margin-top: 5px; maring-left: -22px; width: 200px;"></label>
								<input class="action" type="hidden" name="action" value="getonemember">
								<button type="submit" class="btn btn-primary getList ml-4 my-1">
								查詢</button>
									</div>
								</div>
							</div>
							<div class="table-responsive table mt-2" id="dataTable-1"
								role="grid" aria-describedby="dataTable_info">
								<table class="table my-0" id="dataTable">
									<thead>
										<tr>
											<th style="width: 77px; text-align: center; font-size:1.5px;">會員編號</th>
											<th style="width: 77px; text-align: center; font-size:1.5px;">姓名</th>
											<th style="width: 112.5px; text-align: center; font-size:1.5px;">信箱</th>
											<th style="width: 91.5px; text-align: center; font-size:1.5px;">身分證</th>
											<th style="width: 91.5px; text-align: center; font-size:1.5px;">性別</th>
											<th style="width: 91.5px; text-align: center; font-size:1.5px;">電話</th>
											<th style="width: 91.5px; text-align: center; font-size:1.5px;">地址</th>
											<th style="width: 98.5px; text-align: center; font-size:1.5px;">生日</th>
											<th style="width: 91.5px; text-align: center; font-size:1.5px;">身分</th>
											<th style="width: 70px; text-align: center; font-size:1.5px;">狀態</th>
											<th style="width: 70px; text-align: center; font-size:1.5px;">更新時間</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="memberVO" items="${list}">
											<tr style="width: 70px; text-align: center;">
												<td style="width: 90px; text-align: center; font-size:2px;">${memberVO.memId}</td>
												<td style="width: 90px; text-align: center; font-size:2px;">${memberVO.memName}</td>
												<td style="width: 100.5px; text-align: center; font-size:2px;">${memberVO.memEmail}</td>
												<td class="memIdenity"
													style="width: 91.5px; text-align: center; font-size:2px;">${memberVO.memIdenity}</td>
												<td style="width: 91.5px; text-align: center; font-size:2px;">${memberVO.memGender}</td>
												<td class="memPh"
													style="width: 91.5px; text-align: center; font-size:2px;">${memberVO.memPh}</td>
												
												<td><i class="far fa-address-card btn-primary"
													data-toggle="modal"
													data-target="#speModal${memberVO.memId}"></td>

												<td style="width: 91.5px; text-align: center; font-size:0.5px;">${memberVO.memBirthday}</td>


												<td style="width: 91.5px; text-align: center; font-size:2px;">

													<c:if test="${memberVO.memPosition == '0'}">會員</c:if> <c:if
														test="${memberVO.memPosition == '1'}">美容師</c:if>
												</td>


												<td style="width: 91.5px; text-align: center; font-size:2px;">
													<c:if test="${memberVO.memSurvive == '0'}">審核中</c:if> <c:if
														test="${memberVO.memSurvive == '1'}">正常</c:if> <c:if
														test="${memberVO.memSurvive == '2'}">停權</c:if>
												</td>
												<td style="width: 90px; text-align: center; font-size:2px;">
													<fmt:formatDate value="${memberVO.memUpdate}"
														pattern="yyyy/MM/dd" />

												</td>

												<td>
													<FORM METHOD="post"
														ACTION="<%=request.getContextPath()%>/member/member.do"
														style="margin-bottom: 0px;">
														<input class=update type="submit" class="button"
															value="立即修改" style="border: 5px; border-radius: 5px;">
														<input type="hidden" name="memId"
															value="${memberVO.memId}"> 
															<input type="hidden" name="action" value="getOne_For_Update">
													</FORM>
												</td>
											</tr>
							</div>
						</div>
					</div>
				</div>

				<!-- ---------------------跳出視窗嘗試 -->

				<div class="modal fade" id="speModal${memberVO.memId}" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">會員地址</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="container-fluid">
									<div class="row my-3">
										<div class="col-md-3" style="font-weight: bold">地址</div>
										<div class="col-md-9 ml-auto">${memberVO.memAddres}</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
								</c:forEach>
								</tbody>
								</table>




								<!-- 步驟三 -->
								<div class="row">
									<div class="col-md-6"></div>
									<div class="col-md-6"">
										<nav
											class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
											<ul class="pagination">
												<li><a class="page-link" href="#" aria-label="Previous"><span
														aria-hidden="true">«</span></a></li>
												<li class="active"><a class="page-link" href="#">1</a></li>
												<li><a class="page-link" href="#">2</a></li>
												<li><a class="page-link" href="#">3</a></li>
												<li style="margin-right: 25px;"><a class="page-link"
													href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
											</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript">
$(document).ready(function(){
$(".memIdenity").each(function(){
var memIdenity =$(this).text();
var memI = memIdenity.substr(0,3) + '****' + memIdenity.substr(memIdenity.length-4);
$(this).texl(memI);
});
$$(".memPh").each(function(){
	var memPh=$(this).tetx();
	if(memPh!='')
		var Ph =  memPh.substr(0.3) + '****' memPh.substr(7);
		$(this).text(Ph);
}
});
})
	
</script>
				<script src="<%=request.getContextPath()%>/resources/bootstrap/jquery/jquery.min.js"></script>
				<script src="<%=request.getContextPath()%>/resources/js/jquery_1.12.4.min.js"></script>

				<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

				<script src="<%=request.getContextPath()%>/resources/js/fontawesome.js"></script>
				<script src="<%=request.getContextPath()%>/resources/js/fontawesome.js"></script>
				<!-- 步驟三 -->
				<!-- 隱藏式菜單_連結-->
				<!--底下是jsp 裡面所連結打法可以參考一下-->
				<script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script>
				<script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>
</body>
</html>