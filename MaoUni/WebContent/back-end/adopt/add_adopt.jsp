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


<%
	ImfVO imfVO = (ImfVO) request.getAttribute("ImfVO");
	
MechanismService mechanismService = new MechanismService();
List<MechanismVO> mechanismlist = mechanismService.getAll();
	pageContext.setAttribute("mechanismlist", mechanismlist);
	
VarietyService varietyService = new VarietyService();
List<VarietyVO> varietylist = varietyService.getAll();
pageContext.setAttribute("varietylist",varietylist);
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>hidden_menu</title>
<html style="height: auto;">
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/hidden_menu.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css">
<title>追蹤</title>


<style>
table#table-1 {
	background-color: #FFF8DC;
	border: 2px solid black;
	text-align: center;
	margin: auto;
	margin-top: 280px;
	margin-bottom: 1px;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
	margin: auto;
	margin-top: 2px;
	margin-bottom: 10px;
}

h4 {
	color: blue;
	display: inline;
	margin: auto;
	margin-bottom: 10px;
	margin-top: 300px;
}
</style>

<style>
add {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
	margin: auto;
	margin-bottom: 10px;
	margin-top: 10px;
}

table, th, td {
	border: 0px solid #CCCCFF;
	color: black;
	margin: auto;
	margin-bottom: 10px;
	margin-top: 40px;
}

th, td {
	padding: 1px;
	margin: auto;
	color: black;
	margin-bottom: 1px;
	margin-top: 10px;
	margin-bottom: 5px;
}

.btn {
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
	font-weight: bold;
	margin-left: -5px;
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

body {
	overflow-x: hidden;
	<!--
	此處做整個BODY橫向的隱藏多出的寬度
	-->
}
</style>
</head>
<!-- 以下為隱藏式菜單內容 -->
<header>
	<span class="toggle-button"
		style="margin-left: -5px; margin-top: -7px;">
		<div class="menu-bar menu-bar-top"></div>
		<div class="menu-bar menu-bar-middle"></div>
		<div class="menu-bar menu-bar-bottom"></div>
	</span>
	<div class="menu-wrap">
		<div class="menu-sidebar" style="margin-top: 30px;">
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
<div id="wrapper" style="margin-left: 120px; height: auto;">
	<div class="d-flex flex-column" id="content-wrapper"
		style="margin-right: 5px;">
		<nav
			class="navbar navbar-light navbar-expand bg-white mb-4 topbar static-top">
			<div class="container-fluid"
				style="margin-top: 23px; margin-left: -6px;">
				<!--請看這行最右邊-->
				<a class="btsp"
					href="<%=request.getContextPath()%>/back-end/staff/allStaff.jsp">寵物新增</a>
				<ul class="nav navbar-nav flex-nowrap ml-auto"
					style="margin-top: -10px;">
					<li class="nav-item dropdown no-arrow" style="margin-top: 10px">
						<div class="nav-item dropdown no-arrow">
							<a class="dropdown-toggle nav-link" data-toggle="dropdown"
								aria-expanded="false" href="#"> <img
								class="border rounded-circle img-profile"
								style="widht: 40px; height: 40px; margin-top: -5px;"
								src="<%=request.getContextPath()%>/resources/images/items/MaoUniICON.png"></a>
							<div class="dropdown-menu dropdown-menu-right animated--grow-in">
								<a class="dropdown-item"
									href="<%=request.getContextPath()%>/back-end/staff/login.jsp"
									style="font-weight: 700; color: #646464;">Logout</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</nav>
		<div align="center">

			<table align="center" cellpadding="10" border='2'>
				<tr>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MaoUni/ImfServlet" enctype="multipart/form-data" name="form1">
					<tr>
						<h5>寵物類別：						
						<select name="adopt" required>
							<option value="">選擇類別</option>
							<c:forEach var="varietyVO" items="${varietylist}">
							<option value="${varietyVO.varId}">${varietyVO.varName}</option>
		                    </c:forEach>
						</select>					
				</tr>
				<tr>	
				<h5>所在機構：
					<select name="mech" required>
						<option value="">請選擇所在地機構</option>
						<c:forEach var="mechanismVO" items="${mechanismlist}">
							<option value="${mechanismVO.id}">${mechanismVO.name}</option>
	                    </c:forEach>
					</select>	
				</h5>												
				</tr>
				<tr>
					<h5>名字
					<input type="TEXT" name="name" size="20"
						value="${param.name}"></td>
				</tr>
				<tr>
					<h5>年齡
					<input type="TEXT" name="year" size="20"
						value="${param.year}"></td>
				</tr>
				<tr>
					<h5>目前狀態
					<input type="TEXT" name="sit" size="20"
						value="${param.sit}"></td>
				</tr>
				<tr>					
					<h5>上傳圖片
					<input type="file" name="photo" id="photo" size="45">
				</tr>
				<jsp:useBean id="ImfSvc" scope="session" class="com.adopt_imf.model.ImfService" />
			</table>
			<br> <input type="hidden" name="action" value="inserImf">
			<input type="submit" value="送出新增"> <a id href="add_adopt.jsp">檢視上傳圖片</a>
			</FORM>
		</div>
		</body>
		<script>
			const sessionId = "${sessionId}";
		</script>
		<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
		<!-- 以下為隱藏式菜單連結(JSP)-->
		<script
			src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>
		</body>
</html>