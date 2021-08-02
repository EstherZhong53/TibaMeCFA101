<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>後台_文章首頁</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu.css"> 
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css">

<style>
h4 {
	font-size: 25px;
    margin-top: 20px;
	font-weight: 700;
	color: #31323a;
	letter-spacing: 0.25px;
  font-family: "Lucida Console", "Courier New", monospace;
}
 p{
  font-size: 19px;
	font-weight: 700;
	color: #31323a;
	letter-spacing: 0.25px;
 }
 hr{
    size: 20px;
    max-width:1200px;
    margin-left: 10px;
    margin-right: 20px;
	 margin-top: 20px;
    *margin: 0;
    border: 0;
   color: #DCDCDC;
    background-color: #DCDCDC;
    height: 1px;
  }
 .centered{
    position: relative;
    max-width:1150px;
    margin-left: 90px;
    margin-right: 90px;
  	margin-top: 50px;
 }
 .centered img { 
    
    width: 100%;
    overflow: hidden;
    height: 400px;
}
  .center {
  font-weight: bold;     /* 字體變粗 */
  position: absolute;
  top: -5%;
  left: 20%;
  transform: translate(-50%, -50%);
  font-size: 50px;
  font-family: "Lucida Console", "Courier New", monospace;
  /* background-color:MediumSeaGreen; */
  color: MediumSeaGreen;
}
.write{
  color: #31323a;
}
.right{
    position: relative;
	width:50%;
    left: 50%;   /*距離左方邊界50%地方置入*/
    margin-top: -438px;
  }
.primary-button a,button {
  border-radius: 25px;
	font-size: 14px;
	font-weight: 700;
	text-transform: uppercase;
  background-color: transparent;
	display: inline-block;
	padding: 8px 20px;
	color: #008CBA;
	border: 2px solid #008CBA;
	transition: all 0.5s;
  margin-top: 20px;
}
.primary-button a:hover,
button:hover {
	color: white;
	background-color: #008CBA;
}
.button {
  border-radius: 25px;
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

 <!-- 以下範圍為最上方包著商城管理以及右方後台人員的區塊, -->
                <nav class="navbar navbar-light navbar-expand bg-white mb-4 topbar static-top">
                    <div class="container-fluid" style="margin-top:23px;margin-left:-6px;">
<!--請看這行最右邊-->  <a class="btsp" href="<%=request.getContextPath()%>/back-end/article/select_page_art.jsp">知識站管理</a>  <!-- 這行是商城管理的標題，可以自行設定，還有href可以自行設定跳轉的頁面 -->
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


  <div class="centered">
<!--   <div class="center">後台_知識站首頁</div> -->
     <img src="<%=request.getContextPath()%>/resources/images/dog9.jpg" alt="Cinque Terre" >

     <h4> SEARCH 後台_查詢文章所有資料</h4>
     <div class="primary-button">
         <a href='<%=request.getContextPath()%>/back-end/article/listAllArt.jsp'>後台查詢文章所有資料</a>
     </div>

 <br>
 
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/article/art.do" >
        <div class="write">
       <b>輸入文章Id (如1):</b>
        </div>
        <input type="text" name="id">
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" class="button" value="送出">
       </FORM>

 <br>
 
   <jsp:useBean id="artSvc" scope="page" class="com.article.model.ArtService" />
      
       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/article/art.do" >
        <div class="write">
             <b>選擇文章Id:</b>
         </div>
         <select size="1" name="id" style="width:165px;">
            <c:forEach var="artVO" items="${artSvc.all}" > 
               <option value="${artVO.id}">${artVO.id}
            </c:forEach>   
         </select>
     <input type="hidden" name="action" value="getOne_For_Display">
     <input type="submit"  class="button" value="送出">
  </FORM>

<br>
  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/article/art.do" >
    <div class="write">
    <b>選擇文章名稱:</b>
    </div>
     <select size="1" name="id" style="width:165px;">
        <c:forEach var="artVO" items="${artSvc.all}" > 
           <option value="${artVO.id}">${artVO.name}
        </c:forEach>   
      </select>
    <input type="hidden" name="action" value="getOne_For_Display">
    <input type="submit"  class="button" value="送出">
 </FORM>
 
 <hr>
 <br>
 
 <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
 
 <div class="right">
    <h4> Add 新增文章</h4>

   <div class="primary-button">
      <a href='<%=request.getContextPath()%>/back-end/article/addArt.jsp'>新增文章
            </a>
    </div>   
 </div>
 <br>
</div>
 
   <!-- 以下為boostrap靜態檔引入,不可少!!! 路徑錯了會跑版-->
    <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <!-- 以下為隱藏式菜單連結(JSP)--> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>
 

</body>
</html>