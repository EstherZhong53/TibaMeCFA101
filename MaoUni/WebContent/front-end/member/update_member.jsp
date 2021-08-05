<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
  MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員後台資料修改</title>
<!-- 隱藏式菜單_連結 -->
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css">

   <style>
   
.memstat{
display: flex;
align-items: center;
justify-content: center;
/* flex-direction: column; */
height: 40px;
width: 120px;
padding: 12px;
color: white;
font-size:14px;
background:#d4af81 ;
border-radius: 5px;
border-style:none;
font-weight:bold;
margin-bottom:10px;
}   
   
.touch_section{
 
 background-image: url("<%=request.getContextPath()%>/resources/images/memberupdate.jpg");
  background-size: cover;
  height: 300px;
  position: relative;
  padding: 350px;
 
}
.memberupdate{
display:flex;
align-items:center;
flex-direction: column;
}
.get_taital{
	text-align: center;
  position: absolute;
	color: #f7941d;
	font-size: 50pt;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
 }
 .form-group {
        margin-bottom: 1px;
   }
 .input{
  margin-left: 200px;
 }
button.main_bt:hover{
  background-color: #D2AD86; /* Green */
    color: white;
}
.erroeMasgs{
margin-left: 200px;
}
  
  
 </style>
</head>
<body >

   <!-- 以下 >>隱藏式菜單_內容 -->
<!--      <header> -->
<!--          <span class="toggle-button" style="margin-left:-5px;margin-top:-7px;"> -->
<!--              <div class="menu-bar menu-bar-top"></div> -->
<!--              <div class="menu-bar menu-bar-middle"></div> -->
<!--              <div class="menu-bar menu-bar-bottom"></div> -->
<!--          </span> -->
<!--          <div class="menu-wrap"> -->
<!--              <div class="menu-sidebar" style="margin-top:30px;"> -->
<!--                  <ul class="menu"> -->
<%--                     <li><a href="<%= request.getContextPath() %>/back-end/member/listAllMember.jsp">會員資料管理</a></li> --%>
<%-- 	                <li><a href="<%= request.getContextPath() %>/back-end/item/itemHomePage.jsp">商城管理</a></li> --%>
<%-- 	                <li><a href="<%= request.getContextPath() %>/back-end/message/message_home.jsp">商城客服管理</a></li> --%>
<%-- 	                <li><a href="<%= request.getContextPath() %>/back-end/adopt/adopt_home.jsp">浪浪找家管理</a></li> --%>
<%-- 	                <li><a href="<%= request.getContextPath() %>/back-end/article/select_page_art.jsp">知識站管理</a></li> --%>
<%-- 	                <li><a href="<%= request.getContextPath() %>/back-end/announcemet/select_page.jsp">公告管理</a></li> --%>
<%-- 	                <li><a href="<%= request.getContextPath() %>/back-end/groomer/groomerList.jsp">美容師管理</a></li> --%>
<%-- 	                <li><a href="<%= request.getContextPath() %>/back-end/groomer/grooming_report.jsp">美容預約檢舉管理</a></li> --%>
<%-- 	                <li><a href="<%= request.getContextPath() %>/back-end/staff/allStaff.jsp">後台管理</a></li> --%>
<!--                  </ul> -->
<!--              </div> -->
<!--          </div> -->
<!--      </header> -->
 <!-- 以上 >>隱藏式菜單_內容 --> 
 
 
   <div class="touch_section">
        <h1 class="get_taital"><strong>
             <span style="color: #ffffff;">會員更新</span> Update Member</strong></h1>
    </div>

<FORM class="memberupdate" METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" name="update">
<table class="update">
	
	
	
     <h3>會員編號：${memberVO.memId}</h3>

     <h3>姓名：${memberVO.memName}</h3>
    
	<h5>帳號：${memberVO.memEmail}</h5>

	<div class="form-group">
		<h5>身分證:
		<input type="TEXT" name="memIdenity" size="10"	value="${memberVO.memIdenity}" required/>
		</h5></div>

<div class="form-group">
		<h5>性別:
		<select size="1" name="memGender" required>
		<option value="女">女</option>
		<option value="男">男</option>
		</select></h5>
</div>

	<div class="form-group">
		<h5>電話
		<input type="TEXT" name="memPh" size="10" value="${memberVO.memPh}" required/>
</h5>
</div>

	<div class="form-group">
		<h5>地址
		<input type="TEXT" name="memAddres" size="" value="${memberVO.memAddres}" required/>
</h5>
</div>
	
<div class="form-group">
		<h5>生日
		<input type="date" name="memBirthday" size="" value="${memberVO.memBirthday}" required/>
</h5></div>	
	
<!--     <div class="form-group">	 -->
<!-- 		<h5>身分:</h5> -->
<!-- 		<select size="1" name="memPosition"> -->
<!-- 		<option value="0">會員</option> -->
<!-- 		<option value="1">美容師</option> -->
<!-- 		</select> -->
<!-- 	 </div> -->
	 
<!--     <div class="form-group"> -->
<!-- 		<tr> -->
<!-- 		<td>會員狀態:</td> -->
<!-- 		<select size="1" name="memSurvive"> -->
<!-- 		<option value="0">審核中</option> -->
<!-- 		<option value="1">一般</option> -->
<!-- 		<option value="2">停權</option> -->
<!-- 		</select> -->
<!-- 	</tr> -->
<!--     </div>		 -->

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memId" value="${memberVO.memId}"/>
<input type="hidden" name="memName" value="${memberVO.memName}"/>
<input class="memstat" type="submit" value="送出修改">

</FORM>

   <script src="<%=request.getContextPath()%>/resources/bootstrap/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
    
	<script src="<%= request.getContextPath() %>/resources/js/jquery_1.12.4.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>

    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>

</body>

</html>