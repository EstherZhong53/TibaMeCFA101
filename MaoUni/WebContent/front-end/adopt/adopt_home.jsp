<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adopt_imf.model.*"%>
<%@ page import="com.tracking_adopt.model.*"%>
<%@ page import="com.adopt_mechanism.model.*"%>
<%@ page import="com.variety.model.*"%>
<%@ page import="com.variety.model.VarietyVO"%>
<%@ page import="com.member.model.MemberVO"%>
<%@ page import="com.tracking_adopt.model.TrackingVO"%>
<%@ page import="com.adopt_mechanism.model.*"%>
<%@ page import="com.member.model.*"%>



<%
	ImfService ImfSvc = new ImfService();
	List<ImfVO> list = ImfSvc.getAll();
	pageContext.setAttribute("list", list);
	
	VarietyService varSvc = new VarietyService();
	List<VarietyVO> varlist = varSvc.getAll();
	pageContext.setAttribute("varlist", varlist);
	
	
	MechanismService mechanismSvc=new MechanismService();
	List<MechanismVO> Mechlist = mechanismSvc.getAll();
// 	MechanismVO mechanismVO = new MechanismVO();
// 	String tel = mechanismVO.getTel();
	pageContext.setAttribute("Mechlist", Mechlist);
	
	

// 	MemberVO memberVO = new MemberVO();
// 	memberVO.setMemId(1);
// 	pageContext.setAttribute("memberVO", memberVO);
	
	Integer memId = ((MemberVO) session.getAttribute("memberVO")).getMemId();

// 		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
// 		Integer memId=memberVO.getMemId();
// 		pageContext.setAttribute("memberVO",memberVO);
	// 	TrackingService trackingSvc = new TrackingService();
	// 	List<TrackingVO> Trackinglist = trackingSvc.getMemberByid(memId);
	// 	pageContext.setAttribute("Trackinglist", Trackinglist);
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@900&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=0.5, user-scalable=no">
<!-- <script src="JavaScript ????????????.js"></script> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/newheader.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<!-- ?????????????????????????????????????????????????????????BootStrap CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styleD.css">
<!-- ?????????????????????????????????????????????????????????CSS,???????????????????????? -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/fontawesome-all.min.css">
<!-- ?????????????????????????????????ICON????????? -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<!-- ??????????????????????????????/??????/?????????/??????ICON?????????fontawesomeCDN,???????????????????????? -->
 <link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/sweetalert2.css"> 

<script src="<%=request.getContextPath()%>/resources/js/fontawesome.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/sweetalert2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery_1.12.4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
<title>MaoUni????????????</title>

<style>
.confirm {
	font-family: DFKai-sb;
	width: 80px;
	height: 80px;
	margin-left: 1060px;
	margin-top: 10px;
}

table {
	border: 2px;
	width: 1000px;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
	max-width: 100%;
	display: table;
	background-color: #bbb;
	font-size: 20px;
	font-family: DFKai-sb;
	margin-top: 300px;
}

