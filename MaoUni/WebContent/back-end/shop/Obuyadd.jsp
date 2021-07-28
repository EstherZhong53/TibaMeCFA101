<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.obuy.model.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<%
ObuyVO obuyVO = (ObuyVO) request.getAttribute("obuyVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>假裝自己是購物車</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>

<body>

<table id="table-1">
	<tr><td>
		 <h3>手動購物車</h3></td><td>
		 <h4><a href="member_select_page.jsp"><img src="" width="" height="" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/buy/obuy.do">
<table>
	<tr>
		<td>消費者編號:</td>
		<td><input type="text" name="oMemId" size="" value="${param.oMemId}"/></td>
	</tr>
	<tr>
		<td>總金額:</td>
		<td><input type="text" name="oMoney" size="" value="${param.oMoney}"/></td>
	</tr>
	<tr>
		<td>購買方式:</td>
		<td><input type="text" name="oPaying" size="" value="${param.oPaying}"/></td>
	</tr>
	<tr>
		<td>配送:</td>
		<td><input type="text" name="oSend" size="" value="${param.oSend}"/></td>
	</tr>
		<tr>
		<td>訂單備註:</td>
		<td><input type="text" name="obuyOther" size="" value="${param.obuyOther}"/></td>
	</tr>


</table>
<br>

<input type="hidden" name="action" value="insertWithco">
<input type="submit" value="送出新增">
</FORM>
</body>