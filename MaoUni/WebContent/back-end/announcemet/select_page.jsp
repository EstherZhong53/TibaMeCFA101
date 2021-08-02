<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>後台_公告首頁</title>
 
<!--  連結外部css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu.css"> 
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css"> 

<style>
  input, select, textarea {
	outline: none;
}
a:hover {
	color: #FC3;
	text-decoration: none;
}
p {
	font-size: 14px;
	line-height: 25px;
	color: #7a7a7a;
	letter-spacing: 0.2px;
}
h4 {
	font-size: 19px;
	font-weight: 700;
	color: #31323a;
	letter-spacing: 0.25px;
}
img {
	width: 100%;
	overflow: hidden;
}
.i5 {
	margin-top: -200px;
    max-width:1150px;
    margin-left: 90px;
    margin-right: 90px;
}
.i5 .container-fluid {
	padding-left: 0px;
	padding-right: 0px;
}
.i5 h4 {
	margin: 30px 0px 20px 0px;
}
.i5 .primary-button {
	margin-top: 20px;
}
.primary-button a,button {
	font-size: 14px;
	font-weight: 700;
	text-transform: uppercase;
  background-color: transparent;
	display: inline-block;
	padding: 8px 20px;
	color: #008CBA;
	border: 2px solid #008CBA;
	transition: all 0.5s;
}
.primary-button a:hover,
button:hover {
	color: white;
	background-color: #008CBA;
}
#erroeMasgs{
    margin-left: 90px;
  }
  .left-image{
    max-width:1150px;
    margin-left: 90px;
    margin-right: 600px;
	margin-top: 20px;
    height: -20px;
   
  }
  .right{
    position: relative;
	width:50%;
    left: 110%;   
    margin-top: -75%;
  }
  .left-image .right {
	padding-left: 0px;
	padding-right: 0px;
}
.left-image h4 {
	margin: 30px 0px 20px 0px;
}
hr{
    size: 20px;
    max-width:1150px;
    margin-left: 90px;
    margin-right: 90px;
	/* margin-top: 170px; */
    *margin: 0;
    border: 0;
   color: #DCDCDC;
    background-color: #DCDCDC; 
    height: 1px;
  }
  .i5 {
	margin-top: 1px;
    max-width:1150px;
    margin-left: 90px;
    margin-right: 90px;
}
.write{
  color: #31323a;
  
}
.button {
  font-size: 14px;
	font-weight: 700;
	text-transform: uppercase;
    background-color: transparent;
	display: inline-block;
	padding: 8px 20px;
	color: #008CBA;
	border: 2px solid #008CBA;
	transition: all 0.5s;
	border-radius: 12px;
}
  .button:hover {
    color: white;
	background-color: #008CBA;
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
<body >

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

 <!-- 以下範圍為左上方包著"XX"管理以及右方後台人員的區塊 -->
                <nav class="navbar navbar-light navbar-expand bg-white mb-4 topbar static-top">
                    <div class="container-fluid" style="margin-top:23px;margin-left:-6px;">
<!--請看這行最右邊-->  <a class="btsp" href="<%=request.getContextPath()%>/back-end/announcemet/select_page.jsp">公告管理</a>  <!-- 這行是商城管理的標題，可以自行設定，還有href可以自行設定跳轉的頁面 -->
                       	 <ul class="nav navbar-nav flex-nowrap ml-auto" style="margin-top:-10px;">                         
                           
<!--                             <li class="nav-item dropdown no-arrow" style="margin-top:10px"> -->
<!--                                 <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"> -->
<!--                                 	<span class="backperson" style="font-size:15px;font-weight:700;margin-right:5px;">後台人員</span> -->
<%--                                 	<img class="border rounded-circle img-profile" style="widht:40px;height:40px;margin-top:-5px;" src="<%=request.getContextPath()%>/resources/images/items/MaoUniICON.png"></a> --%>
<!--                                     <div class="dropdown-menu dropdown-menu-right animated--grow-in"> -->
<!--                                     	<a class="dropdown-item" href="#" style="font-weight:700;color:#646464;">Logout</a> -->
<!--                                     </div> -->
<!-- 	                   			</div> -->
<!-- 	                    	</li> -->
	                    </ul>
	            	</div>
	            </nav>
<!-- 以上範圍為最上方包著商城管理以及右方後台人員的區塊, --> 


  <!-- body 內容開始 -->
   <section class="i5">
    <div class="container-fluid">
      <img src="<%=request.getContextPath()%>/resources/images/i5.jpg" alt="">
            <h4>Announcemet 公告首頁</h4>
               <div class="primary-button">
                   <a href='<%=request.getContextPath()%>/back-end/announcemet/addAnn.jsp'>新增公告</a>
                </div>
     </div>
     

<!--      左邊照片 -->
  </section>
  <br>
  <hr>
     <section class="left-image">
            <img src="<%=request.getContextPath()%>/resources/images/dog1.jpg" alt="">
        <div class="right">
              <h4> Search 公告資料查詢</h4>
              <div class="primary-button">
                <a href='<%=request.getContextPath()%>/back-end/announcemet/listAllAnn.jsp'>查詢所有資料</a>
              </div>
     <br>
 <br>

              <!-- <div class="primary-button"> -->
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/announcemet/ann.do" >

                  <div class="write">
                  <b>輸入公告編號 (如1):</b>
                  </div>
                  <br>
                  <input type="text" name="id" style="width:150px;">
                  <input type="hidden" name="action" value="getOne_For_Display">
                  <input type="submit" class="button" value="送出" >
                </FORM>
            
                <jsp:useBean id="annSvc" scope="page" class="com.announcemet.model.AnnService" />

            <br>

                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/announcemet/ann.do" >
                  <div class="write">
                  <h3>選擇公告編號:</h3>
                </div>
                  <br>
                  <select size="1" style="width:150px;" name="id">
                    <c:forEach var="annVO" items="${annSvc.all}" > 
                     <option value="${annVO.id}">${annVO.id}
                    </c:forEach>   
                  </select>
                  <input type="hidden" name="action" value="getOne_For_Display">
                  <input type="submit" class="button" value="送出">
             <br>
             <br>

                  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/announcemet/ann.do" >
                    <div class="write">
                    <b>選擇公告內容:</b>  
                  </div>
                    <br>
                    <select size="1" style="width:150px;" name="id">
                      <c:forEach var="annVO" items="${annSvc.all}" > 
                       <option value="${annVO.id}">${annVO.content}
                      </c:forEach>   
                    </select>
                    <input type="hidden" name="action" value="getOne_For_Display">
                    <input type="submit"  class="button" value="送出">
                 </FORM>

  
    </section>
    
    <!-- <%-- 錯誤表列 --%> -->

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
    
    
 <!-- 以下為boostrap靜態檔引入,不可少!!! 路徑錯了會跑版-->
  <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
 <!-- 以下為隱藏式菜單連結(JSP)--> 
   <script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>
    
</body>
</html>