<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.backstage_authority.model.*"%>
<%@ page import="com.backstage_function.model.*"%>




<%
	AuthorityService authoritySvc = new AuthorityService();
	List<AuthorityVO> list = authoritySvc.getAll();
	pageContext.setAttribute("list",list);
	
	FunctionService functionSvc = new FunctionService();
	List<FunctionVO> funlist = functionSvc.getAll();
	pageContext.setAttribute("funlist",funlist);
%>

<html style="height: auto;">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>hidden_menu</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu.css"> 
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css"> 




<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  
  
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
		font-weight: bold;
		margin-left: -5px;
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
	body{
	overflow-x:hidden; <!-- 此處做整個BODY橫向的隱藏多出的寬度 -->
	}


</style>
</head>

<body style="height: auto;">
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
       <div id="wrapper" style="margin-left: 120px;height: auto;">
        <div class="d-flex flex-column" id="content-wrapper" style="margin-right:5px;">
            
            	 <!-- 以下範圍為最上方包著商城管理以及右方後台人員的區塊, -->
                <nav class="navbar navbar-light navbar-expand bg-white mb-4 topbar static-top">
                    <div class="container-fluid" style="margin-top:23px;margin-left:-6px;">
<!--請看這行最右邊-->  <a class="btsp" href="Item_select_page.jsp">權限管理</a>  <!-- 這行是商城管理的標題，可以自行設定，還有href可以自行設定跳轉的頁面 -->
                       	 <ul class="nav navbar-nav flex-nowrap ml-auto" style="margin-top:-10px;">                         
                           
                            <li class="nav-item dropdown no-arrow" style="margin-top:10px">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">
                                	<span class="backperson" style="font-size:15px;font-weight:700;margin-right:5px;">後台人員</span>
                                	<img class="border rounded-circle img-profile" style="widht:40px;height:40px;margin-top:-5px;" src="<%=request.getContextPath()%>/resources/images/items/MaoUniICON.png"></a>
                                    <div class="dropdown-menu dropdown-menu-right animated--grow-in">
                                    	<a class="dropdown-item" href="#" style="font-weight:700;color:#646464;">Logout</a>
                                    </div>
	                   			</div>
	                    	</li>
	                    </ul>
	            	</div>
	            </nav>
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>員工權限&功能</h3>
	</td></tr>
</table>

<%-- <%-- 錯誤表列 --%>
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font style="color:red">請修正以下錯誤:</font> -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li style="color:red">${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<%-- </c:if> --%>

 <h5> <input type ="button" value = "新增"  weight="10px" height="20px" onclick = "window.location.href = '<%=request.getContextPath()%>/back-end/authority/addAuthority.jsp'"></h5>			

<table>
	<tr>
		<th>員工編號</th>
		<th>員工權限</th>
		<th>功能名稱</th>
		<th>修改</th>
		<th>單一查詢</th>
		
	</tr>
		<c:forEach var="AuthorityVO" items="${list}"> 
		<tr>
			<td>${AuthorityVO.id}</td>
			<td>${AuthorityVO.fun}</td>
			<td><c:forEach var="FunctionVO" items="${funlist}">
                    <c:if test="${AuthorityVO.fun==FunctionVO.id}">
	                  ${FunctionVO.name}
                    </c:if>
                </c:forEach>
			</td>
				
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backstage_authority/AuthorityServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="id" value="${AuthorityVO.id}">
			     <input type="hidden" name="action"	value="getOne_For_Updat"></FORM>
			</td>
			
			<td>
			   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backstage_authority/AuthorityServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="單一查詢">
			     <input type="hidden" name="id" value="${AuthorityVO.id}">
			     <input type="hidden" name="action" value="get_One_Display"></FORM>
			</td>
			
			
			
			
		</tr>
	</c:forEach>
</table>
 <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    
    

	<!-- 以下為隱藏式菜單連結(JSP)--> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>
</body>
</html>