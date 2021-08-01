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
    .touch_section{
 
 background-image: url("<%=request.getContextPath()%>/resources/images/memberupdate.jpg");
  background-size: cover;
  height: 300px;
  position: relative;
  padding: 350px;
 
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
   .email_box{
    margin-top: 150px;
    max-width:900px;
	    width: 50%;
	    float: left;
	    background-color: #ffffff;
	     border-radius: 20px;
	    height: auto;
      padding: 50px 20px;
      opacity: 0.80;
      text-align:center;
  }
   .form-group {
        margin-bottom: 2rem;
   }
   h4{
    margin-left: 200px;
    font-size: 22px;
   }
   .email-bt {
    max-width:900px;
     margin-left: 200px;
    border: 1px solid #000;
    color: #000000;
    width: 100%;
    height: 55px;
    font-size: 22px;  
    padding: 20px;
    margin-top: 20px;
   }
   .massage-bt {
    max-width:900px;
     margin-left: 200px;
    border: 1px solid #000;
    color: #000000;
    width: 100%;
    height: 200px;
    font-size: 22px;
    padding: 70px 20px 10px 20px;
  }
 .input{
  margin-left: 200px;
 }
button.main_bt {
  background-color: white; 
    color: black; 
    border: 2px solid #D2AD86;
   border-radius: 12px;
    width: 80px;
    height: 40px;
    font-size:15px;
   margin-left: 200px;
   border-radius: 25px;
    
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
     <header>
         <span class="toggle-button" style="margin-left:-5px;margin-top:-7px;">
             <div class="menu-bar menu-bar-top"></div>
             <div class="menu-bar menu-bar-middle"></div>
             <div class="menu-bar menu-bar-bottom"></div>
         </span>
         <div class="menu-wrap">
             <div class="menu-sidebar" style="margin-top:30px;">
                 <ul class="menu">
                     <li><a href="<%=request.getContextPath()%>/back-end/member/listAllMember.jsp">會員資料管理</a></li>
                     <li><a href="#">商城管理</a></li>
                     <li><a href="#">商城客服管理</a></li>
                     <li><a href="#">討論區管理</a></li>
                     <li><a href="#">浪浪找家管理</a></li>
                     <li><a href="#">知識站管理</a></li>
                     <li><a href="#">公告管理</a></li>
                     <li><a href="#">美容師管理</a></li>
                     <li><a href="#">美容預約檢舉管理</a></li>
                 </ul>
             </div>
         </div>
     </header>
 <!-- 以上 >>隱藏式菜單_內容 --> 
 
 
   <div class="touch_section">
        <h1 class="get_taital"><strong>
             <span style="color: #ffffff;">會員更新</span> Update Member</strong></h1>
    </div>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" name="update">
<table class="update">
	

            <h3>會員編號:<%=memberVO.getMemId()%></h3>

   

            <h3>會員姓名:<%=memberVO.getMemName()%></h3>
            
	<tr>
		<td>信箱:</td>
		<td><input type="TEXT" name="memEmail" size="45" value="<%=memberVO.getMemEmail()%>"/></td>
	</tr>

	<tr>
		<td>密碼:</td>
		<td><input type="TEXT" name="memPassword" size="45"	value="<%=memberVO.getMemPassword()%>"/></td>
	</tr>
	<tr>
	<tr>
		<td>身分證:</td>
		<td><input type="TEXT" name="memIdenity" size="10"	value="<%=memberVO.getMemIdenity()%>"/></td>
	</tr>
	<tr>
		<td>性別:</td>
		<select size="1" name="memGender">
		<option value="女">女</option>
		<option value="男">男</option>
		</select>
	</tr>

	<tr>
		<td>電話</td>
		<td><input type="TEXT" name="memPh" size="10" value="<%=memberVO.getMemPh()%>"/></td>
	</tr>
	
		<tr>
		<td>地址</td>
		<td><input type="TEXT" name="memAddres" size="" value="<%=memberVO.getMemAddres()%>"/></td>
	</tr>
	
		<tr>
		<td>生日</td>
		<td><input type="TEXT" name="memBirthday" size="" value="<%=memberVO.getMemBirthday()%>"/></td>
	</tr>
	
		<tr>
		<td>身分:</td>
		<select size="1" name="memPosition">
		<option value="0">會員</option>
		<option value="1">美容師</option>
		</select>
	</tr>
	
		<tr>
		<td>會員狀態:</td>
		<select size="1" name="memSurvive">
		<option value="0">審核中</option>
		<option value="1">一般</option>
		<option value="2">停權</option>
		</select>
	</tr>
		

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memId" value="${param.memId}">
<input type="submit" value="送出修改"></FORM>

   <script src="<%=request.getContextPath()%>/resources/bootstrap/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
    
	<script src="<%= request.getContextPath() %>/resources/js/jquery_1.12.4.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>

    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>

</body>

</html>