<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adopt_imf.model.*"%>
<%@ page import="com.adopt_mechanism.model.*"%>

<%@ page import="com.variety.model.*"%>
<%@ page import="com.variety.model.VarietyVO"%>



	<% 
	ImfService ImfSvc = new ImfService();
     List<ImfVO> list = ImfSvc.getAll();
     pageContext.setAttribute("list",list);   
     VarietyService varSvc=new VarietyService();
     List<VarietyVO> varlist = varSvc.getAll();
     pageContext.setAttribute("varlist",varlist);
     %>
     


<head>
<style>
table{
	border:2px;
	width:100px;
   	height:100%;
    margin-left:auto; 
    margin-right:auto;
    max-width: 100%;
    display: table;
    background-color: #bbb;
    font-size: 20px;
    font-family: DFKai-sb;
    margin-top: 150px;
}
table{
	border:2px;
	width:100px;
   	height:100%;
    margin-left:auto; 
    margin-right:auto;
    max-width: 100%;
    display: table;
    background-color: #bbb;
    font-size: 20px;
    font-family: DFKai-sb;
    margin-top: 150px;
}


img{
	height:280px;
	width:280px;
	}	

List-style-type ：none/* http://meyerweb.com/eric/tools/css/reset/
v2.0 | 20110126
License: none (public domain)

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
    display: block;
}
body {
    line-height: 1;
    min-height: 1000px;
    font-size: 18px;
    color: rgb(255, 255, 255);
    font-family: "Microsoft JhengHei";
}
ol, ul {
    list-style: none;
}
blockquote, q {
    quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
    content: '';
    content: none;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}

*{

box-sizing: border-box;
margin: 0px;
padding: 0px;
}


.Top-Flex{ /*這就是上面那條跑來跑去的最開始的底*/

position: fixed;
background-color:#c19e74;
font-weight: bold;
padding: 0 50px;
height:170px;
width:100%;
display: flex;
align-items: top;
border-radius: 0px 0px 30px 30px;;
z-index:2;

}
header{

    position: fixed;
    top:0px;
    left:0px;
    width: 100%;
    height: 215px;
    display: flex;
    justify-content: flex-end;
    transition: 1s;
    z-index:1;
}

header.sticky .Top-Flex{ /* 這是下拉後的Top-Flex寬度跟顯示 */

    height: 100px;
    transition: 2.5s;
    }

.LOOP{

    display: flex;
    margin: auto;
    margin-top: 5px;
    margin-left: 450px; /*大loog因為看起來沒置中所以是用這個去調到置中的 */

}

header.sticky .two img{

    width: 120px;
    margin-left: 60%; /*小logo用這個移動*/


}

.two img{ /*縮小上頭logo時用*/

    width:300px;
    transition: 1s;
}

/* ------icon區的css------- */

.icontrue{

display: flex;
z-index:5;
margin-right:5px;

}

.iconbth{ /*給iocn間距*/

margin: 7px;
z-index:5;
}

.icontrue img{ /*icontrue下的img全縮小*/

    width: 20px;
    border-radius: 4px solid #fff;
    color:#c19e74;
    z-index:5; /*這個一定要加不然會把上下滑動蓋掉，且無法hover差點氣死*/
}

.iconbth:hover{ /*移到icon上時會有半透明的效果*/

    opacity: 0.5;
    z-index:5;
}

/* ------icon區的css結束------- */

.shopbody{ /*有你來玩那排的導覽列*/

    position: fixed;
    display: flex;
    font-weight:bold;
    font-size: 13px;
    width: 100%;
    justify-content: center; /*這整排置中*/
    align-items: center; /*讓字在中間的位子*/
    min-height: 50vh; /* 這一導覽列的高度 */
    z-index:2;
}

header.sticky .shopbody{

    min-height: 25vh; 
    transition: 2s;
}

nav{

    position: relative;
    display: flex;
}

nav a{

    margin: 0 20px; 
    /* 字跟字之間的寬度 */
    color:white ;
    text-decoration: none; /* 去掉超連結的底線 */
    height: 5px;
    width: 100px;
    /* padding-top: 0px; */ 
}
</style>

</head>

<body>

<header>

    <div class="icontrue">

        <a href="#" class="iconbth"><img src="../image/dodge.png" border="0"></a>
        <a href="#" class="iconbth"><img src="../image/user.png" border="0"></a>
        <a href="#" class="iconbth"><img src="../image/shopping_cart.png" border="0"></a>
        <a href="#" class="iconbth"><img src="../image/paper_plane.png" border="0"></a>
        <a href="#" class="iconbth"><img src="../image/public_access.png" border="0"></a>
     <!--iconu一定要在top-flex之上，不然會被移動條給蓋爆777777-->
    </div>