.Photo {
	height: 280px;
	width: 280px;
}
</style>
</head>
<body>

	<!-- ?????????header ******************************************************************************************* -->

	<header>

		<div class="icontrue" style="margin: 10px 10px 0px 0px;">

			<a
				href="<%=request.getContextPath()%>/front-end/member/memberpage.jsp"
				class="iconbth"><i class="fas fa-user fa-1x"
				style="color: white; font-size: 25px;"></i></a> <a
				href="<%=request.getContextPath()%>/front-end/chatbox/chatbox.jsp"
				class="iconbth"><i class="fa fa-comments fa-1x"
				style="color: white; font-size: 30px; margin-top: -4px;"></i></a> <a
				href="#" class="iconbth"><i class="fas fa-envelope fa-1x"
				style="color: white; font-size: 25px;"></i></a>
			<!-------------------------------------------- shopping cart ------------------------------------------------>
			<div class="dropdown ml-auto">

				<button class="btn btn-cart btn-sm" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
					<i class="fas fa-shopping-cart fa-2x shoppingCart"
						style="color: #fff;"></i> <span
						class="badge badge-pill badge-danger totalItems">0</span>
				</button>

				<div class="dropdown-menu dropdown-menu-right"
					style="min-width: 300px" aria-labelledby="dropdownMenuButton">
					<div class="p-3">
						<table class="table table-sm">
							<h6>???????????????</h6>
							<tbody class="cartbody" style="color: black;">
							</tbody>
						</table>
						<a href="<%=request.getContextPath()%>/front-end/shop/order_confirm.jsp" class="btn btn-block btn-primary btn-sm text-white">????????????</a>
					</div>
				</div>
			</div>

			<a href="#" class="iconbth"><i class="fas fa-search fa-1x"
				style="color: white; font-size: 25px;"></i></a>

		</div>
		<!---------------------------------------------------------------------------------------------------------------------->
		<!--icon????????????top-flex???????????????????????????????????????777777-->

		<div class="Top-Flex">
			<div class="LOOP">
				<a class="two"
					href="<%=request.getContextPath()%>/back-end/listAllItem"> <img
					class="img-responsive"
					src="<%=request.getContextPath()%>/resources/images/Logo/MaoUni2.png"
					width="" alt="">
				</a>
			</div>
		</div>

		<div class="shopbody">
			<nav style="margin-bottom: -15px; margin-left: 15px;">
				<p class="hover-underline-animation pb-0">
					<a
						href="<%=request.getContextPath()%>/front-end/home/HomePage.jsp"
						style="font-size: 15px;">??? ???</a>
				</p>
				<p class="hover-underline-animation pb-0">
					<a
						href="<%=request.getContextPath()%>/front-end/shop/shopping_home.jsp"
						style="font-size: 15px;">????????????</a>
				</p>
				<p class="hover-underline-animation pb-0">
					<a
						href="<%=request.getContextPath()%>/front-end/member/grooming_home.jsp"
						style="font-size: 15px;">????????????</a>
				</p>
				<p class="hover-underline-animation pb-0">
					<a
						href="<%=request.getContextPath()%>/front-end/adopt/adopt_home.jsp"
						style="font-size: 15px;">????????????</a>
				</p>
				<p class="hover-underline-animation pb-0">
					<a
						href="<%=request.getContextPath()%>/front-end/article/listAllArt_f.jsp"
						style="font-size: 15px;">?????????</a>
				</p>
				<p class="hover-underline-animation pb-0">
					<a
						href="<%=request.getContextPath()%>/front-end/announcemet/listAllAnnf.jsp"
						style="font-size: 15px;">??????</a>
				</p>
			</nav>
		</div>
		<div class="Shopping-ul"></div>

	</header>

	<!--?????????header ***********************************************************************-->

	<div class="textttt" style="width: 100%; height: 2000px;">

		<table style="border: 3px #2F0000 dashed;" cellpadding="10" border='1'>
			<tr>
				<th>??????</th>
				<th>????????????</th>
				<th>????????????</th>
				<th>????????????</th>
				<th>????????????</th>
				<th>??????</th>
				<th>??????</th>
				<th>????????????</th>
				<th>??????</th>

			</tr>

			<c:forEach var="ImfVO" items="${list}">
				<tr>
					<td><img class="Photo"
						src="<%=request.getContextPath()%>/ImfPhotoServlet?AI_ID=${ImfVO.id}"></td>
					<td>${ImfVO.id}</td>

					<td><c:forEach var="VarietyVO" items="${varlist}">
						<c:if test="${ImfVO.adopt==VarietyVO.varId}">
	                 	 ${VarietyVO.varName}
                   	    </c:if>
						</c:forEach></td>
					<td>${ImfVO.mech2}</td>
					<td>
					<c:forEach var="MechanismVO" items="${Mechlist}">
						<c:if test="${ImfVO.mech==MechanismVO.id}">
						${MechanismVO.tel}
						</c:if>
					</c:forEach></td>
					<td>${ImfVO.name}</td>
					<td>${ImfVO.year}</td>
					<td>${ImfVO.sit}</td>

					<td>
						<form METHOD="post"
							ACTION="<%=request.getContextPath()%>/TrackingController"
							class="addTrack">
							<input type="hidden" name="memId" value="2"> <input
								type="hidden" name="id" value="${TackingVO.id}"> <input
								type="hidden" name="action" value="insertall">
							<button type="submit">????????????</button>
						</form>

					</td>
			</c:forEach>

		</table>

