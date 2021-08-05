<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.item.model.*"%>
<%@ page import="com.itemphotos.model.*"%>


<%
    ItemService itemSvc = new ItemService();
    List<ItemVO> list = itemSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<%
  ItemVO itemVO = (ItemVO) request.getAttribute("itemVO");
%>

<%
  ItemPhotosVO itemphotosVO = (ItemPhotosVO) request.getAttribute("itemphotosVO");
%>

<html style="height: auto;">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>商品詳細資料</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu.css"> 
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css"> 



<style>
 .btn{
  background: #e8c497;
       color: #fff;
 }
 .btn:hover {
       background: #ffe6c7;
       color: #fff;
   }
 .pagination>li.active>a {
    background: #d6b286;
     color: #fff;
 }
 .pagination>li>a {
     color: #d6b286;
 }
 .pagination>li>a:hover {
    background: #fff;
     color: #5c3316;
 }
 .col-md-6 .pagination>li>a,
 .col-md-6 .pagination>li>span {
      border: 1px solid #d6b286;
 }
 .pagination>.active>a:hover{
     background-color: #e6c195;
     border: solid 1px #e6c195;
 }
 a.btsp{
  font-size: 35px;
  color: #e8c497;
  font-weight: bold;
  margin-left: -5px;
 }
 a.btsp:hover, a.btsp:active{
  color: #ffe6c7;
  text-decoration: none;
 }
 p.allitemtitle{
  color:#fff;
  font-weight: bold;
 }
 input.details{
  background-color: #bfbfbf;
  color: #fff;
 }
 input.details:hover{
  background-color: #e8c497;
 }
 input.update{
  background-color: #bfbfbf;
  color: #fff;
  border:5px;
  border-radius:5px;
  margin-left: 213px;
 } 
 input.update:hover{
  background-color: #e8c497;
 }
 
 body{
  overflow-x:hidden;
 }
</style>
</head>


<body style="height: auto;"><!-- 步驟二 -->
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
                     <li><a href="<%= request.getContextPath() %>/front-end/message/addMessage.jsp">商城客服管理</a></li>
                     <li><a href="<%= request.getContextPath() %>/front-end/adopt/adopt_home.jsp">浪浪找家管理</a></li>
                     <li><a href="<%= request.getContextPath() %>/back-end/article/select_page_art.jsp">知識站管理</a></li>
                     <li><a href="<%= request.getContextPath() %>/back-end/announcemet/select_page.jsp">公告管理</a></li>
                     <li><a href="<%= request.getContextPath() %>/back-end/groomer/groomerList.jsp">美容師管理</a></li>
                     <li><a href="<%= request.getContextPath() %>/back-end/groomer/grooming_report.jsp">美容預約檢舉管理</a></li>
                 </ul>
             </div>
         </div>
     </header> 
 <!-- 以上 >>隱藏式菜單_內容 --> 
 
 
 
  <!-- id="wrapper"這段是包住整個頁面的大外框，因為有用margin-left，所以目前位置剛好卡在漢堡(隱藏式菜單)的右邊，此行刪掉會跑版 --> 
    <div id="wrapper" style="margin-left: 120px;height: auto;">
        <div class="d-flex flex-column" id="content-wrapper" style="margin-right:5px;">
            
              <!-- 以下範圍為最上方包著商城管理以及右方後台人員的區塊, -->
                <nav class="navbar navbar-light navbar-expand bg-white mb-4 topbar static-top">
                    <div class="container-fluid" style="margin-top:23px;margin-left:-6px;">
<!--請看這行最右邊-->  <a class="btsp" href="<%= request.getContextPath() %>/back-end/item/listAllItem.jsp">商城管理</a>  <!-- 這行是商城管理的標題，可以自行設定，還有href可以自行設定跳轉的頁面 -->
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

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
 <font style="color:red;margin-top:50px;">請修正以下錯誤:</font>
 <ul>
  <c:forEach var="message" items="${errorMsgs}">
   <li style="color:red">${message}</li>
  </c:forEach>
 </ul>
