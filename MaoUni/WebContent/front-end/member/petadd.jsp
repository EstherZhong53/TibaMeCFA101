<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pet.model.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>增加毛孩</title>
<!-- 隱藏式菜單_連結 -->
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css">

   <style>
.touch_section{
 
background-image: url("<%=request.getContextPath()%>/resources/images/petupdate.jpg");
  background-size: cover;
  height: 300px;
  position: relative;
  padding: 350px;
 
}
.memberupdate{
display:block;
align-items: center;
margin-top:20px;
}
.petcen{
display:flex;
justify-content:center;
margin:10px;
line-height:40px;
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
 
.input{
  margin-left: 200px;
  border-radius: 5px;
 }
.erroeMasgs{
margin-left: 200px;
}
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
  
  
 </style>
</head>
<body >


 
   <div class="touch_section">
        <h1 class="get_taital"><strong>
             <span style="color: #ffffff;">增加毛孩</span> Add Pet</strong></h1>
    </div>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="petcen">
<FORM class="memberupdate" METHOD="post" ACTION="<%=request.getContextPath()%>/pet/pet.do">
<table class="pettable">


	<tr>
		<td>毛孩名字:<input type="text" name="petName" size="" value="" required/></td>
	</tr>
	<tr>
		<td>毛孩類別:
		<select size="" name="petSort" required>
		<option value="狗">狗</option>
		<option value="貓">貓</option>
		</select>
	</td>
	</tr>
	<tr>
		<td>毛孩品種:
		<select size="" name="petVarId" required>
		<option value="1">馬爾濟斯</option>
		<option value="2">哈士奇</option>
		<option value="3">黃金獵犬</option>
		<option value="4">拉布拉多</option>
		<option value="5">吉娃娃</option>
		<option value="6">米克斯</option>
		<option value="7">博美</option>
		<option value="8">約克夏</option>
		<option value="9">臘腸</option>
		<option value="10">柴犬</option>
		<option value="11">豹貓</option>
		<option value="12">英國短毛貓</option>
		<option value="13">熱帶草原貓</option>
		<option value="14">蘇格蘭折耳貓</option>
		<option value="15">緬因貓</option>
		<option value="16">挪威森林貓</option>
		<option value="17">波斯貓 </option>
		<option value="18">塞爾凱克捲毛貓</option>
		<option value="19">加拿大無毛貓</option>
		</select></td>
	</tr>
<tr>
		<td>性別:
		<select size="1" name="petGender" required>
		<option value="公">公</option>
		<option value="母">母</option>
		</select></td>
	</tr>
	<tr>
		<td>年齡:
		<input type="number" min="1" name="petAge" size="" value="" required/>
		</td>
	</tr>
	<tr>
		<td>狀態:
		<select size="" name="petSurvive" required>
		<option value="0">健康</option>
		<option value="1">懷念</option>
		</select></td>
	</tr>

		
	


</table>
<br>
<input type="hidden" name="action" value="insert">
<input class="memstat" type="submit" value="增加毛孩">
</FORM>
</div>
</body>