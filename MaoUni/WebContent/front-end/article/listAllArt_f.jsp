<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.article.model.*"%>

<%
     ArtService artSvc = new ArtService();
    List<ArtVO> list = artSvc.getAll();
    pageContext.setAttribute("list",list);
%> 

<jsp:useBean id="arttSvc" scope="page" class="com.article_type.model.ArttService" />   

<!DOCTYPE html>
<!--  知識站_前台_查詢全部  -->
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>知識站文章all - listAllArtf.jsp</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"> <!-- 左邊這個是右上角購物車下拉式選單使用的BootStrap CSS -->  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styleD.css"> <!-- 左邊這個是右上角購物車下拉式選單使用的CSS,有再調過細部效果 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/fontawesome-all.min.css"> <!-- 左邊這個是右上角聊天室ICON的引入 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">  <!-- 左邊這個是右上角會員/信箱/購物車/搜尋ICON使用的fontawesomeCDN,使用靜態檔會跑掉 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sweetalert2.css">  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/newheader.css" type="text/css"/>
    
    <script src="<%= request.getContextPath() %>/resources/js/jquery_1.12.4.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/sweetalert2.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/popper.min.js"></script>

<style>
 body 
 { 
  background-color:#eee 
 } 
/* .wrap */
/* { */
/*   margin:50px auto 0 auto; */
/*   width:100%; */
/*   display:flex; */
/*   align-items:space-around; */
/*   max-width:800px; */
/*   margin-top: 180px; */
/* } */
.tile
{
  width:380px;
  height:380px;
  margin:10px;
  background-color:#99aeff;
  display:inline-block;
  background-size:cover;
  position:relative;
  cursor:pointer;
  transition: all 0.4s ease-out;
  box-shadow: 0px 35px 77px -17px rgba(0,0,0,0.44);
  overflow:hidden;
  color:white;
  font-family:'Roboto';
  margin-top: 20px;
  margin-left:18px;
  
}
.tile img
{
  height:100%;
  width:100%;
  position:absolute;
  top:0;
  left:0;
  z-index:0;
  transition: all 0.4s ease-out;
}
.tile .text
{
/*   z-index:99; */
  position:absolute;
  padding:30px;
  height:calc(100% - 60px);
}
.tile h1
{
 
  font-weight:300;
  margin:0;
  text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
}
.tile h2
{
  font-weight:100;
  margin:20px 0 0 0;
  font-style:italic;
   transform: translateX(200px);
}
.tile p
{
  font-weight:300;
  margin:20px 0 0 0;
  line-height: 25px;
/*   opacity:0; */
  transform: translateX(-200px);
  transition-delay: 0.2s;
}
.animate-text
{
  opacity:0;
  transition: all 0.6s ease-in-out;
}
.tile:hover
{
/*   background-color:#99aeff; */
box-shadow: 0px 35px 77px -17px rgba(0,0,0,0.64);
  transform:scale(1.05);
}
.tile:hover img
{
  opacity: 0.2;
}
.tile:hover .animate-text
{
  transform:translateX(0);
  opacity:1;
}
.dots
{
  position:absolute;
  bottom:20px;
  right:30px;
  margin: 0 auto;
  width:30px;
  height:30px;
  color:currentColor;
  display:flex;
  flex-direction:column;
  align-items:center;
  justify-content:space-around;
  
}
.dots span
{
    width: 5px;
    height:5px;
    background-color: currentColor;
    border-radius: 50%;
    display:block;
  opacity:0;
  transition: transform 0.4s ease-out, opacity 0.5s ease;
  transform: translateY(30px);
 
}
.tile:hover span
{
  opacity:1;
  transform:translateY(0px);
}
.dots span:nth-child(1)
{
   transition-delay: 0.05s;
}
.dots span:nth-child(2)
{
   transition-delay: 0.1s;
}
.dots span:nth-child(3)
{
   transition-delay: 0.15s;
}
@media (max-width: 1200px) {
  .wrap {
   flex-direction: column;
    width:100px;
  }
}
.button{
    background-color: white; 
    color: black; 
    border: 2px solid #D2AD86;
    border-radius: 12px;
    width: 50px;
    transform: translateX(-5px);
}
.button:hover {
    background-color: #D2AD86;
    color: white;
} 
.page{
 margin-top: 180px;
 background-color: #D2AD86;
}
 #pages {
  padding-top: 20px;
  margin: 0 auto;
  /* 置中 */
  text-align: center;
}  
   
