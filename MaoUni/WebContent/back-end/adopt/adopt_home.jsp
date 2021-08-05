<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adopt_imf.model.*"%>
<%@ page import="com.tracking_adopt.model.*"%>
<%@ page import="com.adopt_mechanism.model.*"%>
<%@ page import="com.variety.model.*"%>
<%@ page import="com.variety.model.VarietyVO"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.tracking_adopt.model.TrackingVO"%>
<%@ page import="com.adopt_mechanism.model.*"%>



<%
	ImfService ImfSvc = new ImfService();
	List<ImfVO> list = ImfSvc.getAll();
	pageContext.setAttribute("list", list);
	
	VarietyService varSvc = new VarietyService();
	List<VarietyVO> varlist = varSvc.getAll();
	pageContext.setAttribute("varlist", varlist);
	
	
	MechanismService mechanismSvc=new MechanismService();
	List<MechanismVO> Mechlist = mechanismSvc.getAll();
// 	MechanismVO mechanismVO = new MechanismVO();
// 	String tel = mechanismVO.getTel();
	pageContext.setAttribute("Mechlist", Mechlist);
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
<title>後臺認養頁面</title>

<style>
.confirm {
	font-family: DFKai-sb;
	width: 80px;
	height: 80px;
	margin-left: 1060px;
	margin-top: 10px;
}

table {
	border: 2px;
	width: 1000px;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
	max-width: 100%;
	display: table;
	background-color: #bbb;
	font-size: 20px;
	font-family: DFKai-sb;
	margin-top: 300px;
}

.Photo {
	height: 280px;
	width: 280px;
}

.toadd{
	margin-top:20px;
	margin-buttom:10px;
	margin-right:500px
}
</style>
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
<body>
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
	
	<div class="textttt" style="width: 100%; height: 2000px;">
<input type="button" value="新增" onclick="location.href='<%=request.getContextPath()%>/back-end/adopt/add_adopt.jsp'" id="toadd">
		<table style="border: 3px #2F0000 dashed;" cellpadding="10" border='1'>
			<tr>
				<th>照片</th>
				<th>動物編號</th>
				<th>動物品種</th>
				<th>所在機構</th>
				<th>機構電話</th>
				<th>名字</th>
				<th>年齡</th>
				<th>身體狀態</th>

			</tr>

			<c:forEach var="ImfVO" items="${list}">
				<tr>
					<td><img class="Photo"
						src="<%=request.getContextPath()%>/ImfPhotoServlet?AI_ID=${ImfVO.id}"></td>
					<td>${ImfVO.id}</td>

					<td><c:forEach var="VarietyVO" items="${varlist}">
						<c:if test="${ImfVO.adopt==VarietyVO.varId}">
	                 	 ${VarietyVO.varName}
                   	    </c:if>
						</c:forEach></td>
					<td>${ImfVO.mech2}</td>
					<td>
					<c:forEach var="MechanismVO" items="${Mechlist}">
						<c:if test="${ImfVO.mech==MechanismVO.id}">
						${MechanismVO.tel}
						</c:if>
					</c:forEach></td>
					<td>${ImfVO.name}</td>
					<td>${ImfVO.year}</td>
					<td>${ImfVO.sit}</td>
			</c:forEach>

		</table>	

		<script>
			function sumbmitcheck() {
				console.log('hi')
			}

			function highLight() {
				obj = event.srcElement;
				obj.style.color = "#FFFF99";
				obj.style.backgroundColor = "#00FFFF";
			}
			function nocolor() {
				obj = event.srcElement;
				obj.style.color = "black";
				obj.style.backgroundColor = "white";
			}

			$(".addTrack").click(function(e) {
				e.preventDefault();
				$.ajax({
					url : "/MaoUni/TrackingController",
					type : "post",
					data : $(this).serialize(),
					success : function(data) {
						if (data === 0) {
							swal("新增失敗！", "這個毛孩已經在追蹤名單囉!", "warning");
						} else {
							swal("新增成功！", "這個毛孩加入追蹤名單囉!", "success");
						}
					}
				})
			});

		</script>
		<script>
			const sessionId = "${sessionId}";
		</script>



		<!-- 以下為CDN引入 -->
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