</c:if>

  <div class="card" style="margin-left:-8px; margin-right: 25px;">
 
      <div class="card-header py-3" style="background-color:#e8c497;margin-top:-20px">
          <p class="allitemtitle" style="margin: 1px;font-size: 20px;">商品詳細資料</p>
      </div>
      
        <div class="card-body" style="height: auto;display:flex;">
            <div class="row">

            </div>
            <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info" style="width:600px;">
      <div class="lefttcardbody" style="width:500px;margin-left:30px;">
      
      <table>
	       <tr>
		        <td style="width:120px;">商品編號：</td>
		        <td name="itemId" style="width:290px;"><%= (itemVO==null)? "" : itemVO.getItemId()%></td>
	       </tr>
	       <tr>
		        <td style="width:120px;">商品名稱：</td>
		        <td name="itemName" style="width:290px;"><%= (itemVO==null)? "" : itemVO.getItemName()%></td>
	       </tr>
	       <tr>
		        <td style="width:120px;">商品價格：</td>
		        <td name="itemPrice" style="width:290px;"><%= (itemVO==null)? "" : itemVO.getItemPrice()%></td>
	       </tr>
	       <tr>
		        <td style="width:120px;">商品數量：</td> 
		        <td name="itemAmount" style="width:290px;"><%= (itemVO==null)? "" : itemVO.getItemAmount()%></td>
	       </tr>
	        <tr>
		        <td style="width:120px;">商品狀態：</td>
		        <c:if test="${itemVO.itemStatus == '0'}"><td scope="col" class="itemStatus" style="width: 75px;">待上架</td></c:if>
		        <c:if test="${itemVO.itemStatus == '1'}"><td scope="col" class="itemStatus" style="width: 75px;">上架中</td></c:if>
		        <c:if test="${itemVO.itemStatus == '2'}"><td scope="col" class="itemStatus" style="width: 75px;">已下架</td></c:if>         
	       </tr>
	       <tr>
		        <td style="width:120px;">商品內容：</td>
		        <td><p name="itemContent" style="width:290px;"><%= (itemVO==null)? "" : itemVO.getItemContent()%></p></td>
	       </tr>
	       <tr>
		        <td style="width:120px;">寵物類別：</td>
		        <td name="itemPetType" style="width:290px;"><%= (itemVO==null)? "" : itemVO.getItemPetType()%></td>
	       </tr>

	       <jsp:useBean id="itemTypeSvc" scope="page" class="com.itemtype.model.ItemTypeService" />
	       <tr>
		        <td style="width:120px;">商品類別：</td>
		        <td>${itemVO.itemTypeName}</td>
	       </tr>
	       <tr>
		        <td>新增圖片：</td>
		        <td>
			         <FORM method="post" ACTION="<%=request.getContextPath()%>/ItemPhotosServlet" enctype="multipart/form-data">
			          <input type="file" style="width:230px;" name="ipItem" multiple required/>
			          <input type="hidden" name="itemId" value="${itemVO.itemId}" />
			          <input type="hidden" name="action" value="uploadItems">
			          <button type="submit" style="">送出</button>
			         </FORM>
	            </td>
       	  </tr>
      </table>

      </div>

     </div> <!-- class="table-responsive" 結尾標籤 -->
<!--      <div style="width:550px;border: 1px solid red;"> -->
<%--        <c:forEach var="itemVO" items="${list}"> --%>
<!--        <div class="ItemPhotos"> -->
<%--               <img src="data:image/jpeg; base64, ${itemVO.itemPhotoFirst}"/> --%>
<!--           </div> -->
<%--        </c:forEach> --%>
<!--      </div> -->
    </div> <!-- class="card-body" 結尾標籤 -->   
   </div> <!-- class="card" 結尾標籤 --> 
  </div> <!-- class="d-flex" 結尾標籤 -->
     </div> <!-- Class="Wrapper"的結尾標籤 -->



    <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<!-- 步驟三 -->  
<!-- 隱藏式菜單_連結--> 
<!--底下是jsp 裡面所連結打法可以參考一下-->
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>

</body>
</html>