<!-- 		<form METHOD="post" -->
<%-- 			ACTION="<%=request.getContextPath()%>/TrackingController" class="confirm"> --%>
<%-- 			<input type="hidden" name="id" value="${memberVO.memId}"> <input --%>
<!-- 				type="hidden" name="action" value="getOne_For_Display"> -->
<!-- 			<button type="submit">????????????</button> -->
<!-- 		</form> -->

		<footer class="footer">
			<ul class="r-footer">
				<li>
					<h2>About</h2>
					<ul class="box">
						<li><a class="ff1" href="#">????????????</a></li>
						<li><a class="ff2" href="#">????????????</a></li>
						<li><a class="ff3" href="#">??????</a></li>
						<li><a class="ff4" href="#">FAQ</a></li>
					</ul>
				</li>

				<li>
					<h2>Service</h2>
					<ul class="box">
						<li><a class="ff5" href="#">???????????????</a></li>
						<li><a class="ff6" href="#">???????????????</a></li>
						<li><a class="ff7" href="#">??????????????????</a></li>
						<li><a class="ff8" href="#">??????????????????</a></li>
					</ul>
				</li>

				<li>
					<h2>Contact</h2>
					<ul class="box">
						<li><a class="ff9" href="#">????????????</a></li>
						<li><a class="ff10" href="#">LINE??????</a></li>
						<li><a class="ff11" href="#">????????????</a></li>
					</ul>
				</li>

				<li>
					<h2>Follow</h2>
					<ul class="box">
						<li class="ig"><a class="btn btn-primary"
							style="color: white; font-size: 14px; cursor: pointer; background: none; border: none;"><span
								class="fab fa-instagram"></span>&nbsp;????????????</a></li>
						<li class="fb"><a class="btn btn-primary"
							style="color: white; font-size: 16px; margin-top: -2px; cursor: pointer; background: none; border: none;"><span
								class="fab fa-facebook-square"></span>&nbsp;MaoUni</a></li>
					</ul>
				</li>
			</ul>
		</footer>

		<div class="b-footer">
			<p style="margin-bottom: 10px;">All rights reserved by ??MaoUni
				2021</p>
		</div>

		<script>
			//             ???????????????????????????????????????????????????????????????????????????????????????
			//             ????????????(scroll)???????????????
			window.addEventListener("scroll", function() {

				const header = document.querySelector('header');
				header.classList.toggle('sticky', window.scrollY > 0);
			});
		</script>


		<script>
			function sumbmitcheck() {
				console.log('hi')
			}

			function highLight() {
				obj = event.srcElement;
				obj.style.color = "#FFFF99";
				obj.style.backgroundColor = "#00FFFF";
			}
			function nocolor() {
				obj = event.srcElement;
				obj.style.color = "black";
				obj.style.backgroundColor = "white";
			}

			$(".addTrack").click(function(e) {
				e.preventDefault();
				$.ajax({
					url : "/MaoUni/TrackingController",
					type : "post",
					data : $(this).serialize(),
					success : function(data) {
						if (data === 0) {
							swal("???????????????", "????????????????????????????????????!", "warning");
						} else {
							swal("???????????????", "?????????????????????????????????!", "success");
						}
					}
				})
			});

			// 	$(".confirm").click(function(e){
			// 		e.preventDefault();
			// 		$.ajax({
			// 			url:"/MaoUni/TrackingController",
			// 			type:"post",
			// 			data: $(this).serialize(),
			// 			success: function(data){
			// 				if(data === 0){
			// 					swal("???????????????","????????????????????????????????????!","warning");
			// 				}else{
			// 					swal("???????????????","?????????????????????????????????!","success");
			// 				}
			// 			}
			// 		})
			// 	});
		</script>
		<script>
			const sessionId = "${sessionId}";
		</script>



		<!-- ?????????CDN?????? -->
		<script
			src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/js/shopping_cart.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/cmain.js"></script>
</body>
</html>