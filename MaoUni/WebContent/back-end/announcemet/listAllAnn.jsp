<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.announcemet.model.*"%>

<!-- 查詢全部_公告 -->

<%
    AnnService annSvc = new AnnService();
    List<AnnVO> list = annSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>後台_查詢所有資料</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu.css"> 
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css"> 

<style>
 span{
    font-family:monospace;
  }
  h3 {
    text-align:center;
    
   }
.table1 {
 margin-top: 10px;
  border-collapse: collapse;
  width: 100%;
  font-family: Microsoft JhengHei;
  max-width:1050px;
  margin-left: auto;
  margin-right: auto;
  padding-top: 0;
  color: black;
}
 .table1 th {
  padding-top: 20px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #D2AD86;   /* 藍色  #008CBA; */
  text-align:center; 
  margin-left: auto; 
  margin-right: auto ;
  font-size:20px;
  color: white;
}
tr:hover {
  background-color:LightGray;
}
th, td {
  padding: 8px;
  text-align:center;
/*   text-align: left; */
  border-bottom: 1px solid #ddd;
}
.button {
    background-color: white; 
    color: black; 
    border: 2px solid #D2AD86;
   border-radius: 12px;
    width: 70px;
    height: 40px;
    font-size:15px;
}
  .button:hover {
    background-color: #D2AD86; /* Green */
    color: white;
}
.content_image{
    display: block;
    margin-left: auto;
    margin-right: auto
}
#top_pages1{
  /*往右邊移動 */
margin-left: 120px; 
}
#pages {
  padding-top: 20px;
  margin: 0 auto;
  /* 置中 */
  text-align: center;
}
#erroeMasgs{
  
  margin-left: 60px;
}
.btn:hover {
      	background: #ffe6c7;
      	color: #fff;
   }
   a.btsp{
		font-size: 35px;
		color: #e8c497;
		font-weight: bold;
		margin-left: 100px;
	}
	a.btsp:hover, a.btsp:active{
		color: #ffe6c7;
		text-decoration: none;
	}
	p.allitemtitle{
		color:#fff;
		font-weight: bold;
	}
</style>

</head>
<body>
<span> 
<!-- 以下為header ******************************************************************************************* -->
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

<!--以上為header ***********************************************************************-->

<!-- 以下範圍為左上方包著"XX"管理以及右方後台人員的區塊, -->
                <nav class="navbar navbar-light navbar-expand bg-white mb-4 topbar static-top">
                    <div class="container-fluid" style="margin-top:23px;margin-left:-6px;">
<!--請看這行最右邊-->  <a class="btsp" href="<%=request.getContextPath()%>/back-end/announcemet/select_page.jsp">公告管理</a>  <!-- 這行是商城管理的標題，可以自行設定，還有href可以自行設定跳轉的頁面 -->
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
<!-- 以上範圍為最上方包著商城管理以及右方後台人員的區塊, --> 
     
<!--    提示錯誤訊息  -->
 <div id="erroeMasgs"> 
       <c:if test="${not empty errorMsgs}">
	       <font style="color:red">請修正以下錯誤:</font>
	     <ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	     </ul>
       </c:if>
 </div>
 
<!--     內容表格 -->
 <table  class="table1">
    <tr>
        <th>照片</th>
		<th>公告編號</th>
		<th>公告內容</th>
		<th>上次修改日期</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	
	<div  id="top_pages1">
   <%@ include file="page1.file" %>  
   </div>
   
     <c:forEach var="annVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		  <tr>
		    <td>
		    <div class="content_image">
		      <img src="<%=request.getContextPath()%>/AnnImgServlet?id=${annVO.id}" 
			         width="180" height="150">
			  </div>       
		    </td>
			<td>${annVO.id}</td> 
			<td>${annVO.content}</td>
			<td>${annVO.update}</td>

          <td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/announcemet/ann.do"
			             style="margin-bottom: 0px;">
			     <input type="submit" class="button" value="編輯">
			     <input type="hidden" name="id"  value="${annVO.id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/announcemet/ann.do" 
			            style="margin-bottom: 0px;">
			     <input type="submit" class="button" value="刪除">
			     <input type="hidden" name="id"  value="${annVO.id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
  </table>   
   <div  id="pages">
        <%@ include file="page2.file" %> 
    </div>          
</span> 

<!-- 以下為boostrap靜態檔引入,不可少!!! 路徑錯了會跑版-->
    <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
 <!-- 以下為隱藏式菜單連結(JSP)--> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>
    
</body>
</html>