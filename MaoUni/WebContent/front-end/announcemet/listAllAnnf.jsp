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
<title>前台_公告查詢所有資料</title>

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
 span{
    font-family:monospace;
  }
  h3 {
    text-align:center;
    
   }
.table1 {
  margin-top: 180px;
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
#pages1{
  /*往右邊移動 */
margin-left: 60px; 
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
    
<!-- 提示錯誤訊息  -->
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
 
 <!-- 以下這個範圍只是為了拉長版面顯示可實作的範圍,可直接在這邊開始做你的版面摟! -->
		
  <div class="textttt" style=" width: 100%;height: 1000px;">
 
<!--內容表格  -->
 <table  class="table1">
    <tr>
        <th>照片</th>
		<th>公告編號</th>
		<th>公告內容</th>
		<th>上次修改日期</th>
		<th></th>
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
			     <input type="submit" class="button" value="查看">
			     <input type="hidden" name="id"  value="${annVO.id}">
			     <input type="hidden" name="action"	value="getOne_For_front"></FORM>
			</td>
		</tr>
	</c:forEach>
  </table>   
   <div  id="pages">
        <%@ include file="page2.file" %> 
    </div>          
   </span> 

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
	
	
    <!--以上為頭部的html設定位子-->

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