<div class="Top-Flex">

<ul class="LOOP">
    <li class="two"><img src="../image/MaoUni2.png" width="" alt=""></li>
</ul>



</div>

    <div class="shopbody">
        <nav>
            <a href="#">首　頁</a>
            <a href="#">有你來買</a>
            <a href="#">有你來講</a>
            <a href="#">有你來玩</a>
            <a href="#">到府美容</a>
            <a href="#">浪浪找家</a>
            <a href="#">友善店家</a>
            <a href="#">知識站</a>
        </div>
        <div class="Shopping-ul"></div>
    </nav>
    </header>
    </div>

    <!--以上為頭部的html設定位子-->

    <script>
        // 此處是縮放導覽列的動態效果，這段請一定要抓到，不然它不會動
        //滑鼠滾動(scroll)就開始觸發
        window.addEventListener("scroll",function(){

        const header = document.querySelector('header');
        header.classList.toggle('sticky',window.scrollY > 0);
        });
        
    </script>

</div>
</div></head>

<body>

<header>

    <div class="icontrue">

        <a href="#" class="iconbth"><img src="../image/dodge.png" border="0"></a>
        <a href="#" class="iconbth"><img src="../image/user.png" border="0"></a>
        <a href="#" class="iconbth"><img src="../image/shopping_cart.png" border="0"></a>
        <a href="#" class="iconbth"><img src="../image/paper_plane.png" border="0"></a>
        <a href="#" class="iconbth"><img src="../image/public_access.png" border="0"></a>
     <!--iconu一定要在top-flex之上，不然會被移動條給蓋爆777777-->
    </div>


<div class="Top-Flex">

<ul class="LOOP">
    <li class="two"><img src="../image/MaoUni2.png" width="" alt=""></li>
</ul>



</div>

    <div class="shopbody">
        <nav>
            <a href="#">首　頁</a>
            <a href="#">有你來買</a>
            <a href="#">有你來講</a>
            <a href="#">有你來玩</a>
            <a href="#">到府美容</a>
            <a href="#">浪浪找家</a>
            <a href="#">友善店家</a>
            <a href="#">知識站</a>
        </div>
        <div class="Shopping-ul"></div>
    </nav>
    </header>
    </div>

    <!--以上為頭部的html設定位子-->

    <script>
        // 此處是縮放導覽列的動態效果，這段請一定要抓到，不然它不會動
        //滑鼠滾動(scroll)就開始觸發
        window.addEventListener("scroll",function(){

        const header = document.querySelector('header');
        header.classList.toggle('sticky',window.scrollY > 0);
        });
        
    </script>

</div>
</div>
</body>
<div>>認養資訊</div>

 
 <table style="border:3px #2F0000 dashed;" cellpadding="10" border='1'>
 
 	<c:forEach var="ImfVO" items="${list}"> 	
		<tr>
			<td><img src="<%=request.getContextPath()%>/ImfPhotoServlet?AI_ID=${ImfVO.id}"></td>
		
		</c:forEach>
		
		<c:forEach var="ImfVO" items="${list}"> 
	
	</tr>
	<table style="border:3px #2F0000 dashed;" cellpadding="10" border='1'>		
			  
			  
			  
		</c:forEach>	  
			  
			  
			  
			  
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/TrackingController" style="margin-bottom: 0px;">
			     <input type="submit" value="認養">
			     <input type="hidden" name="id"  value="${TrackingVO.id}">
			     <input type="hidden" name="action"	value="insert"></FORM>
			</td> 
			
 		
 		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ImfServlet" style="margin-bottom: 0px;">
<!-- 			     <input type="submit" value="新增"> -->
<%-- 			     <input type="hidden" name="id"  value="${staffVO.id}"> --%>
<!-- 			     <input type="hidden" name="action"	value="insertStaff"></FORM> -->
<!-- 			</td>  -->
			
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/StaffServlet" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="查詢狀態"> -->
<%-- 			     <input type="hidden" name="id"  value="${staffVO.id}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOneStaff"></FORM> -->
<!-- 			</td>  -->
			
			
			
<!-- 			</tr>		 -->
			
	
			
			
  	
 



</div>




</container>
		
<!--  <div> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/StaffServlet" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="新增"> -->
<%-- 			     <input type="hidden" name="id"  value="${staffVO.id}"> --%>
<!-- 			     <input type="hidden" name="action"	value="insert"></FORM> -->
<!-- 			</div>  -->