</style>

</head>
<body>

<!-- 以下為header ******************************************************************************************* -->

<header>
	
	    <div class="icontrue" style="margin: 10px 10px 0px 0px;">
		
		  <a href="<%=request.getContextPath()%>/front-end/member/memberpage.jsp" class="iconbth"><i class="fas fa-user fa-1x" style="color:white;font-size:25px;"></i></a>
		  <a href="<%=request.getContextPath()%>/front-end/chatbox/chatbox.jsp" class="iconbth"><i class="fa fa-comments fa-1x" style="color:white;font-size:30px;margin-top:-4px;"></i></a>
		  <a href="#" class="iconbth"><i class="fas fa-envelope fa-1x" style="color:white;font-size:25px;"></i></a>
<!-------------------------------------------- shopping cart ------------------------------------------------>
	      <div class="dropdown ml-auto">
           
            <button class="btn btn-cart btn-sm" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false" >
                <i class="fas fa-shopping-cart fa-2x shoppingCart" style="color:#fff;"></i>
                <span class="badge badge-pill badge-danger totalItems">0</span>
            </button>
           
            <div class="dropdown-menu dropdown-menu-right" style="min-width: 300px" aria-labelledby="dropdownMenuButton">
                <div class="p-3">
                    <table class="table table-sm">
                        <h6>已選擇商品</h6>
                        <tbody class="cartbody" style="color:black;">
                        </tbody>
                    </table>
                    <a href="<%=request.getContextPath()%>/front-end/shop/order_confirm.jsp" class="btn btn-block btn-primary btn-sm text-white">確認結帳</a>
                </div>
            </div>
        </div>
	   
	        <a href="#" class="iconbth"><i class="fas fa-search fa-1x" style="color:white;font-size:25px;"></i></a>	        	        	
	   
	    </div>
<!---------------------------------------------------------------------------------------------------------------------->	    
		<!--icon一定要在top-flex之上，不然會被移動條給蓋爆777777-->
	
		<div class="Top-Flex">
			<div class="LOOP">
			    	<a class="two" href="<%=request.getContextPath()%>/back-end/listAllItem">
			    	<img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/Logo/MaoUni2.png" width="" alt="">
			    	</a>
			</div>
		</div>
		
			<div class="shopbody">
				<nav style="margin-left:15px;">
			       <p class="hover-underline-animation pb-0"><a href="<%= request.getContextPath() %>/front-end/home/HomePage.jsp" style="font-size:15px;">首　頁</a></p>
			       <p class="hover-underline-animation pb-0"><a href="<%= request.getContextPath() %>/front-end/shop/shopping_home.jsp" style="font-size:15px;">有你來買</a></p>
			       <p class="hover-underline-animation pb-0"><a href="<%= request.getContextPath() %>/front-end/member/grooming_home.jsp" style="font-size:15px;">到府美容</a></p>
			       <p class="hover-underline-animation pb-0"><a href="<%= request.getContextPath() %>/front-end/adopt/adopt_home.jsp" style="font-size:15px;">浪浪找家</a></p>
			       <p class="hover-underline-animation pb-0"><a href="<%= request.getContextPath() %>/front-end/article/listAllArt_f.jsp" style="font-size:15px;">知識站</a></p>
			       <p class="hover-underline-animation pb-0"><a href="<%= request.getContextPath() %>/front-end/announcemet/listAllAnnf.jsp" style="font-size:15px;">公告</a></p>
			 	</nav>
		</div>
		<div class="Shopping-ul"></div>
	    
	</header>

