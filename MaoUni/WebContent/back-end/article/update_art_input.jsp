<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.article.model.*"%>


<%
  ArtVO artVO = (ArtVO) request.getAttribute("artVO"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>後台_文章資料修改</title>

<!-- 隱藏式菜單_連結 -->
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css">

   <style>
.touch_section{
 
 background-image: url("<%=request.getContextPath()%>/resources/images/dog1.jpg");
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

   <div class="touch_section">
        <h1 class="get_taital"><strong>
             <span style="color: #ffffff;">編輯文章</span> Update Article</strong></h1>
    </div>
   
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/article/art.do" enctype='multipart/form-data' 
        name="form1">
   
    <div class="form-group">
            <h4>文章編號: <%=artVO.getId()%></h4>
   </div>
   
    <div class="form-group">
         <h4>文章名稱:</h4>
            <input type="text" class="email-bt" placeholder="文章名稱"  
                   name="name"value="<%=artVO.getName()%>"/>
   </div> 
   
   <div class="form-group">
         <h4>發布時間:</h4>
           <input name="update" id="f_date1" type="text" class="email-bt"
                    placeholder="輸入日期EX:2021-01-01">
   </div> 
   
   <jsp:useBean id="arttSvc" scope="page" class="com.article_type.model.ArttService" /> 
   
      <div class="form-group">
          <h4>分類id:</h4>
         <select size="1" name="artt_id" class="email-bt" style="height:70px;">
			<c:forEach var="arttVO" items="${arttSvc.all}">
				<option value="${arttVO.id}" ${(artVO.artt_id==arttVO.id)? 'selected':'' } >${arttVO.name}
			</c:forEach>
	    </select>
     </div>
     
      <div class="form-group">
            <h4>文章內容:</h4>
            <textarea class="massage-bt" placeholder=" 文章內容 Massage" 
                type="TEXT" name="contnt" value="<%=artVO.getContnt()%>"></textarea>
      </div>
         
      <div class="input"> 
          <p> 請上傳圖片<font color=red><b>*</b></font>
                <input type="file" id="pic" name="pic" ></p>
      </div>
      
         <input type="hidden" name="action" value="update">
         <input type="hidden" name="id" value="<%=artVO.getId()%>">
         <button type="submit" class="main_bt">送出修改</button>
         
      <hr>
      
      <!--     錯誤訊息  -->
      <div class="erroeMasgs">
    <c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
    </c:if>
    </div>
   
   </FORM>
   
<!-- 隱藏式菜單_連結 -->
<script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script> 
</body>

<!--     datetimepicker 之相關設定   -->

<% 
  java.sql.Date update= null;
  try {
	   update = artVO.getUpdate();
   } catch (Exception e) {
	   update = new java.sql.Date(System.currentTimeMillis());
   }
%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.datetimepicker.css" /> 
 <script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script> 
 <script src="<%=request.getContextPath()%>/resources/js/jquery.datetimepicker.full.js"></script>

  <script>
          $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=update%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
   </script>
   
<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
  
 </style>
 
</html>