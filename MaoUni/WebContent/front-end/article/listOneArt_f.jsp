<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.article.model.*"%>
<%@ page import="com.article_type.model.*"%>

<%ArtVO artVO = (ArtVO) request.getAttribute("artVO");%>

<%
    ArttService arttSvc = new ArttService();
    ArttVO arttVO = arttSvc.getOneByID(artVO.getArtt_id());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>前台_知識站_單一查詢資料</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"> <!-- 左邊這個是右上角購物車下拉式選單使用的BootStrap CSS -->  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styleD.css"> <!-- 左邊這個是右上角購物車下拉式選單使用的CSS,有再調過細部效果 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/fontawesome-all.min.css"> <!-- 左邊這個是右上角聊天室ICON的引入 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">  <!-- 左邊這個是右上角會員/信箱/購物車/搜尋ICON使用的fontawesomeCDN,使用靜態檔會跑掉 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sweetalert2.css">  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/newheader.css" type="text/css"/>

	<script src="<%= request.getContextPath() %>/resources/js/jquery_1.12.4.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/popper.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/sweetalert2.js"></script>

<style>
  body {
	font-family: 'Roboto Slab', sans-serif;
}
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
    max-width:900px;
    margin-left: 90px;
    margin-right: 90px;
    
	margin-top: 210px;
}
.i5 .container-fluid {
	padding-left: 0px;
	padding-right: 0px;
}
.i5 h4 {
	margin: 30px 0px 20px 0px;
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
		
  <div class="textttt" style=" width: 100%;height: 1100px;">

   <section class="i5">
    <div class="container-fluid">
      <img src="<%=request.getContextPath()%>/ArtImgServlet?id=${artVO.getId()}"
             height="450"  alt="">
        <h4>文章名稱</h4>
            <p><%=artVO.getId()%> :<%=artVO.getName()%></p>
        <h4>文章分類</h4>
           <p><%=artVO.getArtt_id()%>【<%=arttVO.getName()%>】</p>
        <h4>文章內容</h4>
            <p><%=artVO.getContnt()%></p>
        <h4>發布時間</h4>   
          <p><%=artVO.getUpdate()%></p>
     </div>
  </section>
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
		        	<li class="ig"><a class="btn btn-primary" style="color:white;font-size:14px;cursor: pointer;background:none;border:none;"><span class="fab fa-instagram"></span>&nbsp;毛孩有你</a></li>
		        	<li class="fb"><a class="btn btn-primary" style="color:white;font-size:16px;margin-top:-2px;cursor: pointer;background:none;border:none;"><span class="fab fa-facebook-square"></span>&nbsp;MaoUni</a></li>
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