<!--以上為header ***********************************************************************-->

<!-- 以下這個範圍只是為了拉長版面顯示可實作的範圍,可直接在這邊開始做你的版面摟! -->
		
  <div class="textttt" style=" width: 100%;height: 850px;">


<div class="page">
   <%@ include file="page1.file" %> 
    </div>
   <c:forEach var="artVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
 
 
<!--    <div class="wrap"> -->
      <div class="tile"> 
          <img src="<%=request.getContextPath()%>/ArtImgServlet?id=${artVO.id}" />
            <div class="text">
       <!-- 文章名稱 -->
              <h1>${artVO.name}</h1>
              <!-- 文章分類 -->
                  <h2 class="animate-text"> ${arttSvc.getOneByID(artVO.artt_id).id} - ${arttSvc.getOneByID(artVO.artt_id).name}</h2>
                 <!-- 文章內容 -->       
                        <p class="animate-text">${artVO.contnt} </p>
        <div class="dots">
          <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/article/art.do" 
                  style="margin-bottom: 0px;">
            <input type="submit" value="Check" class="button">
            <input type="hidden" name="id"  value="${artVO.id}">
            <input type="hidden" name="action"	value="getOne_For_Check"></FORM>
        
           </div>
           </div>
         </div>
<!--     </div> -->

 </c:forEach>
   
   <br>
   <br>
   <br>
   
   <hr>
   
    <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
   <div  id="pages">
   <%@ include file="page2.file" %>
   </div>
  </div> 
  
  
  <!-- 以下為底部FOOTER -->
	<footer class="footer">
        <ul class="r-footer">
	        <li>
	            <h2>About</h2>
		        <ul class="box">
			        <li><a class="ff1" href="#">品牌故事</a></li>
			        <li><a class="ff2" href="#">最新文章</a></li>
			        <li><a class="ff3" href="#">公告</a></li>
			        <li><a class="ff4" href="#">FAQ</a></li>
		        </ul>
	        </li>
	
	        <li>
	            <h2>Service</h2>
	            <ul class="box">
		            <li><a class="ff5" href="#">隱私權政策</a></li>
		            <li><a class="ff6" href="#">退換貨政策</a></li>
		            <li><a class="ff7" href="#">付款相關問題</a></li>
		            <li><a class="ff8" href="#">運算相關問題</a></li>
	            </ul>
	        </li>
	
	        <li>
		        <h2>Contact</h2>
		        <ul class="box">
			        <li><a class="ff9" href="#">客服信箱</a></li>
			        <li><a class="ff10" href="#">LINE客服</a></li>
			        <li><a class="ff11" href="#">聯絡電話</a></li>
		        </ul>
	        </li>

	        <li>
	            <h2>Follow</h2>
		        <ul class="box">	        	
		        	<li class="ig"><a class="btn btn-primary" style="color:white;font-size:14px;cursor: pointer;background:none;border:none;">
		        	                    <span class="fab fa-instagram"></span>&nbsp;毛孩有你</a></li>
		        	<li class="fb"><a class="btn btn-primary" style="color:white;font-size:16px;margin-top:-2px;cursor: pointer;background:none;border:none;">
		        	                   <span class="fab fa-facebook-square"></span>&nbsp;MaoUni</a></li>
		        </ul>
	        </li>        
        </ul>
	</footer>
	
    <div class="b-footer">
    <p style="margin-bottom: 10px;">All rights reserved by ©MaoUni 2021 </p>
    </div>	
	<!-- 以上為底部FOOTER -->
	
	<script>
    // 此處是縮放導覽列的動態效果，這段請一定要抓到，不然它不會動
    //滑鼠滾動(scroll)就開始觸發
    window.addEventListener("scroll",function(){
    const header = document.querySelector('header');
    header.classList.toggle('sticky',window.scrollY > 0);
    });
    
	</script>
	
    <script>
        const sessionId = "${sessionId}";
    </script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/shopping_cart.js"></script>
</body>
</html>